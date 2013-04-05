package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level11 extends FlxState
	{
		[Embed(source = "../assets/level16.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
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
	
		
		public function Level11() 
		{
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;

			player = new Player(16, 5);
			specialStone = new SpecialStone(280, 30);	
			enemyGroup = new FlxGroup();
			
			platform1 = new Platform(0, 32, 3, 1, 25, 0, -48, 3);
			platform2 = new Platform(128, 256, 3, 4, 20, 256, -64, 0);
			platform3 = new Platform(368, 96, 2, 1, 10, 368, 0, 3);

	
			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 250, 320, 1); // a little bit below the normal boundary
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			bgAnim = new BackgroundAnimation();
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			
			levelNumberText = new FlxText(285, 228, 40, "L:11/19");
			
			add(bgAnim);
	
		
			add(platform1);		
			add(platform2);
			add(platform3);
			
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
				FlxG.switchState(new Level11);
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
			FlxG.switchState(new Level12);
		}
		
		private function hitEnemy(p:FlxObject, star:FlxObject):void {
			//FlxG.flash(0xffffffff, 0.75);
			//FlxG.fade(0xff000000, 1);
			FlxG.switchState(new Level11);
		}		
	}

}