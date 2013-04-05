package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level2 extends FlxState
	{
		[Embed(source = "../assets/level2.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
		[Embed(source = "../assets/levelTile.png")] public var mapTilesPNG:Class;
		[Embed(source = '../assets/specialStoneFX.mp3')] private var specialStoneSound:Class;		
		[Embed(source = '../assets/platformFX.mp3')] private var platformSound:Class;
		[Embed(source = '../assets/platformFXReverse.mp3')] private var platformSoundReverse:Class;			
				
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
		
		private var tutorialText1:FlxText;
		private var tutorialText2:FlxText;
		private var levelNumberText:FlxText;

		public function Level2() 
		{
			
			super();
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;

			bgAnim = new BackgroundAnimation();
			
			
			platform1 = new Platform(144, 0, 2, 8, 25, 0, -64, 0);
					
			player = new Player(10, 100);
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 240, 320, 1);
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			
			tutorialText1 = new FlxText(10, 50, 150, "Press and hold X key to travel in parallel universe");
			tutorialText2 = new FlxText(200, 90, 150, "Remember, you can not collect special stones in the parallel universe");
			levelNumberText = new FlxText(285, 228, 40, "L:2/19");

			add(bgAnim);
			add(player);
			add(platform1);
			add(map);
			add(levelBorder1);
			add(levelBorder2);
			add(levelBorder3);
			add(levelBorder4);
			add(specialStone);
			add(tutorialText1);
			add(tutorialText2);
			add(levelNumberText);
		
			
			
		}
		
		override public function create():void{
			
			
			
			FlxG.bgColor = 0xff000000;
			
			//player = new Player(10, 100);
	
	

			specialStone = new SpecialStone(270, 140);
			
			//add(player);
			//add(platform);
			//add(platform2);
			add(specialStone);
//			FlxG.play(specialStoneSound, 1, false);
			
		}
		
		override public function update():void{	
			super.update();
			FlxG.collide();
			FlxG.overlap(player, specialStone, hitSpecialStone);
/*			
			if (FlxG.keys.justPressed("X")) {
				FlxG.play(platformSound, 1, false);
			}
			else if(FlxG.keys.justReleased("X")){
				FlxG.pauseSounds();
				FlxG.play(platformSoundReverse, 1, false);				
			}
*/
		}
		
		
		private function hitSpecialStone(p:FlxObject, star:FlxObject):void {

			specialStoneFX.play();
			specialStone.kill();
			platform1.platformSoundFX.stop();
			platform1.platformSoundReverseFX.stop();
			FlxG.switchState(new Level3);

		}
	}

}