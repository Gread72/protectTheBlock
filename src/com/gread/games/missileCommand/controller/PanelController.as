package com.gread.games.missileCommand.controller{
	/*
		PanelController Class
		Controller for panel - display for point and titles
	*/
	
	import com.gread.games.missileCommand.model.ApplicationModel;
	import com.gread.games.missileCommand.view.PanelView;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class PanelController{
		
		/* Private variables */
		private var _model:ApplicationModel;
		private var _view:PanelView;
		
		/* constructor function */
		public function PanelController(model:ApplicationModel, view:PanelView){
			_model = model;
			_view = view;
			
			init();
		}
		
		/* initialize function */
		private function init():void{
			// event handler from model and button
			_model.addEventListener(ApplicationModel.SCORE_CHANGED, onScoreChange);
			_model.sendMessage.add( onMessageChange );
			_model.endLevel.add( onEndLevel );
			_model.endGame.add( onEndLevel );
			
			_view.levelStartBtn.clicked.add(onLevelClicked);
			
		}
		
		/*
			function onScoreChange
			Event handler for score change
		*/
		private function onScoreChange(evt:Event):void{
			_view.updateScoreText( _model.score );
		}
		
		/*
			function onMessageChange
			Event handler for message display
		*/
		private function onMessageChange(evt:Object):void{
			_view.updateMessageText( evt.message );
		}
		
		/*
			function onLevelClicked()
			Event handler for button clicked
		*/
		private function onLevelClicked():void{
			//trace("Start Level");
			_model.startNextLevel();
			_view.hideStartButton();
		}
		
		/*
			function onEndLevel()
			Event handler for level end
		*/
		private function onEndLevel():void{
			_view.resetStartButton();
		}
	}
}