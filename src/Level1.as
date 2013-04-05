package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level1 extends FlxState
	{
		[Embed(source = "../assets/level1.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
		[Embed(source = "../assets/levelTile.png")] public var mapTilesPNG:Class;
		[Embed(source = '../assets/specialStoneFX.mp3')] private var specialStoneSound:Class;		
		[Embed(source = '../assets/platformFX.mp3')] private var platformSound:Class;
		[Embed(source = '../assets/platformFXReverse.mp3')] private var platformSoundReverse:Class;		

		

		
		public var width:int;
		public var height:int;
		
		public var map:FlxTilemap;
		
		private var player:Player;
		private var specialStone:SpecialStone;
		
		private var levelBorder1:FlxTileblock;
		private var levelBorder2:FlxTileblock;
		private var levelBorder3:FlxTileblock;
		private var levelBorder4:FlxTileblock;
		
		private var bgAnim:BackgroundAnimation;
		
		private var specialStoneFX:FlxSound;
		
		private var tutorialText1:FlxText;
		private var tutorialText2:FlxText;
		private var levelNumberText:FlxText;
		

		
		public function Level1() 
		{
			
			super();
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);	//en sondaki Dame'deki tileID
			
			//width = map.width;
			//height = map.height;	
			
			bgAnim = new BackgroundAnimation();
			
			
			player = new Player(32, 100);
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 240, 320, 1);
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			
			tutorialText1 = new FlxText(10, 50, 300, "Use LEFT and RIGHT arrow keys to move");
			tutorialText2 = new FlxText(10, 70, 300, "	 UP arrow key to jump");
			levelNumberText = new FlxText(285, 228, 40, "L:1/19");
			
			add(bgAnim);			
			add(player);
			add(map);
			add(levelBorder1);
			add(levelBorder2);
			add(levelBorder3);
			add(levelBorder4);
			add(bgAnim);
			add(tutorialText1);
			add(tutorialText2);
			add(levelNumberText);

			
		}
		
		override public function create():void{
			FlxG.bgColor = 0xff000000;
			
			//player = new Player(10, 100);

			specialStone = new SpecialStone(250, 105);
			
			add(player);
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
			FlxG.switchState(new Level2);
			
		}
		
		
		
	}

}