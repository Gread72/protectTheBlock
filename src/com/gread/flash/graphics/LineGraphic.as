package com.gread.flash.graphics
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   
   public class LineGraphic extends GraphicCreator implements IGraphic
   {
	  protected var _element:Sprite;
	   
      public function LineGraphic(parent:DisplayObjectContainer, xVal:Number=0, 
									   yVal:Number=0, widthVal:Number=0, 
									   heightVal:Number=0, alphaVal:Number=1, 
									   colorVal:uint=0x000000, rotationVal:Number=0) {
         _element = new Sprite();
         
		 super(parent, xVal, yVal, widthVal, heightVal, alphaVal, colorVal, rotationVal);

      }
	  
	  public function get element() : Sprite {
         return _element;
      }
	  
      public function set x(value:Number) : void {
         this.element.x = value;
      }
      public function set y(value:Number) : void {
         this.element.y = value;
      }
	  
      public function set width(value:Number) : void {
         this._width = value;
      }
	  
      public function set height(value:Number) : void {
         this._height = value;
      }
	  
      public function set color(value:uint) : void {
         this._color = value;
      }
	  
      public function changeRotation(value:Number) : void {
         this.element.rotation = value;
      }
	  
      public function move(xVal:Number, yVal:Number) : void {
         this.element.x = xVal;
         this.element.y = yVal;
      }
	  
      override protected function factoryMethod() : IGraphic {
         _element = new Sprite();
         createInstance();
		 
		 return this;
      }
	  
      private function createInstance() : void {
         _element.graphics.lineStyle(this._width,this._color,this._alpha);
         _element.graphics.moveTo(0,0);
         _element.graphics.lineTo(this._height,0);
         _element.x = this._x;
         _element.y = this._y;
         _element.rotation = this._rotation;
      }
   }
}
