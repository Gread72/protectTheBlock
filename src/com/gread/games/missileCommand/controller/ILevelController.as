package com.gread.games.missileCommand.controller{
	/*
	ILevelController Interface
	share contract of level controller - MissileController
	*/
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	
	public interface ILevelController{
		function onFrameEnter(evt:Event):void
		function onTimer(evt:TimerEvent):void
		function onMouseClick(evt:MouseEvent):void
	}
}