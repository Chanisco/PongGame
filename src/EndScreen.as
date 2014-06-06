package src 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	/**
	 * ...
	 * @author mike
	 */
	public class EndScreen extends MovieClip 
	{
		private var backGround:MovieClip = new EndBackArt();
		
		public function EndScreen() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event)
		{
			addChild(backGround);
			stage.addEventListener(MouseEvent.CLICK, tittleClick);
			
		}
		
		private function tittleClick(e:MouseEvent)
		{
			
			dispatchEvent(new Event("resetgame"));
		}
		
	}

}