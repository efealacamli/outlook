package  
{
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class Level0 extends FlxState
	{
		
		
		[Embed(source = '../assets/level0Music.mp3')] private var level0Audio:Class;

		private var storyText1:FlxText;
		private var storyText2:FlxText;
		private var storyText3:FlxText;
		private var storyText4:FlxText;
		private var storyText5:FlxText;
		private var storyText6:FlxText;
		
		private var level0Music:FlxSound;		
		
		public function Level0() 
		{
		
			storyText1 = new FlxText(20, 40, 200, "Dear Diary,");
			storyText2 = new FlxText(20, 60, 310, "I remember the day, when I first traveled in a parallel universe. That was pretty crazy.");
			storyText3 = new FlxText(20, 90, 300, "Well, I need to do it again. I need some special stones for a secret project. I can only get to them through hidden paths in a parallel universe.");
			storyText4 = new FlxText(20, 130, 300, "I swear, it's going to be my last trip, because I don't want to lose anyone again. I miss her so much...");
			storyText5 = new FlxText(20, 160, 300, "-Sam");
			storyText6 = new FlxText(260, 200, 50, "Press Enter to continue");
			
			storyText6.color = 0xC2CA35;
			
			level0Music = new FlxSound().loadEmbedded(level0Audio, true);
			
			
			add(storyText1);
			add(storyText2);
			add(storyText3);
			add(storyText4);
			add(storyText5);
			add(storyText6);
			
			level0Music.play();
			
		}

		override public function create() :void {
		
			//FlxG.playMusic(level0Music, 1.0);
		}			
		
        override public function update():void {
			
			if (FlxG.keys.ENTER) {
				level0Music.stop();
				FlxG.switchState(new Level1);
			}
			
		}		
		
	}

}