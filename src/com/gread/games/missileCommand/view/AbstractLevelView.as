package com.gread.games.missileCommand.view{
	/*
		AbstractLevelView Class
		Abstract Object for Level Views
	*/
	
	import com.gread.games.missileCommand.util.GraphicComponentHelper;
	import com.gread.games.missileCommand.view.components.CityBuilding;
	import com.gread.games.missileCommand.view.components.FireCanon;
	import com.gread.games.missileCommand.view.components.Laser;
	
	import flash.display.*;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	public class AbstractLevelView extends Sprite implements ILevelView{
		
		/* Private and Public variables */
		
		//background
		protected var background:Sprite;
		//foreground
		public var foreground:Sprite;
		
		protected var numOfCites:Number = 6;
		
		public var enemyBombs:Array;
		
		public var city1:CityBuilding;
		public var city2:CityBuilding;
		public var city3:CityBuilding;
		public var city4:CityBuilding;
		public var city5:CityBuilding;
		public var city6:CityBuilding;
		private var _allCitiesDestroyed:Boolean = false;
		
		/* constructor function */
		public function AbstractLevelView(){
			super();
			
			init();
		}
		
		/* initialize function */
		private function init():void{
			background = GraphicComponentHelper.CreateRectagleGraphic(this, 0, 0, 599, 399, 1, 1, 1, 0x0, 0xFFFFFF);
			
			var cannon:FireCanon = new FireCanon();
			addChild(cannon);
			cannon.x = 600/2;
			cannon.y = 400 - 42;
			
			foreground = GraphicComponentHelper.CreateRectagleGraphic(this, 0, 360, 600, 42, 1, 0, 1, 0xFFFF00);
			
			enemyBombs = new Array();
			
			createCities();
		}
		
		/* 
			function createCities()
			method to be overridden - create references to the city graphics
		*/
		public function createCities():void{
			throw new Error("This function must be overridden");
		}
		
		/* 
			function createEnemyLaser()
			create Enemy Lasers random instances
		*/
		public function createEnemyLaser(xVal:Number, yVal:Number, color:uint, level:Number):void{
			var laser:Laser;
			
			var xRand:Number = Math.round((Math.random() * 600))
			
			laser = new Laser(xRand, 0, xVal, yVal, color, 2, true, level);
			
			laser.filters = [new BlurFilter(4, 4), new GlowFilter(color)];
			
			//trace("xRand " + xRand);
			
			this.addChild(laser);
			
			enemyBombs.push( laser );
		}
		
		/* 
			function getTargetPos()
			get target position for laser direction based on user's buildings
		*/
		public function getTargetPos():Point{
			var targetCity:CityBuilding;
			targetCity = randomCity();
			
			return new Point(targetCity.x, targetCity.y);
		}
		
		/* 
			function randomCity()
			get current buildings created and not destroyed
		*/
		protected function randomCity():CityBuilding{
			var targetCity:CityBuilding;
			var cityRandNum:Number = Math.round(Math.random() * (numOfCites - 1));
			//trace("cityRandNum " + cityRandNum);
			
			switch(cityRandNum + 1){
				case 1:
					targetCity = checkBuilding(city1);
					break;
				
				case 2:
					targetCity = checkBuilding(city2);
					break;
				
				case 3:
					targetCity = checkBuilding(city3);
					break;
				
				case 4:
					targetCity = checkBuilding(city4);
					break;
				
				case 5:
					targetCity = checkBuilding(city5);
					break;
				
				case 6:
					targetCity = checkBuilding(city6);
					break;
				
				default:
					//targetCity = randomCity();
					break;
			}
			
			if(!targetCity){
				if(targetCity.isBuildingDestroyed){
					targetCity = randomCity();	
				}
			}
			
			return targetCity;
		}
		
		/* 
			function checkBuilding
			Check whether user building is present and not destroyed
		*/
		private function checkBuilding(building:CityBuilding):CityBuilding{

			if( !building || building.isBuildingDestroyed ){
				for(var i:Number = 0; i < this.numChildren; i++){
					if(this.getChildAt( i ) is CityBuilding){
						var currentBuilding:CityBuilding = CityBuilding(this.getChildAt( i ));
						if(!currentBuilding.isBuildingDestroyed){
							building = currentBuilding;
						}
					}
				}	
			}
			
			return building;
		}
		
		/* getter for allCitiesDestroyed boolean value */
		public function get allCitiesDestroyed():Boolean
		{
			return _allCitiesDestroyed;
		}
		
		/* setter for allCitiesDestroyed boolean value */
		public function set allCitiesDestroyed(value:Boolean):void
		{
			_allCitiesDestroyed = value;
		}

	
	}
}