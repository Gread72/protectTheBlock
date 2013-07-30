package com.gread.games.missileCommand.controller{
	/*
		MissileController Class
		Controller for game levels
	*/
	
	import com.gread.games.missileCommand.model.ApplicationModel;
	import com.gread.games.missileCommand.view.AbstractLevelView;
	import com.gread.games.missileCommand.view.ILevelView;
	import com.gread.games.missileCommand.view.components.CityBuilding;
	import com.gread.games.missileCommand.view.components.Laser;
	import com.gread.games.missileCommand.view.components.UserBomb;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	
	
	public class MissileController implements ILevelController{
		
		/* Private variables */
		private var _model:ApplicationModel;
		private var _view:AbstractLevelView;
		private var _timer:Timer;
		private var _elapsedTime:Number = 0;
		private var removeList:Array = new Array;
		
		/* constructor function */
		public function MissileController(model:ApplicationModel, view:ILevelView){
			// set model and view for controller
			_model = model;
			_view = AbstractLevelView(view);
			
			init();
		}
		
		/* initialize function */
		private function init():void{
			// set timer for missile attack - timer event is called every half second
			_timer = new Timer(500);
			
			// set event listeners
			_view.addEventListener(Event.ENTER_FRAME, onFrameEnter);
			_view.addEventListener(MouseEvent.CLICK, onMouseClick);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			
			// start timer
			_timer.start();
		}
		
		/* 
			function onFrameEnter
			Handler for enter frame 
		*/
		public function onFrameEnter(evt:Event):void{
			
			//enemy and players laser/bomb hit area detection
			for(var counter:Number = 0; counter < _view.enemyBombs.length; counter++){
				
				var enemyBomb:Laser = Laser(_view.enemyBombs[counter]);
				
				var i:Number;
				if( enemyBomb && enemyBomb.hitTestObject(_view.foreground) ){
					removeEnemyBomb(enemyBomb, counter);
				}
				
				if( enemyBomb && _view.city1 && enemyBomb.hitTestObject(_view.city1) ){
					_model.setScore(-100);
					removeEnemyBomb(enemyBomb, counter);
					_view.city1.buildingHit();
				}
				
				if( enemyBomb && _view.city2 && enemyBomb.hitTestObject(_view.city2) ){
					_model.setScore(-100);
					removeEnemyBomb(enemyBomb, counter);
					_view.city2.buildingHit();
				}
				
				if( enemyBomb && _view.city3 && enemyBomb.hitTestObject(_view.city3) ){
					_model.setScore(-100);
					removeEnemyBomb(enemyBomb, counter);
					_view.city3.buildingHit();
				}
				
				if( enemyBomb && _view.city4 && enemyBomb.hitTestObject(_view.city4) ){
					_model.setScore(-100);
					removeEnemyBomb(enemyBomb, counter);
					_view.city4.buildingHit();
				}
				
				if( enemyBomb && _view.city5 && enemyBomb.hitTestObject(_view.city5) ){
					_model.setScore(-100);
					removeEnemyBomb(enemyBomb, counter);
					_view.city5.buildingHit();
				}
				
				if( enemyBomb && _view.city6 && enemyBomb.hitTestObject(_view.city6) ){
					_model.setScore(-100);
					removeEnemyBomb(enemyBomb, counter);
					_view.city6.buildingHit();
				}
				
				if( enemyBomb ){
					for(i = 0; i < _view.numChildren; i++){
						if(_view.getChildAt( i ) is UserBomb){
							if( enemyBomb.hitTestObject(_view.getChildAt( i )) ){
								_model.setScore(10);
								removeEnemyBomb(enemyBomb, counter);
							}
						} 
					}
				}
				
				if(enemyBomb.x < 0 || enemyBomb.x > 600){
					removeEnemyBomb(enemyBomb, counter); 
				}
				
			}
			
		}
		
		/* 
			function removeEnemyBomb()
			once enemy has been hit ... remove bomb
		*/
		private function removeEnemyBomb(enemyBomb:Laser, counter:Number):void{
			var i:Number;
			enemyBomb.destroyed = true;
			enemyBomb.destroy();
			
			for(i = 0; i < _view.numChildren; i++){
				if(_view.getChildAt( i ) is Laser && _view.getChildAt( i ) == enemyBomb){
					_view.enemyBombs.splice(counter,1);
				}
			}
			
			bombedBuilding();
		}
		
		/* 
			function bombedBuilding()
			Determine if player's build has been destroyed,
			If all buildings has been destroyed, game over
		*/
		private function bombedBuilding():void{
			var build1Destroyed:Boolean = true;
			var build2Destroyed:Boolean = true;
			var build3Destroyed:Boolean = true;
			var build4Destroyed:Boolean = true;
			var build5Destroyed:Boolean = true;
			var build6Destroyed:Boolean = true;
			
			if(_view.city1){
				build1Destroyed = _view.city1.isBuildingDestroyed;
			}
			
			if(_view.city2){
				build2Destroyed = _view.city2.isBuildingDestroyed;
			}
			
			if(_view.city3){
				build3Destroyed = _view.city3.isBuildingDestroyed;
			}
			
			if(_view.city3){
				build3Destroyed = _view.city3.isBuildingDestroyed;
			}
			
			if(_view.city4){
				build4Destroyed = _view.city4.isBuildingDestroyed;
			}
			
			if(_view.city5){
				build5Destroyed = _view.city5.isBuildingDestroyed;
			}
			
			if(_view.city6){
				build6Destroyed = _view.city6.isBuildingDestroyed;
			}
			
			
			if(build1Destroyed && build2Destroyed && build3Destroyed && build4Destroyed && build5Destroyed && build6Destroyed){
				//trace("All building have been destroying - Game Over");
				_model.sendMessage.dispatch( {"message" : "All buildings have been destroyed. - Game Over"} );
				_view.allCitiesDestroyed = true;
				endThisGame();
				_model.endGame.dispatch();
			}
		}
		
		/* 
			function onTimer()
			Event Handler for Timer
		*/
		public function onTimer(evt:TimerEvent):void{

			checkDestroyed();
			
			_elapsedTime+= 1;
			
			if(_elapsedTime > 120){
				_timer.stop();
				
				TweenMax.delayedCall(3,function():void{
					endThisGame();
					if(!_view.allCitiesDestroyed && _model.currentLevel <= 4){
						//trace("_view.enemyBombs.length " + _view.enemyBombs.length);
						//trace("_view.numChildren " + _view.numChildren);
						_model.endLevel.dispatch();
					}else{
						_model.endGame.dispatch();
					}
					
				});
			}
			
			// if all cities have been destroyed then game over - enemy laser bombs
			if(!_view.allCitiesDestroyed){
				var targetCityPos:Point = _view.getTargetPos(); // get current target position
				if(targetCityPos){
					switch(_model.currentLevel - 1){
						case 1:
							_view.createEnemyLaser(targetCityPos.x, targetCityPos.y, 0xFFFFFF, 5);
							break;
						
						case 2:
							_view.createEnemyLaser(targetCityPos.x, targetCityPos.y, 0xFF0000, 4);
							break;
						
						case 3:
							_view.createEnemyLaser(targetCityPos.x, targetCityPos.y, 0x00FF00, 3);
							break;
						
						case 4:
							_view.createEnemyLaser(targetCityPos.x, targetCityPos.y, 0x0000FF, 1);
							break;
						
						default:
							// end of levels
							break;
					}
				}
			}else{
				_timer.stop();
				//trace("Game Over");
				_model.endGame.dispatch();
			}
		}
		
		/* 
			function checkDestroyed()
			if EnemyBomb is destroyed remove from view's array 
		*/
		public function checkDestroyed():void{
			for(var i = 0; i < _view.enemyBombs.length; i++){
				if(Laser(_view.enemyBombs[i]).destroyed){
					_view.enemyBombs.splice(i,1);
				}
			}
		}
		
		/* 
			function endThisGame()
			At end of game, remove and clean up.
		*/
		private function endThisGame():void{
			_timer.stop();
			
			removeAll();
			
			_view.removeEventListener(Event.ENTER_FRAME, onFrameEnter);
			_view.removeEventListener(MouseEvent.CLICK, onMouseClick);
			
		}
		
		/* 
			function removeAll()
			Remove All Enemy Laser and User Bombs
		*/
		private function removeAll():void{
			var i:Number;
			
			for(i = _view.numChildren - 1; i > 0; i--){
				if(_view.getChildAt( i ) is Laser){
					Laser(_view.getChildAt( i )).destroy();
				}
			}
			
			//trace("_view.numChildren " + _view.numChildren);
			
			var counter:Number;
			for(counter = _view.enemyBombs.length; counter >= 0; counter--){
				_view.enemyBombs.splice(counter,1);
			}
			
			//trace("_view.enemyBombs.length " + _view.enemyBombs.length);
			
		}
		
		/* 
			function onMouseClick
			Event Handler for mouse clicks - to create user bombs - limit two at a time
		*/
		public function onMouseClick(evt:MouseEvent):void{
			if(_model.numberOfMissiles < 2){
				_view.addChild( createUserBombs(_view.mouseX, _view.mouseY) );
				_model.numberOfMissiles = _model.numberOfMissiles + 1;
			}
			
		}
		
		/* 
			function createUserBombs
			Create user bombs within a instance
		*/
		private function createUserBombs(xVal:Number, yVal:Number):UserBomb{
			var bomb:UserBomb = new UserBomb();
			bomb.x = xVal;
			bomb.y = yVal;
			bomb.addEventListener(UserBomb.USER_BOMB_EXPLODED, userBombExploded);
			return bomb;
		}
		
		/* 
			function userBombExploded
			Handler for user bomb - after animation remove the bomb instance.
		*/
		private function userBombExploded(evt:Event):void{
			_model.numberOfMissiles = _model.numberOfMissiles - 1;
			var i:Number = 0;
			
			for(i = 0; i < _view.numChildren; i++){
				if(_view.getChildAt( i ) is UserBomb && _view.getChildAt( i ) == evt.target){
					_view.removeChildAt( i );
				}
			}
		}
		
	}
}