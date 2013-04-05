package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class BackgroundAnimation extends FlxSprite
	{
		
		[Embed(source = '../assets/backgroundAnimationSprite2.png')] public var backgroundPNG:Class;
		
		private var backgroundAnimation:FlxSprite;
		
		public function BackgroundAnimation() 
		{
			
			super();
			
			loadGraphic(backgroundPNG, false, false, 320, 240, false);
			addAnimation("bgAnim", [0, 1, 2, 3, 2, 1,0], 5, false);
			
			solid = false;
			
		}

		override public function update():void
		{

			if (FlxG.keys.X) {
				play("bgAnim");
			}
		}
		

		
	}

}