package src
{
	
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author mike
	 */
	public class Soundz
	{
		
		private var gameOverSound:Sound = new GameOverSound();
		private var suddendDeath:Sound = new suddenDeathSound();
		private var startSound:Sound = new StartSound();
		private var lightSound:Sound = new LightSound();
		private var darkSound:Sound = new DarkSound();
		

		private var startMusic:Sound = new Sound();
		private var titleMusic:Sound = new Sound();
		private var endMusic:Sound = new Sound();
		
		private var backGroundSoundChannel:SoundChannel;
		private var soundEffects:Vector.<SoundChannel> = new Vector.<SoundChannel>;
		
		public function backgroundStart()
		{
			//backGroundSoundChannel = 
		}
		public function backgroundGame()
		{
			
		}
		public function backgroundEnd()
		{
			
		}
		
		
		
		public function darkSoundPlay(e:Event)
		{
			soundEffects.push(new SoundChannel)
			soundEffects[soundEffects.length - 1] = darkSound.play(0, 1, null);
			soundEffects[soundEffects.length - 1].addEventListener(Event.SOUND_COMPLETE, removeSound);
		}
		
		public function lightSoundPlay(e:Event)
		{
			soundEffects.push(new SoundChannel)
			soundEffects[soundEffects.length - 1] = lightSound.play(0,1,null);
			soundEffects[soundEffects.length - 1].addEventListener(Event.SOUND_COMPLETE, removeSound);
		}
		
		public function gameOverSoundPlay()
		{
			soundEffects.push(new SoundChannel)
			soundEffects[soundEffects.length - 1] = gameOverSound.play(0, 1, null);
			soundEffects[soundEffects.length - 1].addEventListener(Event.SOUND_COMPLETE, removeSound);
		}
		
		public function startSoundPlay()
		{
			soundEffects.push(new SoundChannel)
			soundEffects[soundEffects.length - 1] = startSound.play(0, 1, null);
			soundEffects[soundEffects.length - 1].addEventListener(Event.SOUND_COMPLETE, removeSound);
		}
		
		public function suddentDeathPlay()
		{
			soundEffects.push(new SoundChannel)
			soundEffects[soundEffects.length - 1] = suddendDeath.play(0,1,null);
			soundEffects[soundEffects.length - 1].addEventListener(Event.SOUND_COMPLETE, removeSound);
		}
		
		private function removeSound(e:Event)
		{
			soundEffects.splice(soundEffects.indexOf(e.target), 1);
		}
		
		public function stopAllSounds()
		{
			for (var i:int = 0; i < soundEffects.length;i ++) 
			{
				soundEffects[i].stop();
			}
		}
		
	}

}