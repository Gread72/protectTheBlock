package com.gread.flash.components
{
   import com.gread.flash.components.ButtonComponentState;
   import com.gread.flash.components.ComponentCreator;
   import com.gread.flash.components.IComponent;
   
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.SimpleButton;
   import flash.text.TextFormat;

   public class ButtonComponent extends ComponentCreator implements IComponent
   {
	  protected var _element:SimpleButton;
	  protected var _textFormat:TextFormat;
	  
      public function ButtonComponent(parent:DisplayObjectContainer, xVal:Number=0, 
									   yVal:Number=0, widthVal:Number=0, 
									   heightVal:Number=0, textVal:String="", textFormat:TextFormat = null) {
      	super(parent,xVal,yVal,widthVal,heightVal,textVal);
		 
		if(!textFormat){
			_textFormat = new TextFormat("Verdana",12);
		}
		
		
      }
	  
	  public function get element() : DisplayObject {
         return _element as DisplayObject;
      }
      
	  public function set text(value:String) : void {
         _text = value;
		 
		 if(_element.upState){
			 ButtonComponentState(_element.upState).setText(_text);
		 }
		 
		 if(_element.downState){
			 ButtonComponentState(_element.downState).setText(_text);
		 }
		 
		 if(_element.overState){
		 	ButtonComponentState(_element.overState).setText(_text);
		 }
      }
      
	  public function get text() : String {
         return _text;
      }
	  
      public function set x(value:Number) : void {
         _element.x = value;
      }
	  
      public function set y(value:Number) : void {
         _element.y = value;
      }
      
	  public function set width(value:Number) : void {
         return;
      }
	  
      public function set height(value:Number) : void {
         return;
      }
      
	  public function move(xVal:Number, yVal:Number) : void {
         _element.x = xVal;
         _element.y = yVal;
      }
      
	  public function set textFormat(value:TextFormat) : void {
         _textFormat = value;
      }
	  
      override protected function factoryMethod() : IComponent {
         _element = new SimpleButton();
         createInstance();
         return this;
      }
	  
      private function createInstance() : void {
         _element.upState = new ButtonComponentState(0xffffff, _text, _textFormat, _width, _height);
         _element.downState = new ButtonComponentState(0xcccccc, _text, _textFormat, _width, _height);
         _element.overState = new ButtonComponentState(0xbbbbbb, _text, _textFormat, _width, _height);
         _element.hitTestState = _element.upState;
         _element.x = _x;
         _element.y = _y;
      }
   }
}
