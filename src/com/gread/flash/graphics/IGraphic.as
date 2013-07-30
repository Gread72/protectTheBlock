package com.gread.flash.graphics
{
	import flash.display.Sprite;

   public interface IGraphic
   {
      public function IGraphic()
	  
      function set color(param1:uint) : void
	  
      function changeRotation(param1:Number) : void
	
	  function get element() : Sprite
	  
   }
}
