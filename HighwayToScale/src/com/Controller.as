package com
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import com.events.ViewEvent;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class Controller extends MovieClip
	{
		protected var _screens:Array;
		
		
		public function Controller() 
		{
			init();
		}
		
		public function init():void {
			createScreensArray();
			stage.addEventListener(ViewEvent.LOAD_SCREEN, onLoadScreenHandler, false, 0, true);			
		}
		
		protected function createScreensArray():void {
			for (var i:uint = 0; i < this.numChildren; i++) {
				var child:DisplayObject = this.getChildAt(i);
				if (child is View) {
					(child as View).disable();
					_screens.push(child);
				}
			}
		}
		
		protected function addEvents():void {
			stage.addEventListener(ViewEvent.LOAD_VIEW, onLoadViewHandler, false, 0, true);
		}
		
	}

}