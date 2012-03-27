package com
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class View extends Loadable
	{
		
		public var titleBar:MovieClip;
		public var contentPanel:MovieClip;
		public var sideBar:MovieClip;
		
		public function View() { }
		
		public override function enable():void {
			show();
		}
		
		public override function show():void {
			this.visible = true;
		}
		
		public override function hide():void {
			this.visible = false;
		}
		
	}

}