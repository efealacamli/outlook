package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level3 extends FlxState
	{
		[Embed(source = "../assets/level1.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
		[Embed(source = "../assets/levelTile.png")] public var mapTilesPNG:Class;
		[Embed(source = '../assets/specialStoneFX.mp3')] private var specialStoneSound:Class;		

		
		public var width:int;
		public var height:int;
		
		public var map:FlxTilemap;
	
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

		
		
		public function Level3() 
		{
			
			super();
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;
			
			platform1 = new Platform(100, 160, 3, 1, 50, 160, 75, 0);

			player = new Player(32, 100);			

			bgAnim = new BackgroundAnimation();
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 240, 320, 1);
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);	
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			

			levelNumberText = new FlxText(285, 228, 40, "L:3/19");
			
			add(bgAnim);
			add(player);
			add(platform1);
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
			
			//player = new Player(10, 100);
	
	

			specialStone = new SpecialStone(200, 50);
			
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
			FlxG.switchState(new Level4);
			
		}
	}

}