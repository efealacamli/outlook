package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level15 extends FlxState
	{
		[Embed(source = "../assets/level17.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
		[Embed(source = "../assets/levelTile.png")] public var mapTilesPNG:Class;
		[Embed(source = '../assets/specialStoneFX.mp3')] private var specialStoneSound:Class;		

		
		public var width:int;
		public var height:int;
		
		public var map:FlxTilemap;
		
		private var player:Player;
		private var specialStone:SpecialStone;
		private var enemy1:Enemy;
		private var enemy2:Enemy;
		private var enemy3:Enemy;
		private var enemy4:Enemy;
		private var enemy5:Enemy;
		private var enemy6:Enemy;		
		private var enemyGroup:FlxGroup;
		
		private var platform1:Platform;
		private var platform2:Platform;
		private var platform3:Platform;
		private var platform4:Platform;
		private var platform5:Platform;
		private var platform6:Platform;
		private var platform7:Platform;
		private var platform8:Platform;
		
		private var levelBorder1:FlxTileblock;
		private var levelBorder2:FlxTileblock;
		private var levelBorder3:FlxTileblock;
		private var levelBorder4:FlxTileblock;	
		
		private var bgAnim:BackgroundAnimation;
		
		private var specialStoneFX:FlxSound;
		private var levelNumberText:FlxText;
	
		
		public function Level15() 
		{
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;

			player = new Player(156, 160);
			specialStone = new SpecialStone(156, 12);	
			enemy1 = new Enemy(32, 176, 25, 5, 315);
			enemy2 = new Enemy(288, 176, -25, 5, 315);
	
			enemyGroup = new FlxGroup();
			
			platform1 = new Platform( 64, 0, 2, 13, 10, 0, -208, 0);
			platform2 = new Platform( 224, 0, 2, 13, 10, 0, -208, 0);
			
			platform3 = new Platform(-48, 160, 3, 1, 25, -48, 320, 2);
			platform4 = new Platform(320, 144, 3, 1, 25, 320, -48, 3);
			platform5 = new Platform(-32, 96, 2, 1, 25, -32, 320, 2);
			platform6 = new Platform(320, 80, 2, 1, 25, 320, -32, 3);
			platform7 = new Platform(-16, 64, 1, 1, 25, -16, 320, 2);
			platform8 = new Platform(320, 48, 1, 1, 25, 320, -16, 3);			
	
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 240, 320, 1);
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			bgAnim = new BackgroundAnimation();
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			
			levelNumberText = new FlxText(285, 228, 40, "L:15/19");
			
			add(bgAnim);
			

			add(platform3);
			add(platform4);
			add(platform5);
			add(platform6);
			add(platform7);
			add(platform8);			
			//add(platform1);		
			//add(platform2);
			
			
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
			platform3.platformSoundFX.stop();
			platform3.platformSoundReverseFX.stop();
			platform5.platformSoundFX.stop();
			platform5.platformSoundReverseFX.stop();
			platform7.platformSoundFX.stop();
			platform7.platformSoundReverseFX.stop();		
		}
		
		
		private function hitSpecialStone(p:FlxObject, star:FlxObject):void {
			specialStoneFX.play();
			specialStone.kill();
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
			FlxG.switchState(new Level16);
		}
		
		private function hitEnemy(p:FlxObject, star:FlxObject):void {
			//FlxG.flash(0xffffffff, 0.75);
			//FlxG.fade(0xff000000, 1);
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
			FlxG.switchState(new Level15);
		}		
	}

}