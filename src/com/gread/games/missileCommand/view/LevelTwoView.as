package com.gread.games.missileCommand.view{
	/*
		LevelTwoView Class
		Level Two View
	*/
	
	import com.gread.games.missileCommand.view.components.CityBuilding;
	import com.greensock.TweenLite;
	
	public class LevelTwoView extends AbstractLevelView implements ILevelView{
		
		/* constructor function */
		public function LevelTwoView(){
			super();
		}
		
		/*
			function createCities()
			overridden function for created city buildings - this defined the levels
		*/
		override public function createCities():void{
			
			numOfCites = 4;
			
			city1 = new CityBuilding();
			city1.x = 100;
			city1.y = 310;
			addChild(city1);
			city1.alpha = 0;
			TweenLite.to(city1, .5, {alpha:1});
			
			city2 = new CityBuilding()
			city2.x = 200;
			city2.y = 310;
			addChild(city2);
			city2.alpha = 0;
			TweenLite.to(city2, .5, {alpha:1});
			
			city3 = new CityBuilding();
			city3.x = 355;
			city3.y = 310;
			addChild(city3);
			city3.alpha = 0;
			TweenLite.to(city3, .5, {alpha:1});
			
			city4 = new CityBuilding()
			city4.x = 436;
			city4.y = 310;
			addChild(city4);
			city4.alpha = 0;
			TweenLite.to(city4, .5, {alpha:1});

		}  
	}
}