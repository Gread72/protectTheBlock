package com.gread.games.missileCommand.view.components{
	/*
		EnemyBomb Class
		Container for EnemyBomb
	*/
	
	import flash.display.Sprite;
	import com.gread.games.missileCommand.util.GraphicComponentHelper;
	
	public class EnemyBomb extends Sprite{
		
		/* constructor function */
		public function EnemyBomb(){
			super();
			init();
		}
		
		/* initialize function */
		private function init():void{
			var myLine:Sprite = GraphicComponentHelper.CreateLineGraphic(this, 0, 0, 2, 800, 1, 0x00FF00, 0);
		}
	}
}