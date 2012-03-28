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
		protected var _currentScreen:View;
				
		public function Controller() {
			init();
		}
		
		public function init():void {
			createScreensArray();
			addEvents();
		}
		
		protected function createScreensArray():void {
			_screens = new Array();
			
			for (var i:uint = 0; i < this.numChildren; i++) {
				var child:DisplayObject = this.getChildAt(i);
				if (child is View) {
					(child as View).disable();
					_screens.push(child);
					_currentScreen = child as View;
				}
			}
		}
		
		protected function addEvents():void {
			stage.addEventListener(ViewEvent.LOAD_VIEW, onLoadViewHandler, false, 0, true);
		}
		
		protected function onLoadViewHandler(e:ViewEvent):void {
			_currentScreen.disable();
			for (var i:uint = 0; i < this.numChildren; i++) {
				if (this.getChildAt(i).name == e.targetView) {
					(this.getChildAt(i) as View).enable();
					_currentScreen = this.getChildAt(i) as View;
				}
			}
		}
		
	}

}