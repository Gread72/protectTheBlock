package com.gread.games.missileCommand.view{
	/*
		ILevelView interface 
		interface for Level Views
	*/
	
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	
	public interface ILevelView extends IEventDispatcher{
		
		function createEnemyLaser(xVal:Number, yVal:Number, color:uint, level:Number):void
		
		function getTargetPos():Point
			
		function get allCitiesDestroyed():Boolean
		
		function set allCitiesDestroyed(value:Boolean):void
	}
}