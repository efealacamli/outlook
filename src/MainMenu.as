package  
{
	
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class MainMenu extends FlxState
	{
		
		[Embed(source = '../assets/menuBackgroundImage.png')] private var menuBackgroundImagePNG:Class;
		[Embed(source = '../assets/outlook-menuLogo.png')] private var menuBackgroundLogoPNG:Class;
		[Embed(source = '../assets/creditsButtonAnim.png')] private var creditsButtonPNG:Class;
		[Embed(source = '../assets/playButtonAnim.png')] private var playButtonPNG:Class;
		[Embed(source = '../assets/menuGuideIcon.png')] private var menuGuideIconPNG:Class;
		[Embed(source = '../assets/outlookMenuMusic.mp3')] private var menuMusic:Class;
		
		
		private var menuBackgroundImage:FlxSprite;		
		private var menuBackgroundLogo:FlxSprite;
		private var creditsButton:FlxSprite;
		private var playButton:FlxSprite;
		private var menuGuideIcon:FlxSprite;
		private var playButtonIsActive :Boolean;

		
		
		public function MainMenu() {
			
			menuBackgroundImage = new FlxSprite(0, 0);
			menuBackgroundImage.loadGraphic(menuBackgroundImagePNG, false, false, 320, 240);
			menuBackgroundImage.addAnimation("menuBgAnim", [0, 1, 2, 1, 0, 2], 2, false);
			menuBackgroundImage.solid = false;
			
			
			menuBackgroundLogo = new FlxSprite(20, 40);
			menuBackgroundLogo.loadGraphic(menuBackgroundLogoPNG, false, false, 0, 0);
			
			creditsButton = new FlxSprite(95, 170);
			creditsButton.loadGraphic(creditsButtonPNG, false, false, 130, 50);
			creditsButton.addAnimation("creditsButtonAnim", [0, 1, 0], 5, false);
			creditsButton.addAnimation("creditsButtonIdle", [0], 5, false);
			
			
			playButton = new FlxSprite(110, 120);
			playButton.loadGraphic(playButtonPNG, false, false, 100, 50);
			playButton.addAnimation("playButtonAnim", [0, 1, 0], 5, false);		
			playButton.addAnimation("playButtonIdle", [0], 5, false);
			
			menuGuideIcon = new FlxSprite(10, 180);
			menuGuideIcon.loadGraphic(menuGuideIconPNG, false, false, 0, 0);
			

			add(menuBackgroundImage);			
			add(menuBackgroundLogo);
			add(playButton);
			add(creditsButton);
			add(menuGuideIcon);
			
			playButtonIsActive = true;
			FlxG.bgColor = 0x4D1747;
			
		}
	
		override public function create() :void {
		
			FlxG.playMusic(menuMusic, 1.0);
		}
        override public function update():void
        {
			menuBackgroundImage.play("menuBgAnim");
			//FlxG.playMusic(menuMusic, 1);

			
			if (FlxG.keys.DOWN) {
				playButtonIsActive = false;
			}
			else if (FlxG.keys.UP) {
				playButtonIsActive = true;
			}			
			
			
			
			if (playButtonIsActive) {
				playButton.play("playButtonAnim");
				if (FlxG.keys.ENTER) {
					FlxG.switchState(new Level0);
					FlxG.pauseSounds();
				}
			}
			else {
				creditsButton.play("creditsButtonAnim");
				if (FlxG.keys.ENTER) {
					FlxG.switchState(new Credits);
				}				
			}
            super.update();
        }
		
        private function onFade():void
        {
            FlxG.switchState(new Level1);
        }
		
		
	}

}