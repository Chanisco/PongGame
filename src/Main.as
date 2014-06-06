package src 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author mike
	 */
	public class Main extends MovieClip 
	{
		private var mainGame:Game;
		private var startScreen:StartScreen = new StartScreen();
		private var endScreen:EndScreen = new EndScreen();
		
		public function Main() 
		{
			startTitleScreen();
		}
		
		public function startTitleScreen()
		{
			addChild(startScreen);
			startScreen.addEventListener("startGame", startGame);
		}
		
		private function startGame(e:Event)
		{
			startScreen.removeEventListener("startGame", startGame);
			removeChild(startScreen);
			mainGame = new Game();
			addChild(mainGame);
			mainGame.addEventListener("startEndScreen", startEndScreen);
		}
		
		private function startEndScreen(e:Event)
		{
			mainGame.removeEventListener("startEndScreen", startEndScreen);
			addChild(endScreen);
			endScreen.addEventListener("resetgame", resetGame);
		}
		
		private function resetGame(e:Event)
		{
			endScreen.removeEventListener("resetgame", resetGame);
			removeChild(mainGame);
			removeChild(endScreen);
			startTitleScreen();
		}
		
	}

}