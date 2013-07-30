package com.gread.flash.components
{
   import com.gread.flash.components.IComponent;
   
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   import org.osflash.signals.Signal;

   public class ComponentCreator extends Object{
	  protected var _parent:DisplayObject;
      protected var _x:Number;
	  protected var _y:Number;
	  protected var _width:Number;
	  protected var _height:Number;
	  protected var _text:String;
	  protected var _instance:IComponent;
      public var clicked:Signal;
      public var enterText:Signal;
      
	  public function ComponentCreator(parent:DisplayObjectContainer, xVal:Number=0, 
									   yVal:Number=0, widthVal:Number=0, 
									   heightVal:Number=0, textVal:String="") {
         super();
         _parent = parent;
         _x = xVal;
         _y = yVal;
         _width = widthVal;
         _height = heightVal;
         _text = textVal;
         clicked = new Signal();
         enterText = new Signal();
      }
      
      public function create() : void {
         _instance = this.factoryMethod();
         _instance.x = _x;
         _instance.y = _y;
		 
         if( _width > 0 ){
         	_instance.element.width = _width;
         }
		 
         if( _height > 0 ){
         	_instance.element.height = _height;
         }
		 
         _instance.text = _text;
         
		 _instance.element.addEventListener(MouseEvent.CLICK, function():void{
               clicked.dispatch();
         });
         
		 _instance.element.addEventListener(Event.CHANGE, function(evt:Event):void{
         	_instance.text = evt.currentTarget.text;
         	enterText.dispatch();
         });
											
         if(_parent is MovieClip){
         	MovieClip(_parent).addChild(_instance.element);
         } else if(_parent is Sprite){
            Sprite(_parent).addChild(_instance.element);
         }
      }
	  
      protected function factoryMethod() : IComponent {
         throw new IllegalOperationError("Abstract Method: must be overwritten")
      }
   }
}
