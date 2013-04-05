package
{
	import adobe.utils.CustomActions;
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{	
		private var player:Player;
		private var floor:FlxSprite;
		private var platform:FlxSprite;
		private var platform2:FlxSprite;
		//private var platform:FlxTileblock;
		//private var platform2:FlxTileblock;
		private var platformYFinalPosition:int = 100;
		private var platformYFirstPosition:int = 190;
		private var platform2YFinalPosition:int = 70;
		private var platform2YFirstPosition:int = 190;
		private var specialStone:SpecialStone;
		
		private var canMove:Boolean = false;
		
		private var level:Level1;
			
		public function PlayState()
		{
		}
		
		override public function create():void{
			
			level = new Level1;
			
			
			FlxG.bgColor = 0xff000000;
			
			player = new Player(32, 100);
			
			floor = new FlxSprite(50, 130);
			floor.makeGraphic(32, 32, 0xff689c16);	
			floor.maxVelocity.y = 2;
			floor.acceleration.y = 2;

			
			platform = new FlxSprite(100, 190);
			platform.makeGraphic(50, 100, 0xff689c16);
			platform.maxVelocity.y = 100;
			//platform.acceleration.y =500;				
			platform.immovable = true;
			
			platform2 = new FlxSprite(175, 190);
			platform2.makeGraphic(50, 100, 0xff689c16);
			platform2.maxVelocity.y = 100;
			//platform2.acceleration.y = 500;
			platform2.immovable = true;			

			specialStone = new SpecialStone(250, 105);
			
			add(player);
			//add(floor);
			add(level);
			//add(platform);
			//add(platform2);
			//add(level.stars);
			add(specialStone);
			
		}
		
		override public function update():void{
			
			super.update();
			/*
			FlxG.collide(player, floor);
			FlxG.collide(player, platform);
			FlxG.collide(player, platform2);
			FlxG.collide(player, level);
			FlxG.overlap(player, level.stars, hitStar);
			*/
			FlxG.collide();
			FlxG.overlap(player, specialStone, hitSpecialStone);
			
			
			
			//platform.y = (platformYFinalPosition - platform.y) * 0.0001;
			//platform.y = platform.y - 0.1 * 5;
			
			//platform.y = platform.y + (platform.y - platformYFinalPosition) * 0.01;
			
			FlxG.log("platform.y " + platform.y);

			
//eski movement

			if (FlxG.keys.X) {
				if (platform.y > platformYFinalPosition) {
					//platform.y = platform.y - (90) * 0.01;
					platform.velocity.y -= platform.maxVelocity.y;
				}
				else{
					platform.y = platformYFinalPosition;
					platform.velocity.y = 0;
				}
				
				if (platform2.y > platform2YFinalPosition) {
					//platform.y = platform.y - (90) * 0.01;
					platform2.velocity.y -= platform2.maxVelocity.y;
				}
				else if (platform2.y = platform2YFinalPosition) {
					platform2.y = platform2YFinalPosition;
					platform2.velocity.y = 0;
				}
				
				//platform.y = platform.y - (platform.y - platformYFinalPosition) * 0.001;
				//platform2.y = platform2.y - (platform2.y - platform2YFinalPosition) * 0.1;
				
				//FlxG.log("13213123");

			}
			else {
				if (platform.y < platformYFirstPosition) {
					platform.velocity.y += platform.maxVelocity.y;
					//platform.y = platform.y - (platform.y - platformYFirstPosition) * 0.1;
					//platform2.y = platform2.y - (platform2.y - platform2YFirstPosition) * 0.1;
					//FlxG.log("sadas");
					//FlxG.log(platform.y + "platform.y");
				}
				else {
					platform.y = platformYFirstPosition;
				}			
				if (platform2.y  < platform2YFirstPosition) {
					platform2.velocity.y += platform2.maxVelocity.y;
				}
				else {
					platform2.y = platform2YFirstPosition;
				}
				
			}
//eski movement bitis			
			floor.velocity.y -= floor.maxVelocity.y;
			
/*			
//yeni movement deneme baslangic			
			if (FlxG.keys.X) {
				canMove = true;
			}
			else {
				canMove = false;
			}
			
			
			if (canMove) {
				
				if (platform.y > platformYFinalPosition)
				{
					platform.y = platform2YFinalPosition;
					//platform.velocity.y = -platform.velocity.y;
					platform.velocity.y += platform.maxVelocity.y;
				}
				else if (platform.y < platformYFirstPosition) {
					platform.y = platform2YFirstPosition;
					platform.velocity.y = -platform.velocity.y;
					
				}
				
				
			}
			else {
				
			}			
//yeni movement bitis
*/
			//FlxG.log("olalalala");
		}
			
		
		private function hitStar(p:FlxObject, star:FlxObject):void
		{
			star.kill();
			//TO-DO level change
		}
		
		private function hitSpecialStone(p:FlxObject, star:FlxObject):void {
			specialStone.kill();
			FlxG.switchState(new Level2);
		}
		
	}
}