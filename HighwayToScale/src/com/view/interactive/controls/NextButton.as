package com.view.interactive.controls 
{
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	
	import com.events.ViewEvent;
	import com.view.ComparisonView;
	import flash.events.MouseEvent;
	public class NextButton extends ClickableControl
	{
		
		public function NextButton() 
		{
			
		}
		
		protected override function onMouseUpHandler(e:MouseEvent):void {
			super.onMouseUpHandler(e);
			ComparisonView.screenNum++;
			dispatchEvent(new ViewEvent("Comparison_View_" + ComparisonView.screenNum));
		}
		
	}

}