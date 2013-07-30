package com.gread.flash.components
{
   import flash.display.DisplayObject;
	
   public interface IComponent
   {
     
	  function get element() : DisplayObject
	  
      function set text(value:String) : void
	  
      function get text() : String
	  
      function set x(value:Number) : void
	  
      function set y(value:Number) : void
	  
      function set width(value:Number) : void
	  
      function set height(value:Number) : void
      
	  function move(xVal:Number, yVal:Number) : void
   }
}
