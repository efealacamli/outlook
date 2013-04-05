package  
{

	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Enemy extends FlxSprite
	{
		
		[Embed(source = '../assets/enemy-sprite.png')] private var enemyPNG:Class;
		
		private var enemyStartPoint:int;
		private var enemyEndPoint:int;
		private var normalSpeed:int;
		
		public function Enemy(XPosition:Number, YPosition:Number, Speed:int, startPoint:int, endPoint:int) 
		{
			super(XPosition, YPosition);
			loadGraphic(enemyPNG, true, true, 14, 14, true);
			
			velocity.x = Speed;
			normalSpeed = Speed;
			//maxVelocity.x = Speed;
			enemyStartPoint = startPoint;
			enemyEndPoint = endPoint;
			acceleration.y = 200;
			
			addAnimation("walk", [1, 2, 3, 2, 1], 5, true);
			
			if (Speed < 0) {
				facing = LEFT;
			}
			else {
				facing = RIGHT;
			}
		}
		
		override public function update():void{
			super.update();
			play("walk");
			
			//FlxG.log("max vel" + this.maxVelocity.x );
			
			//FlxG.log("velo" + this.velocity.x);
			
			if (this.x  < enemyStartPoint) {
				//this.velocity.x = -this.velocity.x;
				//facing = RIGHT;
				turnAround();
			}
			else if (this.x > enemyEndPoint) {
				//this.velocity.x = -this.velocity.x;
				//facing = LEFT;
				turnAround();
			}
			
			if (justTouched(LEFT)) {
				facing = RIGHT;
				if (normalSpeed < 0) {
					this.velocity.x = -normalSpeed;
				}
				else {
					this.velocity.x = normalSpeed;
				}
				
			}
			if (justTouched(RIGHT)) {
				facing = LEFT;
				if (normalSpeed < 0) {
					this.velocity.x = normalSpeed;
				}
				else {
					this.velocity.x = -normalSpeed;
				}				
			}

		}
		
		private function turnAround():void
		{
			if (velocity.x < 0) {
				this.velocity.x = -this.velocity.x;
				facing = RIGHT;
			}
			else {
				this.velocity.x = -this.velocity.x;
				facing = LEFT;
			}
			
		}		
		
	}

}