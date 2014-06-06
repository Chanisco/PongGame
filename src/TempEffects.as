package src 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author mike
	 */
	public class TempEffects extends MovieClip 
	{
		private var effectArt:MovieClip;
		
		public function TempEffects(art:MovieClip) 
		{
			effectArt = art;
			addChild(effectArt);
		}
		
		public function endCheck():Boolean
		{
			
			if (effectArt.currentFrame == effectArt.totalFrames) 
			{
				return new Boolean(true);
			}
			else
			{
				return new Boolean(false);
			}
			
		}
		
	}

}