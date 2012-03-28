package com.view.interactive.controls 
{
	import com.view.interactive.AbstractInteractive;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class ClickableControl extends AbstractInteractive
	{
		
		public function ClickableControl() { }
		
		public override function enable():void {
			super.enable();
			addMouseListeners();
		}
		
		public override function disable():void {
			removeMouseListeners();
			super.disable();
		}
		
		protected function addMouseListeners():void {
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverHandler, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler, false, 0, true);
		}
		
		protected function removeMouseListeners():void {
			this.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler, false);
			this.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOverHandler, false);
			this.removeEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler, false);
		}
		
		protected function onMouseOverHandler(e:MouseEvent):void {
			gotoOverState();
		}
		
		protected function onMouseDownHandler(e:MouseEvent):void {
			gotoDownState();
		}
		
		protected function onMouseUpHandler(e:MouseEvent):void {
			gotoInactiveState();
		}
		
	}

}