package com.gread.games.missileCommand.view{
	/*
		PanelView Class
		Panel view for displaying score and labels - embedded font instance
	*/
	
	import com.gread.flash.components.ButtonComponent;
	import com.gread.games.missileCommand.util.GraphicComponentHelper;
	
	import flash.display.Sprite;
	import flash.text.Font;
	import flash.text.TextField;
	
	public class PanelView extends Sprite{
		
		/* Private and Public variables */
		
		private var fontFrutiger:Font = new Frutiger55(); 
		private var titleText:TextField;
		private var messageText:TextField;
		private var scoreText:TextField;
		private var background:Sprite;
		private var foreground:Sprite;
		
		public var levelStartBtn:ButtonComponent;
		
		/* constructor function */
		public function PanelView(){
			super();
			
			init();
		}
		
		/* initialize function */
		private function init():void{
			background = GraphicComponentHelper.CreateRectagleGraphic(this, 0, 0, 599, 399, 1, 1, 1, 0x0, 0xFFFFFF);
			foreground = GraphicComponentHelper.CreateRectagleGraphic(this, 0, 0, 600, 22, 0, 0, 1, 0xcccccc);
			
			titleText = GraphicComponentHelper.CreateSimpleTextFieldEmbeddedFont(this, "Protect The Block", fontFrutiger, 0x00, 16);
			titleText.x = 10; //foreground.width / 2 - textField.width / 2;
			titleText.y = foreground.height / 2 - titleText.height / 2;
			titleText.selectable = false;
			
			messageText = GraphicComponentHelper.CreateSimpleTextField(this, "", 0x00, 14, "Arial Narrow");
			messageText.x = foreground.width / 2 - messageText.width /2;
			messageText.y = 1;
			messageText.selectable = false;
			
			scoreText = GraphicComponentHelper.CreateSimpleTextField(this, "Score: 0", 0x00, 12, "_sans");
			scoreText.x = foreground.width - scoreText.width - 30;
			scoreText.selectable = false;
			
			levelStartBtn = GraphicComponentHelper.CreateSimpleButton(this, "Start");
			resetStartButton();
			
		}
		
		/* 
			function updateScoreText()
			Update Score text display
		*/
		public function updateScoreText(score:Number):void{
			scoreText.text = "Score: " + score;
		}
		
		/* 
			function updateMessageText()
			Update Message text display
		*/		
		public function updateMessageText(message:String):void{
			messageText.text = message;
			messageText.x = foreground.width / 2 - messageText.width /2;
		}
		
		/* 
			function resetStartButton()
			reset position of start button
		*/
		public function resetStartButton():void{
			levelStartBtn.x = 600 / 2 - 200 / 2;
			levelStartBtn.y = 400 / 2 - 30 / 2;
		}
		
		/* 
			function hideStartButton()
			hide using position of start button and background
		*/
		public function hideStartButton():void{
			levelStartBtn.x = -1200;
			background.x = -1200;
		}
		
	}
}