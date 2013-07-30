package com.gread.flash.graphics
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.errors.IllegalOperationError;

   public class GraphicCreator extends Object
   {
	  private var _parent:DisplayObject;
	  protected var _x:Number;
	  protected var _y:Number;
	  protected var _width:Number;
	  protected var _height:Number;
	  protected var _color:uint;
	  protected var _rotation:Number;
	  protected var _alpha:Number;
	  protected var _instance:IGraphic;
	  
      public function GraphicCreator(parent:DisplayObjectContainer, xVal:Number=0, 
									   yVal:Number=0, widthVal:Number=0, 
									   heightVal:Number=0, alphaVal:Number=1, 
									   colorVal:uint=16777215, rotationVal:Number=0) {
         super();
		 
         _parent = parent;
         _x = xVal;
         _y = yVal;
         _width = widthVal;
         _height = heightVal;
         _alpha = alphaVal;
         _color = colorVal;
         _rotation = rotationVal;
      }
	  
	  public function create() : Sprite {
         _instance = this.factoryMethod();
         
		 if(_parent is MovieClip){
         	MovieClip(_parent).addChild(_instance.element);
         } else if(_parent is Sprite){
            Sprite(_parent).addChild(_instance.element);
         }
         
		 return _instance.element;
      }
	  
      protected function factoryMethod() : IGraphic {
         throw new IllegalOperationError("Abstract Method: must be overwritten")
      }
   }
}
