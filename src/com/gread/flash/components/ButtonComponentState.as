package com.gread.flash.components
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.display.Loader;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;

   public class ButtonComponentState extends Sprite
   {
	  protected var _color:uint;
	  protected var _labelText:String;
	  protected var _width:Number;
	  protected var _height:Number;
	  protected var _label:TextField;
	  protected var _background:Shape;
	  protected var _textFormat:TextFormat;
	  protected var _loader:Loader;
      
	  public function ButtonComponentState(color:uint = 0xffffff, labelText:String = "button", textFormat:TextFormat = null, 
										   width:Number=0, height:Number=0, imagePath:String = "") {
         super();
		 
		 if(!textFormat){
		 	_textFormat = new TextFormat("Verdana",12);
		 }else{
			 _textFormat = textFormat;
		 }
		 
         _color = color;
         
		 _labelText = labelText;
         
		 _width = width;
         
		 _height = height;
		 
		 if(imagePath != ""){
			 _loader = new Loader();
			 _loader.addEventListener(Event.COMPLETE, onLoadComplete);
			 _loader.load(new URLRequest(imagePath));
		 }else{
			 createSimpleButton();
		 }

      }
     
      private function init() : void {
		 
      }
	  
	  public function createSimpleButton():void{
		  createLabel();
		  createBackground();
		  addChild(_background);
		  addChild(_label);
		  
		  centerLabel();
	  }
	  
	  public function setText(textValue:String):void{
		  _labelText = textValue;
		  _label.text = _labelText;
		  _label.setTextFormat(_textFormat);
	  }
	  
      private function onLoadComplete( evt:Event ) : void {
         
         if( _width < _label.textWidth ){
            width = _label.textWidth + 10;
         } else {
            width = _width;
         }
		 
         if( _height < _label.textWidth ){
            height = 18;
         } else {
            height = _height;
         }
			
         var bitmapData:BitmapData = new BitmapData(width, height, false);
         
		 bitmapData.draw(_loader.content, new Matrix());
         
		 var bitmap:Bitmap = new Bitmap(bitmapData);
         
		 addChild(bitmap);
         
		 addChild(_label);
		 
		 centerLabel();
      }
	  
      private function createBackground() : void {
        
         if( _width < _label.textWidth){
            _width = _label.textWidth + 10;
         }else{
            _width = _width;
         }
		 
         if( _height < _label.textWidth){
         	_height = 18;
         }else{
            _height = _height;
         }
         _background = new Shape();
         _background.graphics.beginFill( _color );
         _background.graphics.lineStyle( 0.5, 0, 1, true, "normal", flash.display.CapsStyle.ROUND, flash.display.JointStyle.ROUND);
         _background.graphics.drawRoundRect(0, 0, _width, _height, 24);
        
      }
      private function createLabel() : void {
         _label = new TextField();
         
		 _label.text = _labelText;
		 
//		 if( _width > 0 ){
//         	_label.width = _width;
//         }else{
         	_label.autoSize = TextFieldAutoSize.CENTER;
         //}
		 
         if( _height > 0 ){
         	_label.height = _height;
         }
		 
		 _label.setTextFormat(_textFormat);

      }
	  
	  private function centerLabel():void{
		  _label.x = _width / 2 - _label.width / 2;
		  _label.y = _height / 2 - _label.height / 2;
	  }
   }
}
