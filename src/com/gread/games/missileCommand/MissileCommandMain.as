package com.gread.games.missileCommand{
	/*
		MissileCommandMain Class
		Binds Model, Views and Controllers
	*/
	import com.gread.games.missileCommand.controller.MissileController;
	import com.gread.games.missileCommand.controller.PanelController;
	import com.gread.games.missileCommand.model.ApplicationModel;
	import com.gread.games.missileCommand.view.ILevelView;
	import com.gread.games.missileCommand.view.LevelFourView;
	import com.gread.games.missileCommand.view.LevelOneView;
	import com.gread.games.missileCommand.view.LevelThreeView;
	import com.gread.games.missileCommand.view.LevelTwoView;
	import com.gread.games.missileCommand.view.PanelView;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class MissileCommandMain extends Sprite{
		
		/* Private and Public variables */
		private var appModel:ApplicationModel;
		private var panelView:PanelView;
		private var levelsView:Sprite;
		private var panelController:PanelController;
		private var mainController:MissileController;
		private var	mainView:ILevelView;
		
		/* constructor function */
		public function MissileCommandMain(){
			init();
		}
		
		/* initialize function */
		private function init():void{
			appModel = new ApplicationModel();
			
			// set handlers of application model
			appModel.startLevel.add(onStartLevel);
			appModel.endGame.add(onEndGame);
			appModel.endLevel.add(onEndLevel);
			
			//Add level view
			levelsView = new Sprite();
			this.addChild(levelsView);
			
			//Add Panel display up top - binds model and view
			panelView = new PanelView();
			panelController = new PanelController(appModel, panelView);
			this.addChild(panelView);
			
		}
		
		/*
			function onStartLevel
			Event handler of StartNextLevel 
		*/
		private function onStartLevel(evt:Object):void{
			
			/// get current level
			var level:Number = evt.currentLevel;
			
			// clear last level instance
			if(levelsView.numChildren > 0){
				levelsView.removeChildAt(0);
			}
			
			switch(level){
				case 1:
					//reset score at start (when you restart game)
					appModel.setScore(-appModel.score); 
					
					appModel.sendMessage.dispatch( {"message" : "Level 1 of 4"} );
					mainView = new LevelOneView();
					levelsView.addChild(DisplayObject(mainView));
					mainController = new MissileController(appModel, mainView);
					break;
				
				case 2:
					//trace("Level 2");
					appModel.sendMessage.dispatch( {"message" : "Level 2 of 4"} );
					mainView = new LevelTwoView();
					levelsView.addChild(DisplayObject(mainView));
					mainController = new MissileController(appModel, mainView);
					break;
				
				case 3:
					//trace("Level 3");
					appModel.sendMessage.dispatch( {"message" : "Level 3 of 4"} );
					mainView = new LevelThreeView();
					levelsView.addChild(DisplayObject(mainView));
					mainController = new MissileController(appModel, mainView);
					break;
				
				case 4:
					//trace("Level 3");
					appModel.sendMessage.dispatch( {"message" : "Last Level"} );
					mainView = new LevelFourView();
					levelsView.addChild(DisplayObject(mainView));
					mainController = new MissileController(appModel, mainView);
					break;
				
				default:
					appModel.endGame.dispatch();
					break;
			}
			
		}
		
		/*
			function onEndLevel()
			Event handler for End Level - continue level if under 4th level
		*/
		private function onEndLevel():void{
			//trace("End Level");
			if(appModel.currentLevel <= 3){
				appModel.sendMessage.dispatch( {"message" : "End of Level"} );
			}
		}
		
		/*
			function onEndGame()
			Event handler for End of game - if no building are destroyed player wins
		*/
		private function onEndGame():void{
			//trace("End Game");
			if(!mainView.allCitiesDestroyed){
				appModel.sendMessage.dispatch( {"message" : "You have won the game!"} );
			}
			
		}
		
	}
}