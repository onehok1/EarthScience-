package com.view 
{
	import com.model.ComparisonItem;
	import com.model.XMLParser;
	import com.view.interactive.controls.NextButton;
	import flash.events.Event;
	import com.events.XMLEvent;
	import fl.controls.List;
import fl.data.DataProvider;
import flash.text.TextField;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class ComparisonView extends View
	{
		private var itemList:Array;
		private var _xmlParser:XMLParser;
		public var item_panel:List
		public var item_txt:TextField;
		public var next_bttn_mc:NextButton;
		public static var screenNum:Number = 1;
		
		public function ComparisonView() {
			_xmlParser = new XMLParser("comp_think_items.xml");
		}
		
		public override function enable():void {
			super.enable();
			itemList = getComparisonObjects();
			var dp:DataProvider = new DataProvider();
			
			for each(var item:ComparisonItem in itemList) {
				dp.addItem( { label: item.name, compItem: item } );
			}
			item_panel.allowMultipleSelection = false;
			item_panel.dataProvider = dp;
			item_panel.addEventListener(Event.CHANGE, onChangeListItemHandler, false, 0, true);
			
			next_bttn_mc.disable();
			
			
		}
		
		protected function onChangeListItemHandler(e:Event):void {
			
			item_txt.text = item_panel.selectedItem.label;
			dimension_txt.text = item_panel.selectedItem.compItem.dimension[0];
			unit_txt.text = item_panel.selectedItem.compItem.unit;
			
			next_bttn_mc.enable();

		}
		
		protected function getComparisonObjects():Array {			
			return _xmlParser.objects;
		}		
	}
}