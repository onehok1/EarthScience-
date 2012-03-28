package com.view.interactive.controls 
{
	import com.events.ViewEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class BeginButton extends ClickableControl
	{
		
		public function BeginButton() { }
		
		public override function onMouseUpHandler(e:MouseEvent) {
			super.onMouseUpHandler(e);
			dispatchEvent(new ViewEvent("Comparison_Screen_1"));
		}
		
	}

}