package src 
{
	import src.pellets.PelletEnemy;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author mike
	 */
	public class FactoryEnemyPellet extends MovieClip
	{
		
		public function makeEnemyPellet(pos:Vector2D,velosity:Vector2D):PelletEnemy
		{
			var enemy:PelletEnemy = new PelletEnemy();
			
			enemy.xSpeed = velosity.x; trace(velosity.x);
			enemy.ySpeed = velosity.y; trace(velosity.y);
			
			enemy.x = pos.x;
			enemy.y = pos.y;
			
			return enemy;
		}
		
	}

}