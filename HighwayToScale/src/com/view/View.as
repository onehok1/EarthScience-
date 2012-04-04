package com.view
{
	import com.view.interactive.AbstractInteractive;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class View extends AbstractVisual
	{
		
		public function View() { }
		
		public override function enable():void {
			show();
			enableControls();
		}
		
		public override function disable():void {
			hide();
			disableControls();
		}
		
		public override function show():void {
			this.visible = true;
		}
		
		public override function hide():void {
			this.visible = false;
		}
		
		protected function enableControls():void {
			for (var i:uint = 0; i < this.numChildren; i++) {
				if (this.getChildAt(i) is AbstractInteractive) {
					(this.getChildAt(i) as AbstractInteractive).enable();
				}
			}
		}
		
		protected function disableControls():void {
			for (var i:uint = 0; i < this.numChildren; i++) {
				if (this.getChildAt(0) is AbstractInteractive) {
					(this.getChildAt(0) as AbstractInteractive).disable();
				}
			}
		}
		
	}

}