package src 
{
	import src.Lives
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Chanisco
	 */
	public class Player extends Sprite
	{
		public var lifes:int = 5;
		private var keyUp:int;
		private var keyDown:int;
		public var playerSpeed:int = 13;
		public var isImmume:Boolean = false;
		public var imuneTimer:Timer = new Timer(2000, 1)
		//----player controlls----//
		public var upPlayer:Boolean = false;
		public var downPlayer:Boolean = false;
		public var debuff:Boolean = false;
		
		//----slow variables-----//
		public var slowTimer:Timer = new Timer(3000, 1);
		public var isSlow:Boolean = false;
		
		//----------Lives arrray---------------------------------------//
		public var livesXpos:Number;
		public var livesArray:Array = [];
		public var life:Lives;
		
		public function Player($x:int, $upKey:int, $downKey:int, image:MovieClip) 
		{
			this.x = $x;
			keyUp 	= $upKey;
			keyDown = $downKey;
			addEventListener(Event.ENTER_FRAME, loop);
			addChild(image);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			this.y = stage.stageHeight/2
			
		//--------------Lives power-----------------------------------//	
			var livesYpos = 10;
			for (var i:int = 0; i < lifes; i++) 
			{
				if (this.x < 350) {
					livesXpos = -20;
					
				} else if(this.x > 350 ){
					livesXpos = 20;
				}
				livesArray.push(new Lives(livesXpos, livesYpos));
				addChild(livesArray[i]);
				livesYpos += 10;
			}
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			imuneTimer.addEventListener(TimerEvent.TIMER_COMPLETE, ImuneEnd);
			
			slowTimer.addEventListener(TimerEvent.TIMER, SlowTime);
			slowTimer.addEventListener(TimerEvent.TIMER_COMPLETE, SlowEnd);
			// entry point
		}
		
		
		private function KeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == keyUp) {
				upPlayer = false
			}
			if (e.keyCode == keyDown ) {
				downPlayer = false
			}
		}
		public function lifeChange() {
			removeChild(livesArray[livesArray.length -1]);
			livesArray.splice(livesArray.length -1, 1);
			
		}
		
		private function loop(e:Event):void 
		{
			//----player gaat omlaag----//
			if (downPlayer == true) {
				if (this.y < 700 - this.height/2){
					this.y += playerSpeed;
				}
			}
			//----player gaat omhoog---///
			if (upPlayer == true) {
				if (this.y > 0 + this.height/2){
					this.y -= playerSpeed;
				}
			}
			
			if (isSlow || isImmume)
			{
				debuff = true;
			}
			else 
			{
				debuff = false;
			}
		}
		
		private function KeyDown(e:KeyboardEvent):void 
		{
			
			//----keycode pijltje omhoog--//
			if (e.keyCode == keyUp) {
				upPlayer = true
				if (downPlayer == true) {
					downPlayer = false;
				}
			}
			//-----keycode pijltje omlaag---//
			if (e.keyCode == keyDown) {
				downPlayer = true
				if (upPlayer == true) {
					upPlayer = false;
				}
			}
			if (e.keyCode == 32 ) {
				immumeStart();
			}
		}
		
		
		public function immumeStart()
		{
				imuneTimer.start();
				isImmume = true;
				this.alpha = 0.4;
		}
		
		private function ImuneEnd(e:TimerEvent):void 
		{
			imuneTimer.reset();
			isImmume = false;
			this.alpha = 1;
		}
		
		public function SlowStart() 
		{
			slowTimer.start();
			isSlow = true;
			playerSpeed /= 4;
		}
	  
		private function SlowTime(e:TimerEvent):void 
		{
			playerSpeed *= 4;
		}
		private function SlowEnd(e:TimerEvent):void 
		{
			trace(playerSpeed)
			isSlow = false;
			slowTimer.reset();
	   
		}
		
	}

}