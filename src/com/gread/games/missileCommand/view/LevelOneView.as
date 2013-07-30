package com.gread.games.missileCommand.view{
	/*
		LevelOneView Class
		Level One View
	*/
	
	import com.gread.games.missileCommand.view.components.CityBuilding;
	import com.greensock.TweenLite;
	
	public class LevelOneView extends AbstractLevelView implements ILevelView{
		
		/* constructor function */
		public function LevelOneView(){
			super();
		}
		
		/*
			function createCities()
			overridden function for created city buildings - this defined the levels
		*/
		override public function createCities():void{
			
			numOfCites = 2;
			
			city1 = new CityBuilding();
			city1.x = 100;
			city1.y = 310;
			addChild(city1);
			city1.alpha = 0;
			TweenLite.to(city1, .5, {alpha:1});
			
			city2 = new CityBuilding()
			city2.x = 436;
			city2.y = 310;
			addChild(city2);
			city2.alpha = 0;
			TweenLite.to(city2, .5, {alpha:1});
		}  
	}
}