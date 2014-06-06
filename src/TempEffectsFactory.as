package src 
{
	import flash.display.MovieClip;
	import src.TempEffects;
	
	/**
	 * ...
	 * @author mike
	 */
	public class TempEffectsFactory extends MovieClip 
	{
		
		public function makeTempEffect(xPos:Number,yPos:Number,effectArt:MovieClip):TempEffects
		{
			var effect:TempEffects = new TempEffects(effectArt);
			effectArt.x = xPos;
			effectArt.y = yPos;
			
			return effect;
			
		}
		
	}

}