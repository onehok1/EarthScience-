package com.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class ReplayEvent extends Event
	{
		public static const REPLAY:String = "REPLAY";
		
		public function ReplayEvent() 
		{
			super(REPLAY, true);
		}
		
	}

}