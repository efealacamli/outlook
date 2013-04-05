package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level18 extends FlxState
	{
		[Embed(source = "../assets/level9.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
		[Embed(source = "../assets/levelTile.png")] public var mapTilesPNG:Class;
		[Embed(source = '../assets/specialStoneFX.mp3')] private var specialStoneSound:Class;		

		
		public var width:int;
		public var height:int;
		
		public var map:FlxTilemap;
		public var stars:FlxGroup;
		
		private var platform1:Platform;
		private var platform2:Platform;
		private var platform3:Platform;
		private var platform4:Platform;
		private var platform5:Platform;
		private var platform6:Platform;
		private var platform7:Platform;
		private var platform8:Platform;

		
		
		private var player:Player;
		private var specialStone:SpecialStone;
		
		private var levelBorder1:FlxTileblock;
		private var levelBorder2:FlxTileblock;
		private var levelBorder3:FlxTileblock;
		private var levelBorder4:FlxTileblock;		
		
		private var bgAnim:BackgroundAnimation;
		
		private var specialStoneFX:FlxSound;
		private var levelNumberText:FlxText;
		
		
		public function Level18() 
		{
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;
			
			platform1 = new Platform(-224, 176, 16, 2, 50, -224, 32, 2);
			platform2 = new Platform(272, 144, 14, 2, 50, 272, 48, 3);
			platform3 = new Platform(-32, 112, 6, 2, 20, -32, 64, 2);
			platform4 = new Platform(256, 112, 6, 2, 20, 256, 160, 3);
			platform5 = new Platform(0, 80, 5, 2, 30, 0, 80, 2);		//eski hiz 50
			platform6 = new Platform(240, 80, 6, 2, 30, 240, 160, 3);	//eski hiz 50
			platform7 = new Platform(32, 48, 4, 2, 10, 32, 96, 2);
			platform8 = new Platform(224, 48, 4, 2, 10, 224, 160, 3);
			
			player = new Player(144, 180);
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 240, 320, 1);
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			
			bgAnim = new BackgroundAnimation();
			
			levelNumberText = new FlxText(285, 228, 40, "L:18/19");
			
			add(bgAnim);
			add(player);
			
			add(platform1);
			add(platform2);
			add(platform3);
			add(platform4);
			add(platform5);
			add(platform6);
			add(platform7);
			add(platform8);
			add(map);
			add(specialStone);
			add(levelBorder1);
			add(levelBorder2);
			add(levelBorder3);
			add(levelBorder4);			
			add(levelNumberText);
		}
		
		override public function create():void{
			
			FlxG.bgColor = 0xff000000;
			
			//player = new Player(32, 100);
	
	

			specialStone = new SpecialStone(152, 16);
			
			//add(player);
			//add(platform);
			//add(platform2);
			add(specialStone);
		}
		
		override public function update():void{
			
			super.update();
			FlxG.collide();
			FlxG.overlap(player, specialStone, hitSpecialStone);
			platform2.platformSoundFX.stop();
			platform2.platformSoundReverseFX.stop();
			platform4.platformSoundFX.stop();
			platform4.platformSoundReverseFX.stop();
			platform6.platformSoundFX.stop();
			platform6.platformSoundReverseFX.stop();
			platform8.platformSoundFX.stop();
			platform8.platformSoundReverseFX.stop();				
		}
		
		
		private function hitSpecialStone(p:FlxObject, star:FlxObject):void {
			specialStoneFX.play();
			specialStone.kill();
			platform1.platformSoundFX.stop();
			platform1.platformSoundReverseFX.stop();
			platform2.platformSoundFX.stop();
			platform2.platformSoundReverseFX.stop();
			platform3.platformSoundFX.stop();
			platform3.platformSoundReverseFX.stop();
			platform4.platformSoundFX.stop();
			platform4.platformSoundReverseFX.stop();
			platform5.platformSoundFX.stop();
			platform5.platformSoundReverseFX.stop();
			platform6.platformSoundFX.stop();
			platform6.platformSoundReverseFX.stop();
			platform7.platformSoundFX.stop();
			platform7.platformSoundReverseFX.stop();
			platform8.platformSoundFX.stop();
			platform8.platformSoundReverseFX.stop();	
			FlxG.switchState(new Level19);
		}
	}

}