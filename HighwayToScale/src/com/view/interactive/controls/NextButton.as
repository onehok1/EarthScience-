package com.view.interactive.controls 
{
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	
	import com.events.ViewEvent;
	import flash.events.MouseEvent;
	
	public class NextButton extends ClickableControl
	{
		
		public function NextButton() {}
		
		protected override function onMouseUpHandler(e:MouseEvent):void {
			super.onMouseUpHandler(e);
			dispatchEvent(new ViewEvent("Scaled_View"));
		}
		
	}

}