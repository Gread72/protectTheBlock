package com.gread.games.missileCommand.view.components{
	/*
		Laser Class
		Mediator and container for Laser
	*/
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Laser extends Sprite {
		
		/* Private and Public variables */
		
		private const FRAME_PER_SECOND:Number = 29;
		private var xpos:Number;
		private var ypos:Number;
		private var xspeed:Number = 1;
		private var yspeed:Number = 1;
		private var angle:Number = .1;
		private var startX:Number;
		private var startY:Number;
		private var targetX:Number;
		private var targetY:Number;
		private var isDown:Boolean = true;
		public var destroyed:Boolean = false;
		
		/* constructor function */
		public function Laser(startXVal:Number, startYVal:Number, targetXVal:Number, targetYVal:Number, 
							   color:uint = 0x000, thickness:Number = 1, isDownVal:Boolean = true, speed:Number = 15){
			super();
			
			isDown = isDownVal;
			
			graphics.lineStyle(thickness, color, 1);
			
			xpos = startXVal;
			ypos = startYVal;
			targetX = targetXVal;
			targetY = targetYVal;
			
			var xIter:Number = targetX - xpos;
			var yIter:Number = targetY - ypos;
			
			// speed of x
			xspeed = Math.round( xIter / (FRAME_PER_SECOND * speed) ) ; // frame per sec
			
			// ratio of yspeed
			yspeed = (xspeed * yIter) / xIter;
			
			//trace( "xspeed:" + xspeed + " yspeed:" + xspeed );
			
			graphics.moveTo(xpos, ypos);
			
			init();
		}
		
		/* initialize function */
		private function init():void{
			// event handler for Enter Frame event
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		/* 
			function onEnterFrame
			Event Handler for Enter Frame event
		*/
		public function onEnterFrame(event:Event):void {
			var xIter:Number = xspeed;
			var yIter:Number = yspeed;
			
			ypos += yIter;
			xpos += xIter;
			
			//trace( "ypos:" + Math.round(ypos) + " xpos:" + Math.round(xpos) );
			
			graphics.lineTo(xpos, ypos);
		}
		
		/* 
			function destroy()
			remove listener, graphic draw and remove child - clean up
		*/
		public function destroy():void{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			graphics.clear();
			this.parent.removeChild(this);
		}
	}
}