package com.gread.games.missileCommand.view{
	/*
		LevelThreeView Class
		Level Three View
	*/
	
	import com.gread.games.missileCommand.view.components.CityBuilding;
	import com.greensock.TweenLite;
	
	public class LevelThreeView extends AbstractLevelView implements ILevelView{
		
		/* constructor function */
		public function LevelThreeView(){
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
			city1.alpha = 0;
			TweenLite.to(city1, .5, {alpha:1});
			
			city2 = new CityBuilding()
			city2.x = 100;
			city2.y = 310;
			addChild(city2);
			city2.alpha = 0;
			TweenLite.to(city2, .5, {alpha:1});
			
			city3 = new CityBuilding();
			city3.x = 200;
			city3.y = 310;
			addChild(city3);
			city3.alpha = 0;
			TweenLite.to(city3, .5, {alpha:1});
			
			city4 = new CityBuilding()
			city4.x = 355;
			city4.y = 310;
			addChild(city4);
			city4.alpha = 0;
			TweenLite.to(city4, .5, {alpha:1});
			
			city5 = new CityBuilding();
			city5.x = 436;
			city5.y = 310;
			addChild(city5);
			city5.alpha = 0;
			TweenLite.to(city5, .5, {alpha:1});

			city6 = new CityBuilding();
			city6.x = 538;
			city6.y = 310;
			addChild(city6);
			city6.alpha = 0;
			TweenLite.to(city6, .5, {alpha:1});
		}  
	}
}