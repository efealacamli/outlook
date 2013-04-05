package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level8 extends FlxState
	{
		[Embed(source = "../assets/level8.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
		[Embed(source = "../assets/levelTile.png")] public var mapTilesPNG:Class;
		[Embed(source = '../assets/specialStoneFX.mp3')] private var specialStoneSound:Class;		

		
		public var width:int;
		public var height:int;
		
		public var map:FlxTilemap;
		public var stars:FlxGroup;
		
		private var platform1:Platform;
		private var platform2:Platform;
		private var platform3:Platform;
		
		private var player:Player;
		private var specialStone:SpecialStone;
		
		private var levelBorder1:FlxTileblock;
		private var levelBorder2:FlxTileblock;
		private var levelBorder3:FlxTileblock;
		private var levelBorder4:FlxTileblock;		
		
		private var bgAnim:BackgroundAnimation;	
		
		private var specialStoneFX:FlxSound;
		private var levelNumberText:FlxText;
		
		
		public function Level8() 
		{
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;
			
			platform1 = new Platform(0, 80, 2, 1, 50, 0, 50, 2);
			platform2 = new Platform(140, 70, 2, 1, 75, 70, 250, 1);
			platform3 = new Platform(288, 80, 2, 1, 15, 288, 210, 3);
			
			player = new Player(10, 10);
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 250, 320, 1); // a little bit below the normal boundary
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);			
			
			bgAnim = new BackgroundAnimation();
			
			levelNumberText = new FlxText(285, 228, 40, "L:8/19");
			
			add(bgAnim);
			add(player);

			add(platform1);
			add(platform2);
			add(platform3);
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
	
	

			specialStone = new SpecialStone(300, 60);
			
			//add(player);
			//add(platform);
			//add(platform2);
			add(specialStone);
		}
		
		override public function update():void{
			
			super.update();
			FlxG.collide();
			FlxG.overlap(player, specialStone, hitSpecialStone);
			
			if (player.y > 238) {
				platform1.platformSoundFX.stop();
				platform1.platformSoundReverseFX.stop();
				platform2.platformSoundFX.stop();
				platform2.platformSoundReverseFX.stop();
				platform3.platformSoundFX.stop();
				platform3.platformSoundReverseFX.stop();				
				FlxG.switchState(new Level8);
			}			
			
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
			FlxG.switchState(new Level9);
		}
	}

}