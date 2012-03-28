package com.view
{
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
		}
		
		public override function disable():void {
			hide();
		}
		
		public override function show():void {
			this.visible = true;
		}
		
		public override function hide():void {
			this.visible = false;
		}
		
	}

}