package
{
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	
	public class Player extends FlxSprite 
	{
		
		[Embed(source = '../assets/char-sprite.png')] private var playerPNG:Class;
		
		public function Player(X:Number, Y:Number)
		{	
			
			//	As this extends FlxSprite we need to call super() to ensure all of the parent variables we need are created
			super(X, Y);
			
			//	Load the player.png into this sprite.
			//	The 2nd parameter tells Flixel it's a sprite sheet and it should chop it up into 16x20 sized frames.
			loadGraphic(playerPNG, true, true, 16, 20, true);
			
			//	The sprite is 16x18 in size, but that includes a little feather of hair on its head which we don't want to include in collision checks.
			//	We also shave 2 pixels off each side to make it slip through gaps easier. Changing the width/height does NOT change the visual sprite, just the bounding box used for physics.
			
			width = 10;
			height = 18;
			
			//	Because we've shaved a few pixels off, we need to offset the sprite to compensate
			offset.x = 3;
			offset.y = 2;

			
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [1, 2, 3, 4, 3, 2, 1], 10, true);
			addAnimation("jump", [5], 0, false);
			//addAnimation(
			//addAnimation("jump", [1], 0, false);
			//addAnimation("hurt", [4], 0, false);
			
			
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			//	Add this sprite to the FlxControl plugin and tell it we want the sprite to accelerate and decelerate smoothly
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);			
			
			
			//	Sprite will be controlled with the left and right cursor keys
			FlxControl.player1.setCursorControl(false, false, true, true);
			
			
			//	And SPACE BAR will make them jump up to a maximum of 200 pixels (per second), only when touching the FLOOR
			FlxControl.player1.setJumpButton("UP", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR, 250, 200);
			
			//	Stop the player running off the edge of the screen and falling into nothing
			//FlxControl.player1.setBounds(16, 0, 288, 240);
			
			//	Because we are using the MOVEMENT_ACCELERATES type the first value is the acceleration speed of the sprite
			//	Think of it as the time it takes to reach maximum velocity. A value of 100 means it would take 1 second. A value of 400 means it would take 0.25 of a second.
			FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
			
			//	Set a downward gravity of 400px/sec
			FlxControl.player1.setGravity(0, 400);
			
			//	By default the sprite is facing to the right.
			//	Changing this tells Flixel to flip the sprite frames to show the left-facing ones instead.
			facing = FlxObject.RIGHT;			
			
			
			
		}
		
		
		override public function update():void
		{
			super.update();
			
			if (touching == FlxObject.FLOOR)
			{
				if (velocity.x != 0)
				{
					play("walk");
				}
				else
				{
					play("idle");
				}
			}
			else if (velocity.y < 0)
			{
				play("jump");
			}			
			
		}		
		
	}
	
}