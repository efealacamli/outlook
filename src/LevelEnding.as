package  
{
	import org.flixel.*;
	
	/**
	$(CBI)* ...
	$(CBI)* @author Efe Alacamli
	$(CBI)*/
	public class LevelEnding extends FlxState
	{

		[Embed(source = '../assets/levelEndMusic.mp3')] private var level15Music:Class;
		
		
		private var storyText1:FlxText;
		private var storyText2:FlxText;
		private var storyText3:FlxText;
		private var storyText4:FlxText;
		private var storyText5:FlxText;
		private var storyText6:FlxText;
		private var storyText7:FlxText;
		
		
		public function LevelEnding() 
		{
			storyText1 = new FlxText(20, 30, 200, "I collected enough special stones to solve the problem wıth the machine.");
			storyText2 = new FlxText(20, 60, 310, "Let's see... I should put these glowing beauties in here and turn it on. Hope it will work...");
			storyText3 = new FlxText(20, 100, 300, "YES! IT'S WORKING! ");
			storyText4 = new FlxText(20, 130, 300, "Now, I need to set the exact time before the accident. It's 02/08/1924 10:52 PM ");
			storyText5 = new FlxText(20, 160, 300, "Open the door and close it. Count to 10 and hold your breath...");
			storyText6 = new FlxText(20, 190, 300, "Wait for me darling, I'm coming for you again...");
			storyText7 = new FlxText(260, 200, 50, "Press Enter to continue");
			
			storyText7.color = 0xC2CA35;
			
			add(storyText1);
			add(storyText2);
			add(storyText3);
			add(storyText4);
			add(storyText5);
			add(storyText6);
			add(storyText7);

			
		}
		
		override public function create() :void {
		
			FlxG.playMusic(level15Music, 1.0);
		}		
		
		
        override public function update():void {
			
			if (FlxG.keys.ENTER) {
				FlxG.switchState(new Credits);
			}
			
		}		
		
	}

}