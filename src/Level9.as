package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level9 extends FlxState
	{
		[Embed(source = "../assets/level11.csv", mimeType = "application/octet-stream")] public var level1CSV:Class;
		[Embed(source = "../assets/levelTile.png")] public var mapTilesPNG:Class;
		[Embed(source = '../assets/specialStoneFX.mp3')] private var specialStoneSound:Class;		

		
		public var width:int;
		public var height:int;
		
		public var map:FlxTilemap;
		
		private var player:Player;
		private var specialStone:SpecialStone;
		private var enemy:Enemy;
		private var enemyGroup:FlxGroup;
		
		private var levelBorder1:FlxTileblock;
		private var levelBorder2:FlxTileblock;
		private var levelBorder3:FlxTileblock;
		private var levelBorder4:FlxTileblock;	
		
		private var bgAnim:BackgroundAnimation;
		
		private var specialStoneFX:FlxSound;
		private var levelNumberText:FlxText;
		
		
		public function Level9() 
		{
			
			map = new FlxTilemap;
			map.loadMap(new level1CSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			//width = map.width;
			//height = map.height;

			player = new Player(32, 120);
			specialStone = new SpecialStone(260, 140);	
			enemy = new Enemy(180, 160, -15, 140, 220);
			enemyGroup = new FlxGroup();

			levelBorder1 = new FlxTileblock(0, -5, 320, 1);
			levelBorder2 = new FlxTileblock(320, 0, 1, 240);
			levelBorder3 = new FlxTileblock(0, 240, 320, 1);
			levelBorder4 = new FlxTileblock(0, 0, 1, 240);
			
			specialStoneFX = new FlxSound().loadEmbedded(specialStoneSound, false);
			
			bgAnim = new BackgroundAnimation();
			levelNumberText = new FlxText(285, 228, 40, "L:9/19");
			
			add(bgAnim);
			add(player);
			add(enemy);
			enemyGroup.add(enemy);

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
			FlxG.switchState(new Level10);
		}
		
		private function hitEnemy(p:FlxObject, star:FlxObject):void {
			FlxG.switchState(new Level9);
		}		
	}

}