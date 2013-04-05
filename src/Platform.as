package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Platform extends FlxSprite
	{
		
		[Embed(source = '../assets/tile3.png')] private var platformPNG:Class;
		[Embed(source = '../assets/platformFX.mp3')] public var platformSound:Class;
		[Embed(source = '../assets/platformFXReverse.mp3')] public var platformSoundReverse:Class;		
		
		public var moveX:Boolean = false;
		public var moveY:Boolean = false;
		private var platformStartPoint:int;
		private var platformEndPoint:int;
		private var normalSpeed:int;
		private var movementType:int;
		public var platformSoundFX:FlxSound;
		public var platformSoundReverseFX:FlxSound;
		
		
		public function Platform(XPosition:Number, YPosition:Number, Width:Number, Height:Number, Speed:int, startPoint:int, endPoint:int, movementCode:int) 
		{

			super(XPosition, YPosition);
			this.height = 16 * Height;
			this.width = 16 * Width;
			//loadGraphic(platformPNG, true, false, this.width, this.height, true);	
			loadGraphic(platformPNG, false, false, this.width, this.height, true);
/*			
			var i:int = 0;
			while (i < width) {
				var this:FlxSprite = new FlxSprite(x + (i * 32), y);
				
			}
*/	
			immovable = true;
			maxVelocity.y = Speed;
			maxVelocity.x = Speed;
			normalSpeed = Speed;
			platformStartPoint = startPoint;
			platformEndPoint = endPoint;
			movementType = movementCode	//0:down to up	1:up to down  2:left to right 3:right to left
			
			//platformSoundz = FlxG.loadSound(platformSound, 1, true);
			platformSoundFX = new FlxSound().loadEmbedded(platformSound, false);
			platformSoundReverseFX = new FlxSound().loadEmbedded(platformSoundReverse, false);
			//platformSoundFX= FlxG.loadSound(platformSound, 1, true);
			//platformSoundReverseFX = FlxG.loadSound(platformSoundReverse, 1, true);			
			

		
			
		}
		

		
		
		override public function update():void {

/*	
			if (FlxG.keys.justPressed("X")) {
				FlxG.play(platformSound, 1, false);
			}
			else if(FlxG.keys.justReleased("X")){
				FlxG.pauseSounds();
				FlxG.play(platformSoundReverse, 1, false);				
			}			
*/			

			if (movementType == 0) {
				if (FlxG.keys.X) {
					if (this.y > platformEndPoint) {
						//platform.y = platform.y - (90) * 0.01;
						this.velocity.y -= this.maxVelocity.y;
						platformSoundReverseFX.stop();
						platformSoundFX.play();
					}
					else{
						this.y = platformEndPoint;
						this.velocity.y = 0;
						platformSoundReverseFX.stop();
						platformSoundFX.stop();

					}

				}
				else {
					if (this.y < platformStartPoint) {
						this.velocity.y += this.maxVelocity.y;
						platformSoundFX.stop();
						platformSoundReverseFX.play();
						//platform.y = platform.y - (platform.y - platformYFirstPosition) * 0.1;
						//platform2.y = platform2.y - (platform2.y - platform2YFirstPosition) * 0.1;
						//FlxG.log("sadas");
						//FlxG.log(platform.y + "platform.y");
					}
					else {
						this.y = platformStartPoint;
						platformSoundReverseFX.stop();
					}			
					
				}
			}
			
			else if (movementType == 1) {
				 //up to down movement
				if (FlxG.keys.X) {
					if (this.y < platformEndPoint) {
						//platform.y = platform.y - (90) * 0.01;
						this.velocity.y += this.maxVelocity.y;
						platformSoundReverseFX.stop();
						platformSoundFX.play();
					}
					else{
						this.y = platformEndPoint;
						this.velocity.y = 0;
						platformSoundReverseFX.stop();
						platformSoundFX.stop();						
					}

				}
				else {
					if (this.y > platformStartPoint) {
						this.velocity.y -= this.maxVelocity.y;
						platformSoundFX.stop();
						platformSoundReverseFX.play();						
					}
					else {
						this.y = platformStartPoint;
						this.velocity.y = 0;
						platformSoundReverseFX.stop();						
					}			
					
				}	
			}

			else if (movementType == 2) {
				if (FlxG.keys.X) {
					if (this.x < platformEndPoint) {
						//platform.y = platform.y - (90) * 0.01;
						this.velocity.x += this.maxVelocity.x;
						platformSoundReverseFX.stop();
						platformSoundFX.play();						
					}
					else{
						this.x = platformEndPoint;
						this.velocity.x = 0;
						platformSoundReverseFX.stop();
						platformSoundFX.stop();							
					}

				}
				else {
					if (this.x > platformStartPoint) {
						this.velocity.x -= this.maxVelocity.x;
						platformSoundFX.stop();
						platformSoundReverseFX.play();							
					}
					else {
						this.x = platformStartPoint;
						this.velocity.x = 0;
						platformSoundReverseFX.stop();						
					}			
					
				}					
			}
			
			else if (movementType == 3) {
				if (FlxG.keys.X) {
					if (this.x > platformEndPoint) {
						//platform.y = platform.y - (90) * 0.01;
						this.velocity.x -= this.maxVelocity.x;
						platformSoundReverseFX.stop();
						platformSoundFX.play();								
					}
					else{
						this.x = platformEndPoint;
						this.velocity.x = 0;
						platformSoundReverseFX.stop();
						platformSoundFX.stop();							
					}

				}
				else {
					if (this.x < platformStartPoint) {
						this.velocity.x += this.maxVelocity.x;
						platformSoundFX.stop();
						platformSoundReverseFX.play();							
						//platform.y = platform.y - (platform.y - platformYFirstPosition) * 0.1;
						//platform2.y = platform2.y - (platform2.y - platform2YFirstPosition) * 0.1;
						//FlxG.log("sadas");
						//FlxG.log(platform.y + "platform.y");
					}
					else {
						this.x = platformStartPoint;
						platformSoundReverseFX.stop();						
					}			
					
				}
			}			

		}
		
	}

}