package com.gread.games.missileCommand.view.components{
	/*
		UserBomb Class
		Mediator and container for UserBomb - play sound
	*/
	
	import com.gread.games.missileCommand.util.GraphicComponentHelper;
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class UserBomb extends Sprite{
		
		/* Private and Public variables */
		
		private var myCircle:Sprite;
		public static var USER_BOMB_EXPLODED:String = "USER_BOMB_EXPLODED";
		[Embed(source="../../assets/laser.mp3")]
		[Bindable]
		public var sndCls:Class;
		
		public var snd:Sound; 
		public var sndChannel:SoundChannel;
		
		/* constructor function */
		public function UserBomb(){
			super();
			
			init();
		}
		
		/* initialize function */
		private function init():void{
			snd = new sndCls() as Sound;
			sndChannel = new SoundChannel();
			//trace(mouseX + " " +  0 to 300 to 600)
			//sndChannel.soundTransform.pan = -1 to 0 to 1;
			
			sndChannel = snd.play(0,0, new SoundTransform(.1));
			
			myCircle = GraphicComponentHelper.CreateCircleGraphic(this, 0, 0, 10, 0, 0, 1,0xFBB03B);
			myCircle.filters = [new BlurFilter(8, 8)];
			explode();
		}
		
		/* 
			function explode()
			animation when userbomb is created - fire event when completed
		*/
		private function explode():void{
			var reference:Sprite = this;
			
			TweenLite.to( reference, .5, {scaleX:5, scaleY:5, onComplete:function(){
				TweenLite.to( reference, .1, {scaleX:0, scaleY:0, onComplete:function(){
					dispatchEvent(new Event(USER_BOMB_EXPLODED)); 
				}});
			}} );
		}
	}
}