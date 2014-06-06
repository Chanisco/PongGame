package src.pellets 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import src.Player;
	/**
	 * ...
	 * @author mike
	 */
	public class PelletNorm extends PelletBase 
	{
		
		public function PelletNorm() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event)
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			art = new NormPelletArt();
			addChild(art);
			art.gotoAndStop(1);
			
			trace("bulletMade");
		}
		
		override protected function xHitTest()
		{
			//Checks is its gone past a player
			if (this.x > stage.stageWidth - 1 || this.x < 0 + 1) 
			{
				//sents a dispatch to the Game to let it know that a point is scored
				dispatchEvent(new Event("playerLosePoint"));
			}
		}
		
		override protected function hitWithPlayer(playerHit:Player) //called when hitting a player
		{
			//Checks to see if the player is immume or not
			if (!playerHit.isImmume) 
			{
				//Checks to see in what direction it has to rebound
				if (this.x > stage.stageWidth/2)
				{
					xSpeed = -Math.abs(xSpeed);
					art.gotoAndStop(2);
					dispatchEvent(new Event("playDark"));
				}
				else
				{
					xSpeed = Math.abs(xSpeed);
					art.gotoAndStop(1);
					dispatchEvent(new Event("playLight"));
				}
				ySpeed = (this.y - playerHit.y) / 4;
			}
		}
		
	}

}