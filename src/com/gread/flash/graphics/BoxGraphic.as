package com.gread.flash.graphics{
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	
	public class BoxGraphic extends GraphicCreator implements IGraphic{
		
		protected var _element:Sprite;
		
		private var _ellipseWidth:Number = 0;
		private var _ellipseHeight:Number = 0;
		
		private var _lineThickness:Number = 0;
		private var _lineColor:Number = 0x000000;
		
		public function BoxGraphic(parent:DisplayObjectContainer, xVal:Number=0, yVal:Number=0, 
								   widthVal:Number=0, heightVal:Number=0, alphaVal:Number=1, 
								   colorVal:uint=16777215, rotationVal:Number=0){
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
			_element.graphics.beginFill(this._color, this._alpha);
			
			if(_lineThickness > 0){
				_element.graphics.lineStyle(_lineThickness, _lineColor, this._alpha);
			}
			
			if(_ellipseWidth > 0 && _ellipseHeight > 0){
				_element.graphics.drawRoundRect(0, 0, this._width, this._height, _ellipseWidth, _ellipseHeight);
			}else{
				_element.graphics.drawRect(0, 0, this._width, this._height);
			} 
			
			_element.graphics.endFill();
			
			_element.x = this._x;
			_element.y = this._y;
			_element.rotation = this._rotation;
		}

		public function set ellipseWidth(value:Number):void
		{
			_ellipseWidth = value;
		}

		public function set ellipseHeight(value:Number):void
		{
			_ellipseHeight = value;
		}

		public function set lineThickness(value:Number):void
		{
			_lineThickness = value;
		}

		public function set lineColor(value:Number):void
		{
			_lineColor = value;
		}


	}
}