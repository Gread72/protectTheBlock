package com.gread.games.missileCommand.model{
	/*
		ApplicationModel Class
		Application model for game logic in views
	*/
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import org.osflash.signals.Signal;
	
	public class ApplicationModel extends EventDispatcher{
		
		/* Private and Public variables */
		
		public static var SCORE_CHANGED:String = "SCORE_CHANGED";
		private var _numberOfMissiles:Number = 0;
		private var _score:Number = 0;
		private var _currentLevel:Number = 1;
		private var _message:String = "";
		
		public var startLevel:Signal;
		public var endLevel:Signal;
		public var endGame:Signal;
		public var sendMessage:Signal;
		
		/* constructor function */
		public function ApplicationModel(){
			startLevel = new Signal();
			endLevel = new Signal();
			endGame = new Signal();
			sendMessage = new Signal();
			
			endGame.add(onEndGame);
		}
		
		/* getter for numberOfMissiles */
		public function get numberOfMissiles():Number
		{
			return _numberOfMissiles;
		}
		
		/* setter for numberOfMissiles */
		public function set numberOfMissiles(value:Number):void
		{
			_numberOfMissiles = value;
		}
		
		/* getter for score */
		public function get score():Number
		{
			return _score;
		}
		
		/* 
			function setScore
			The score is updated and event is fired - scorechanged
		*/
		public function setScore(amount:Number):void{
			_score = _score + amount;
			dispatchEvent(new Event(SCORE_CHANGED));
		}
		
		/* 
			function startNextLevel()
			Event is fired and iterate level number
		*/
		public function startNextLevel():void{
			//trace("level " + _currentLevel);
			startLevel.dispatch( {"currentLevel" : _currentLevel} );
			_currentLevel += 1;
		}
		
		/* getter for currentLevel */
		public function get currentLevel():Number
		{
			return _currentLevel;
		}
		
		/* 
			function onEndGame()
			even handler for end of game = reset current level to first level
		*/
		public function onEndGame():void{
			//trace("Restart");
			// restart
			_currentLevel = 1;
		}


	}
}