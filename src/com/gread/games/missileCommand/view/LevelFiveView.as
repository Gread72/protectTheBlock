package com.gread.games.missileCommand.view{
	/*
		LevelFiveView Class - this level is not used in the current game
		Level Five View
	*/
	
	import com.gread.games.missileCommand.view.components.CityBuilding;
	import com.greensock.TweenLite;
	
	public class LevelFiveView extends AbstractLevelView implements ILevelView{
		
		/* constructor function */
		public function LevelFiveView(){
			super();
		}
		
		/*
			function createCities()
			overridden function for created city buildings - this defined the levels
		*/
		override public function createCities():void{
			
			numOfCites = 6;
			
			city1 = new CityBuilding();
			city1.x = 12;
			city1.y = 310;
			addChild(city1);
			
			city2 = new CityBuilding()
			city2.x = 100;
			city2.y = 310;
			addChild(city2);
			
			city3 = new CityBuilding();
			city3.x = 200;
			city3.y = 310;
			addChild(city3);
			
			city4 = new CityBuilding()
			city4.x = 355;
			city4.y = 310;
			addChild(city4);
			
			city5 = new CityBuilding();
			city5.x = 436;
			city5.y = 310;
			addChild(city5);
			
			city6 = new CityBuilding();
			city6.x = 538;
			city6.y = 310;
			addChild(city6);
		}  
	}
}