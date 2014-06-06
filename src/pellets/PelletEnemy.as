package src.pellets 
{
	import flash.display.MovieClip;
	import src.Player;
	/**
	 * ...
	 * @author mike
	 */
	public class PelletEnemy extends PelletBase 
	{
		
		public function PelletEnemy() 
		{
			art = new EnemyPelletArt();
			addChild(art);
		}
		
		override protected function xHitTest()
		{
			
			if (this.x > stage.stageWidth - 1) 
			{
				xSpeed = -xSpeed;
			}
			else if (this.x < 0 + 1) 
			{
				xSpeed = -xSpeed;
			}
		}
		
		override protected function hitWithPlayer(playerHit:Player) //called when hitting a player
		{
			//will call a funtion in player to trigger dmg take
			var random:Number = Math.round(Math.random() * 10)
			if (random > 5 && !playerHit.debuff) 
			{
				playerHit.immumeStart();
			}
			else if (random < 5 && !playerHit.debuff) 
			{
				playerHit.SlowStart();
			}
	   }
	}

}