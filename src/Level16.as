package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level16 extends FlxState
	{
		[Embed(source = "../assets/level10.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
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
		private var platform9:Platform;
		

		
		
		private var player:Player;
		private var specialStone:SpecialStone;
		
		private var levelBorder1:FlxTileblock;
		private var levelBorder2:FlxTileblock;
		private var levelBorder3:FlxTileblock;
		private var levelBorder4:FlxTileblock;	
		
		private var bgAnim:BackgroundAnimation;
		
		private var specialStoneFX:FlxSound;
		private var levelNumberText:FlxText;
		
		
		public function Level16() 
		{
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;
			
			platform1 = new Platform(48, 192, 2, 1, 50, 48, 80, 2);	//eski
			platform2 = new Platform(192, 160, 3, 1, 35, 192, 240, 2);	//eski	33	
			platform3 = new Platform(192, 112, 3, 1, 100, 192, 240, 2);
			platform4 = new Platform(48, 80, 3, 1, 100, 48, 80, 2);
			
			platform5 = new Platform(192, 48, 1, 1, 60, 192, 240, 2);	//eski hiz 40

			
			player = new Player(144, 180);
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 240, 320, 1);
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			bgAnim = new BackgroundAnimation();
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			levelNumberText = new FlxText(285, 228, 40, "L:16/19");

			
			add(bgAnim);
			add(player);

						
			
			add(platform1);
			add(platform2);
			add(platform3);
			add(platform4);
			add(platform5);
			//add(platform6);
			//add(platform7);
			//add(platform8);
			//add(platform9);

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
	
	

			specialStone = new SpecialStone(222, 16);
			
			//add(player);
			//add(platform);
			//add(platform2);
			add(specialStone);
		}
		
		override public function update():void{
			
			super.update();
			FlxG.collide();
			FlxG.overlap(player, specialStone, hitSpecialStone);
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
			FlxG.switchState(new Level17);
		}
	}

}