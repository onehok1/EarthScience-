package com.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class XMLEvent extends Event
	{
		
		public static const XML_COMPLETE:String = "XML_COMPLETE";
		
		public function XMLEvent(type:String) {
			super(type, true);
		}
		
	}

}