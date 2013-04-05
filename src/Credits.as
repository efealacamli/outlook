package  
{
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Credits extends FlxState
	{
		[Embed(source = '../assets/creditsGuideIcon.png')] private var creditsGuideIconPNG:Class;
		[Embed(source = '../assets/creditsImage.png')] private var creditsImagePNG:Class;

		private var creditsGuideIcon:FlxSprite;
		private var creditsImage:FlxSprite;
		
		public function Credits() 
		{
			
			creditsGuideIcon = new FlxSprite(10, 20);
			creditsGuideIcon.loadGraphic(creditsGuideIconPNG, false, false, 0, 0, false);
			
			creditsImage = new FlxSprite(60, 90);
			creditsImage.loadGraphic(creditsImagePNG, false, false, 0, 0, false);
			
			
			add(creditsGuideIcon);
			add(creditsImage);
			
		}
		
        override public function update():void {
			
			if (FlxG.keys.ESCAPE) {
				FlxG.switchState(new MainMenu);
			}
			
		}		
		
	}

}