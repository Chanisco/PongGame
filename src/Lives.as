package src
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Chanisco
	 */
	public class Lives extends Sprite
	{
		
		public function Lives($xp:Number, $yp:Number) 
		{
			graphics.lineStyle(1, 0x000000);
			graphics.beginFill(0xff00ff);
			graphics.drawCircle($xp, $yp, 5);
			graphics.endFill()
		}
		
	}

}