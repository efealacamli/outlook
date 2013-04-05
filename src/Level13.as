package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level13 extends FlxState
	{
		[Embed(source = "../assets/level15.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
		[Embed(source = "../assets/levelTile.png")] public var mapTilesPNG:Class;
		[Embed(source = '../assets/specialStoneFX.mp3')] private var specialStoneSound:Class;		

		
		public var width:int;
		public var height:int;
		
		public var map:FlxTilemap;
		
		private var player:Player;
		private var specialStone:SpecialStone;
		private var enemyGroup:FlxGroup;
		
		private var platform1:Platform;
		private var platform2:Platform;
		private var platform3:Platform;
		private var platform4:Platform;
		private var platform5:Platform;
		private var platform6:Platform;
		
		private var levelBorder1:FlxTileblock;
		private var levelBorder2:FlxTileblock;
		private var levelBorder3:FlxTileblock;
		private var levelBorder4:FlxTileblock;	
		
		private var bgAnim:BackgroundAnimation;
		
		private var specialStoneFX:FlxSound;
		private var levelNumberText:FlxText;
	
		
		public function Level13() 
		{
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;

			player = new Player(156, 160);
			specialStone = new SpecialStone(156, 12);	

			enemyGroup = new FlxGroup();
			
			platform1 = new Platform(-48, 0, 6, 12, 8, -48, 48, 2);
			platform2 = new Platform(272, 0, 6, 12, 8, 272, 176, 3);
			platform3 = new Platform(16, 160, 2, 1, 25, 16, 112, 2);
			platform4 = new Platform(272, 128, 2, 1, 15, 272, 176, 3);
			platform5 = new Platform(16, 96, 2, 1, 10, 16, 112, 2);
			platform6 = new Platform(272, 64, 2, 1, 10, 272, 176, 3);
	
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 240, 320, 1);
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			bgAnim = new BackgroundAnimation();
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			
			levelNumberText = new FlxText(285, 228, 40, "L:13/19");
			
			add(bgAnim);
			

			add(platform3);
			add(platform4);
			add(platform5);
			add(platform6);
			add(platform1);		
			add(platform2);
			
			add(player);
			//add(enemy1);
			//add(enemy2);
			//enemyGroup.add(enemy1);
			//enemyGroup.add(enemy2);
			
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
			platform1.platformSoundFX.stop();
			platform1.platformSoundReverseFX.stop();			
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
			FlxG.switchState(new Level14);
		}
		
		private function hitEnemy(p:FlxObject, star:FlxObject):void {
			//FlxG.flash(0xffffffff, 0.75);
			//FlxG.fade(0xff000000, 1);
			FlxG.switchState(new Level13);
		}		
	}

}