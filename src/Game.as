package src 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import src.FactoryEnemyPellet;
	import src.pellets.PelletEnemy;
	import src.pellets.PelletNorm;
	
	/**
	 * ...
	 * @author mike
	 */
	public class Game extends MovieClip 
	{
		private var normPellet:PelletNorm = new PelletNorm();
		
		private var backGround:Background = new Background();
		
		private var enemyPellFac:FactoryEnemyPellet = new FactoryEnemyPellet();
		private var tempEffectFac:TempEffectsFactory = new TempEffectsFactory();
		
		private var tempEffectsArray:Vector.<TempEffects> = new Vector.<TempEffects>;
		
		public var player2:Player;
		public var player1:Player;
		
		
		private var enemyPelletArray:Vector.<PelletEnemy> = new Vector.<PelletEnemy>();
		
		private var soundplayer:Soundz = new Soundz();
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event)
		{
			addChild(backGround);
			backGround.changeBackGround(5, 5);
			
			player1 = new Player(50, 87, 83, new LightPlayerArt);
			player2 = new Player(stage.stageWidth - 50, 38, 40, new DarkPlayerArt());
			
			
			normPellet.addEventListener("playerLosePoint", playerLosePoint );
			normPellet.addEventListener("playLight", soundplayer.lightSoundPlay);
			normPellet.addEventListener("playDark", soundplayer.darkSoundPlay);
			normPellet.xSpeed = 10;
			normPellet.x = stage.stageHeight / 2;
			normPellet.ySpeed = 0;
			
			addChild(normPellet);
			
			
			addChild(player1);
			addChild(player2);
			
			
			resetPellet();
			
			soundplayer.startSoundPlay();
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		
		
		private function playerLosePoint(e:Event)
		{
			var enemyPos:Vector2D = new Vector2D(0, (Math.random() * (stage.stageHeight - 50)) + 25);
			var enemyDirect:int;
			
			if (e.target.x < stage.stageWidth/2) 
			{
				player1.lifes --;
				player1.lifeChange();
				enemyPos.x = 100;
				enemyDirect = 5;
			}
			else if (e.target.x > stage.stageWidth/2) 
			{
				player2.lifes --;
				player2.lifeChange();
				enemyPos.x = stage.stageWidth - 100;
				enemyDirect = -5;
			}
			
			resetPellet()
			makeEnemy(enemyPos, enemyDirect);
			backGround.changeBackGround(player1.lifes, player2.lifes);
			
			if (player1.lifes == 0 || player2.lifes == 0) 
			{
				soundplayer.gameOverSoundPlay();
				endGame();
			}
			else if (player1.lifes == 1 && player2.lifes == 1) 
			{
				soundplayer.suddentDeathPlay();
			}
			
		}
		
		private function endGame()
		{
			
			removeEventListener(Event.ENTER_FRAME, loop);
			dispatchEvent(new Event("startEndScreen"));
		}
		
		private function resetPellet()
		{
			normPellet.x = stage.stageWidth/2;
			normPellet.y = stage.stageHeight / 2;
			normPellet.ySpeed = 0;
			normPellet.xSpeed = -normPellet.xSpeed;
			
			if (normPellet.art.currentFrame == 1) 
			{
				tempEffectsArray.push(tempEffectFac.makeTempEffect(stage.stageWidth / 2, stage.stageHeight / 2, new LightEffect()));
			}
			else 
			{
				tempEffectsArray.push(tempEffectFac.makeTempEffect(stage.stageWidth / 2, stage.stageHeight / 2, new DarkEffect()));
			}
			
			
			addChild(tempEffectsArray[tempEffectsArray.length - 1]);
			
			
		}
		
		private function makeEnemy(position:Vector2D,direction:int)
		{
			enemyPelletArray.push(enemyPellFac.makeEnemyPellet(position,new Vector2D(direction,(Math.random() * 16)-8)));
			enemyPelletArray[enemyPelletArray.length - 1]
			addChild(enemyPelletArray[enemyPelletArray.length - 1]);
		}
		
		private function loop(e:Event)
		{
			normPellet.frameLoop(player1, player2);
			
			for (var i:int = 0; i < enemyPelletArray.length; i++) 
			{
				enemyPelletArray[i].frameLoop(player1, player2);
			}
			
			for (var n:int = tempEffectsArray.length - 1; n >= 0; n--) 
			{
				if (tempEffectsArray[n].endCheck() == true)
				{
					removeChild(tempEffectsArray[n]);
					tempEffectsArray.splice(n, 1);
				}
			}
		}
		
	}

}