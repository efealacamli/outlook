package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level10 extends FlxState
	{
		[Embed(source = "../assets/level11.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
		[Embed(source = "../assets/levelTile.png")] public var mapTilesPNG:Class;
		[Embed(source = '../assets/specialStoneFX.mp3')] private var specialStoneSound:Class;		

		
		public var width:int;
		public var height:int;
		
		public var map:FlxTilemap;
		
		private var player:Player;
		private var specialStone:SpecialStone;
		private var enemy1:Enemy;
		private var enemy2:Enemy;
		private var enemyGroup:FlxGroup;
		
		private var platform1:Platform;
		private var platform2:Platform;
		private var platform3:Platform;
		
		private var levelBorder1:FlxTileblock;
		private var levelBorder2:FlxTileblock;
		private var levelBorder3:FlxTileblock;
		private var levelBorder4:FlxTileblock;	
		
		private var bgAnim:BackgroundAnimation;	
		
		private var specialStoneFX:FlxSound;
		private var levelNumberText:FlxText;
		
		
		public function Level10() 
		{
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;

			player = new Player(32, 120);
			specialStone = new SpecialStone(260, 140);	
			enemy1 = new Enemy(100, 160, 75, 0, 315);
			enemy2 = new Enemy(250, 160, -75, 0, 315);
			enemyGroup = new FlxGroup();
			
			platform1 = new Platform(80, 176, 1, 2, 50, 176, 144, 0);
			platform2 = new Platform(220, 176, 1, 2, 50, 176, 144, 0);
			
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 240, 320, 1);
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			
			bgAnim = new BackgroundAnimation();
			levelNumberText = new FlxText(285, 228, 40, "L:10/19");
			
			add(bgAnim);
			add(platform1);		
			add(platform2);
			add(player);
			add(enemy1);
			add(enemy2);
			enemyGroup.add(enemy1);
			enemyGroup.add(enemy2);
			
			add(map);
			add(specialStone);
			add(levelBorder1);
			add(levelBorder2);
			add(levelBorder3);
			add(levelBorder4);
			add(levelNumberText);
		}
		
		override public function create():void{

		}	
		
		override public function update():void{
			super.update();
			FlxG.collide();
			FlxG.overlap(player, specialStone, hitSpecialStone);
			FlxG.overlap(player, enemyGroup, hitEnemy);
		}
		
		
		private function hitSpecialStone(p:FlxObject, star:FlxObject):void {
			specialStoneFX.play();
			specialStone.kill();
			platform1.platformSoundFX.stop();
			platform1.platformSoundReverseFX.stop();
			platform2.platformSoundFX.stop();
			platform2.platformSoundReverseFX.stop();	
			FlxG.switchState(new Level11);
		}
		
		private function hitEnemy(p:FlxObject, star:FlxObject):void {
			platform1.platformSoundFX.stop();
			platform1.platformSoundReverseFX.stop();
			platform2.platformSoundFX.stop();
			platform2.platformSoundReverseFX.stop();			
			FlxG.switchState(new Level10);
		}		
	}

}