package src.pellets 
{
	import flash.display.MovieClip;
	import src.Player;
	
	/**
	 * ...
	 * @author mike
	 */
	public class PelletBase extends MovieClip 
	{
		public var xSpeed:Number;
		public var ySpeed:Number;
		private var rotateSpeed:Number;
		public var art:MovieClip;
		
		protected var returnEvent:String;
		
		
		
		public function PelletBase() 
		{
			rotateSpeed = Math.random() * 10;
		}
		
		public function frameLoop(player1:Player, player2:Player)
		{
			yHitTest();      //calls hit test for top and bottom of screen
			xHitTest();      //calls hit test for left and right of screen
			
			
			if (this.hitTestObject(player1))      //hit test with player1
			{
				hitWithPlayer(player1);
			}
			else if (this.hitTestObject(player2)) //hit test with player2
			{
				hitWithPlayer(player2);
			}
			
			this.x += xSpeed;     //moves player with its speed (x axis)
			this.y += ySpeed;     //moves player with its speed (y axis)
			
			this.rotation += rotateSpeed;
		}
		
			protected function yHitTest()
		{
			if (this.y > stage.stageHeight)    //hit test for bottom of screen
			{
				this.y = stage.stageHeight;       //moves to edge of screen so it cant go out to farr
				ySpeed = -ySpeed;                 //invert y movement when hit
			}
			else if (this.y < 0)               //hit test for top of screen 
			{
				this.y = 0;                       //moves to edge of screen so it cant go out to farr
				ySpeed = -ySpeed;                 //invert y movement when hit
			}
		}
		
		protected function xHitTest() //defined in subclasses
		{
			
		}
		
		protected function hitWithPlayer(playerHit:Player) //defined in subclasses
		{
			
		}
		
		
	}

}