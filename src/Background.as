package src 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author mike
	 */
	public class Background extends MovieClip 
	{
		private var baseBackGround:MovieClip = new DarkBackGround();
		private var maskedBackGround:MovieClip = new LightBackGround();
		private var backGroundMasker:MovieClip = new BackGroundMasker();
		
		public function Background() 
		{
			addChild(baseBackGround);
			addChild(backGroundMasker);
			addChild(maskedBackGround);
			
			maskedBackGround.mask = backGroundMasker;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event)
		{
			backGroundMasker.x = stage.stageWidth / 2;
		}
		
		public function changeBackGround(pl1Points:int, pl2Points:int)
		{
			backGroundMasker.x = stage.stageWidth * (pl1Points / ( pl1Points + pl2Points ));
		}
		
	}

}