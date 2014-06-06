package src
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author mike
	 */
	public class StartScreen extends MovieClip 
	{
		
		private var schermArt:MovieClip = new StartScreenArt;
		
		public function StartScreen() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event)
		{
			
			stage.addEventListener(MouseEvent.CLICK, keyhit);
			addChild(schermArt);
			
		}
		
		private function keyhit(e:MouseEvent)
		{
			stage.removeEventListener(MouseEvent.CLICK, keyhit);
			dispatchEvent(new Event("startGame"));
		}
		
	}

}