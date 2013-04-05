package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level12 extends FlxState
	{
		[Embed(source = "../assets/level19.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
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
	
		
		public function Level12() 
		{
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;

			player = new Player(16, 170);
			specialStone = new SpecialStone(32, 12);	
		
	
			enemyGroup = new FlxGroup();

			
			platform1 = new Platform( 80, 240, 3, 1, 40, 240, 160, 0);
			platform2 = new Platform( 192, 240, 3, 1, 30, 240, 112, 0);
			platform3 = new Platform(320, 96, 2, 1, 30, 320, 172, 3);
			platform4 = new Platform(320, 48, 1, 1, 10, 320, 96, 3);
			platform5 = new Platform( -16, 64, 1, 1, 50, -16, 320, 2);			
			platform6 = new Platform(320, 112, 1, 1, 60, 320, -16, 3);
			platform7 = new Platform(320, 64, 1, 1, 50, 320, -16, 3);			
			//platform7 = new Platform(-16, 164, 1, 1, 25, -16, 128, 2);
			//platform8 = new Platform(320, 48, 1, 1, 25, 320, -16, 3);				
			
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 250, 320, 1);			
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			bgAnim = new BackgroundAnimation();
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			
			levelNumberText = new FlxText(285, 228, 40, "L:12/19");
			
			add(bgAnim);
			

			add(platform1);
			add(platform2);
			add(platform3);
			add(platform4);			
			//add(platform5);
			//add(platform6);
			//add(platform7);
			//add(platform8);			
			//add(platform1);		
			//add(platform2);
			
			
			add(player);
				
		
			
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
			
			if (player.y > 238) {
				platform1.platformSoundFX.stop();
				platform1.platformSoundReverseFX.stop();
				platform2.platformSoundFX.stop();
				platform2.platformSoundReverseFX.stop();
				platform3.platformSoundFX.stop();
				platform3.platformSoundReverseFX.stop();
				platform4.platformSoundFX.stop();
				platform4.platformSoundReverseFX.stop();				
				FlxG.switchState(new Level12);
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
			platform4.platformSoundFX.stop();
			platform4.platformSoundReverseFX.stop();		
			FlxG.switchState(new Level13);
		}
		
		private function hitEnemy(p:FlxObject, star:FlxObject):void {
			//FlxG.flash(0xffffffff, 0.75);
			//FlxG.fade(0xff000000, 1);
			FlxG.switchState(new Level12);
		}		
	}

}