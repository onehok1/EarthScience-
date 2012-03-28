package com.view.interactive
{
	import com.view.AbstractVisual;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class AbstractInteractive extends AbstractVisual
	{
		
		public function AbstractInteractive() { }
		
		public function gotoOverState():void { 
			gotoAndPlay("over");
		}
		
		public function gotoDownState():void {
			gotoAndPlay("down");
		}
		
		public function gotoInactiveState():void {
			gotoAndPlay("inactive");
		}
		
		public function gotoActiveState():void { 
			gotoAndPlay("active");
		}	
		
	}

}