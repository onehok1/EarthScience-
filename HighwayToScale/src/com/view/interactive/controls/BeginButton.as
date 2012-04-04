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
		
		protected override function onMouseUpHandler(e:MouseEvent):void {
			super.onMouseUpHandler(e);
			dispatchEvent(new ViewEvent("Comparison_View_1"));
		}
		
	}

}