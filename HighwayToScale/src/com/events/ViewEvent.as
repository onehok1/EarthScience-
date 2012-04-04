package com.events
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class ViewEvent extends Event
	{
		public static const LOAD_VIEW:String = "LOAD_VIEW";
		public var targetView:String;
		
		public function ViewEvent(targetView:String) {
			super(LOAD_VIEW, true);
			this.targetView = targetView;
		}
		
	}

}