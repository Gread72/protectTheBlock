package com.gread.games.missileCommand.view.components{
	/*
		FireCanon Class
		Mediator and container  for EnemyBomb
	*/
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import com.gread.games.missileCommand.util.GraphicComponentHelper;
	
	public class FireCanon extends Sprite{
		
		/* Private variables */
		private var _circle:Sprite;
		private var _rec:Sprite;
		
		/* constructor function */
		public function FireCanon(){
			super();
			init();
		}
		
		/* initialize function */
		private function init():void{
			_circle = GraphicComponentHelper.CreateCircleGraphic(this, 0, 0, 30, 0, 0, 1, 0xFFFFFF);
			
			_rec = GraphicComponentHelper.CreateRectagleGraphic(this, 0, 0, 10, 60, 0, 0, 1, 0xFFFFFF, 0x00, 0, true); 
			
			// event handler for Enter Frame event
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		/* 
			function onEnterFrame
			Event Handler for Enter Frame event
		*/
		public function onEnterFrame(event:Event):void {
			var dx:Number = mouseX - _rec.x;
			var dy:Number = mouseY - _rec.y;
			var radians:Number = Math.atan2(dy, dx);
			var degrees:Number = radians * 180 / Math.PI;
			_rec.rotation = degrees + 270;
			
		}
	}
}