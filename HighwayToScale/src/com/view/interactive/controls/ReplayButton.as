package com.view.interactive.controls 
{
	import com.events.ReplayEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class ReplayButton extends ClickableControl
	{
		
		public function ReplayButton() { }
		
		protected override function onMouseDownHandler(e:MouseEvent):void {
			super.onMouseDownHandler(e);
			
			dispatchEvent(new ReplayEvent());
		}
	}

}