package com.model 
{
	import com.events.XMLEvent;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.controller.Controller;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class XMLParser
	{	
		private var _xml:XML;
		private var _objects:Array;
		
		public function XMLParser(url:String) {
			getXMLObject(url);
		}		
		
		public function getXMLObject(url:String):void {
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, onLoadXMLCompleteHandler);
			urlLoader.load(new URLRequest(url));
		}
		
		protected function onLoadXMLCompleteHandler(e:Event):void {			
			_xml = new XML(e.target.data);
			_objects = parseXML();		
		}
		
		public function get objects():Array {
			return _objects;
		}
		
		public function parseXML():Array {			
			var comparisonItems:Array = new Array();
			
			for each(var comparisonItemNode:XML in _xml.ComparisonItem) {				
				comparisonItems.push(buildComparisonItem(comparisonItemNode));				
			}
			return comparisonItems;
		}
		
		protected function buildComparisonItem(xmlNode:XML):ComparisonItem {
			var comparisonItem:ComparisonItem = new ComparisonItem();
			
			comparisonItem.name = xmlNode.@name;
			comparisonItem.source = xmlNode.@src;
			comparisonItem.format = xmlNode.@format;
			//comparisonItem.unit = xmlNode.dimension[0].@unit;		
			
			for each(var dimensionValue:XML in xmlNode.children()) {
				comparisonItem.dimension[dimensionValue.@name] = (Number(dimensionValue.text()));
				comparisonItem.unit[dimensionValue.@name] = dimensionValue.@unit;
			}
			
			return comparisonItem;
		}
	}
}