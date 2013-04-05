package  
{
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class SpecialStone extends FlxSprite
	{
		
		[Embed(source = '../assets/specialstone12px-sprite-all.png')] private var specialStonePNG:Class;
		
		public function SpecialStone(X:Number, Y:Number) 
		{
		
			super(X,Y);
			loadGraphic(specialStonePNG, true, true, 12, 12, true);
			addAnimation("glow", [0, 1, 2, 3, 2, 1], 3, true);
			addAnimation("glowEmpty", [4, 5, 6, 7, 6, 5], 3, true);
			solid = true;
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.X) {
				allowCollisions = NONE;
				play("glowEmpty");
			}
			else {
				allowCollisions = ANY;
				play("glow");
			}
		}	
		
		
		
	}

}