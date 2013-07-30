package com.gread.games.missileCommand.util{
	/*
		GraphicComponentHelper Class
		static methods for creating line, rectangle, city, circle graphics, and textbox/buttons components
	*/
	
	import com.gread.flash.components.ButtonComponent;
	import flash.display.*;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class GraphicComponentHelper{
		
		public static function CreateLineGraphic(parentObj:DisplayObjectContainer = null, xVal:Number=0, yVal:Number=0, widthVal:Number=0, 
									  heightVal:Number=0, alphaVal:Number=1, 
									  colorVal:uint=0x000000, rotationVal:Number=0):Sprite{
			var spriteGraphic:Sprite = new Sprite();
			
			spriteGraphic.graphics.lineStyle(widthVal,colorVal,alphaVal);
			spriteGraphic.graphics.moveTo(0,0);
			spriteGraphic.graphics.lineTo(heightVal,0);
			spriteGraphic.x = xVal;
			spriteGraphic.y = yVal;
			spriteGraphic.rotation = rotationVal;
			
			if(parentObj){
				parentObj.addChild(spriteGraphic);
			}
			
			return spriteGraphic;
		}
		
		public static function CreateRectagleGraphic(parentObj:DisplayObjectContainer = null, xVal:Number=0, yVal:Number=0, widthVal:Number=0, 
												 heightVal:Number=0, lineThicknessVal:Number = 1, lineAlphaVal:Number=1, alphaVal:Number=1, 
												 colorVal:uint=0x000000, lineColorVal:uint=0x000000, rotationVal:Number=0,
												 isXCenter:Boolean = false, isYCenter:Boolean = false):Sprite{
			var spriteGraphic:Sprite = new Sprite();
			
			spriteGraphic.graphics.lineStyle(lineThicknessVal, lineColorVal, lineAlphaVal);
			spriteGraphic.graphics.beginFill(colorVal, alphaVal);
			
			if(isXCenter){ xVal = -widthVal / 2; }
			if(isYCenter){ yVal = -heightVal / 2; }
			
			spriteGraphic.graphics.drawRect(xVal, yVal, widthVal, heightVal);
			spriteGraphic.graphics.endFill();
			
			spriteGraphic.rotation = rotationVal;
			
			if(parentObj){
				parentObj.addChild(spriteGraphic);
			}
			
			return spriteGraphic;
		}
		
		public static function CreateCityGraphic(parentObj:DisplayObjectContainer = null, xVal:Number=0, yVal:Number=0):Sprite{
			var spriteGraphic:Sprite = new Sprite();
			
			spriteGraphic.graphics.lineStyle(1, 0xFF0000, 1);
			spriteGraphic.graphics.beginFill(0xFF0000, 1);
			spriteGraphic.graphics.moveTo(0,41);
			spriteGraphic.graphics.lineTo(0,57);
			spriteGraphic.graphics.lineTo(48,57);
			spriteGraphic.graphics.lineTo(48,42);
			spriteGraphic.graphics.lineTo(48,42);
			spriteGraphic.graphics.lineTo(41,42);
			spriteGraphic.graphics.lineTo(41,9);
			spriteGraphic.graphics.lineTo(32,9);
			spriteGraphic.graphics.lineTo(32,29);
			spriteGraphic.graphics.lineTo(26,29);
			spriteGraphic.graphics.lineTo(26,0);
			spriteGraphic.graphics.lineTo(17,0);
			spriteGraphic.graphics.lineTo(17,16);
			spriteGraphic.graphics.lineTo(9,16);
			spriteGraphic.graphics.lineTo(9,41);
			spriteGraphic.graphics.endFill();
			spriteGraphic.x = xVal;
			spriteGraphic.y = yVal;
			//spriteGraphic.rotation = rotationVal;
			
			if(parentObj){
				parentObj.addChild(spriteGraphic);
			}
			
			return spriteGraphic;
		}
		
		public static function CreateCircleGraphic(parentObj:DisplayObjectContainer = null, xVal:Number=0, yVal:Number=0, radiusVal:Number=30, 
												   lineThicknessVal:Number = 1, lineAlphaVal:Number=1, alphaVal:Number=1, 
												   colorVal:uint=0x000000, lineColorVal:uint=0x000000, rotationVal:Number=0):Sprite{
			var spriteGraphic:Sprite = new Sprite();
			
			spriteGraphic.graphics.lineStyle(lineThicknessVal,lineColorVal, lineAlphaVal);
			spriteGraphic.graphics.beginFill(colorVal, alphaVal);
			spriteGraphic.graphics.drawCircle(0, 0, radiusVal);
			spriteGraphic.graphics.endFill();
			spriteGraphic.x = xVal;
			spriteGraphic.y = yVal;
			spriteGraphic.rotation = rotationVal;
			
			if(parentObj){
				parentObj.addChild(spriteGraphic);
			}
			
			return spriteGraphic;
		}
		
		public static function CreateSimpleTextField(parentObj:DisplayObjectContainer = null, textVal:String = "text", color:uint = 0x000000,
								   fontSize:Number = 12, fontName:String = "Arial", xVal:Number=0, yVal:Number=0):TextField{
			var textFormat:TextFormat = new TextFormat(fontName, fontSize, color);
			
			var text:TextField = new TextField();
			text.defaultTextFormat = textFormat;
			text.text = textVal;
			text.autoSize = TextFieldAutoSize.LEFT;
			
			//var textFormat:TextFormat = new TextFormat(fontName, fontSize, color);
			//text.setTextFormat(textFormat);
			
			if(parentObj){
				parentObj.addChild(text);;
			}
			
			return text;
		}
		
		public static function CreateSimpleTextFieldEmbeddedFont(parentObj:DisplayObjectContainer = null, textVal:String = "text",
													 embeddedfont:Font = null, color:uint = 0x000000,
													 fontSize:Number = 12, xVal:Number=0, yVal:Number=0):TextField{
			var text:TextField = new TextField();
			text.text = textVal;
			text.embedFonts = true; 
			text.autoSize = TextFieldAutoSize.LEFT;
			
			var textFormat:TextFormat = new TextFormat();
			textFormat.font = embeddedfont.fontName;
			textFormat.color = color;
			textFormat.size = fontSize;
			
			text.setTextFormat(textFormat);
			
			if(parentObj){
				parentObj.addChild(text);;
			}
			
			return text;
		}
		
		public static function CreateSimpleButton(parentObj:DisplayObjectContainer = null, textVal:String = "text",
												  widthVal:Number=200, heightVal:Number=30, xVal:Number=0, yVal:Number=0):ButtonComponent{
			var button:ButtonComponent = new ButtonComponent(parentObj, 0, 0, widthVal, heightVal, textVal, 
										new TextFormat("Times", 16));
			button.create();
			button.x = xVal;
			button.y = yVal;
			
			return button;
		}
	}
}