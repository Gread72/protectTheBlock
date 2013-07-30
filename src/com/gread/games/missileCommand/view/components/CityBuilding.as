package com.gread.games.missileCommand.view.components{
	
	/*
		CityBuilding Class
		Mediator and container for CityBuilding objects - sound is created to play
	*/
	
	import com.gread.games.missileCommand.util.GraphicComponentHelper;
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class CityBuilding extends Sprite{
		/* Private and Public variables */
		private var graphic:Sprite;
		private var _numberOfHitsAllowed:Number = 1;
		private var _isBuildingDestroyed:Boolean = false;
		
		[Embed(source="../../assets/hit.mp3")]
		[Bindable]
		public var sndCls:Class;
		public var snd:Sound 
		public var sndChannel:SoundChannel;
		
		/* constructor function */
		public function CityBuilding(){
			super();
			init();
		}
		
		/* initialize function */
		private function init():void{
			snd = new sndCls() as Sound; 
			sndChannel = new SoundChannel();
			
			graphic = GraphicComponentHelper.CreateCityGraphic(this);
		}
		
		/*
			function buildingHit()
			Method for when the building is hit.
		*/
		public function buildingHit():void{
			if(!_isBuildingDestroyed){
				_numberOfHitsAllowed = _numberOfHitsAllowed - 1;
				
				trace("Building Hit : " + _numberOfHitsAllowed);
				
				if(_numberOfHitsAllowed == 0){
					trace("This build has been destroyed");
					_isBuildingDestroyed = true;
					this.filters = [new BlurFilter(8, 8), new GlowFilter(0xFF0000)];
					TweenLite.to(this, .5, {alpha:0});
					//this.alpha = 0;
				}
				
				sndChannel = snd.play(0,0, new SoundTransform(.5));
				
			}
		}
		
		/* getter for isBuildingDestroyed */
		public function get isBuildingDestroyed():Boolean
		{
			return _isBuildingDestroyed;
		}

	}
}