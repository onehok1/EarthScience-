package com.view 
{
	import com.model.ComparisonItem;
	import com.model.XMLParser;
	import com.view.interactive.controls.NextButton;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.events.XMLEvent;
	import fl.controls.List;
import fl.data.DataProvider;
import flash.net.URLRequest;
import flash.text.TextField;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class ComparisonView extends View
	{
		private var itemList:Array;
		private var _xmlParser:XMLParser;
		private var _loader:Loader;
		public var item_panel:List
		public var item_txt:TextField;
		public var image_preview_mc:MovieClip;
		public var next_bttn_mc:NextButton;
		public static var screenNum:Number = 1;
		
		public function ComparisonView() {
			_xmlParser = new XMLParser("comp_think_items.xml");
		}
		
		public override function enable():void {
			super.enable();
			var dp:DataProvider = new DataProvider();
			itemList = getComparisonObjects();
			
			
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
			
			while (image_preview_mc.numChildren > 0) {
				image_preview_mc.removeChildAt(0);
			}
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadImageCompleteHandler, false, 0, true);
			_loader.load(new URLRequest(item_panel.selectedItem.compItem.source));
			
			
			next_bttn_mc.enable();

		}
		
		protected function onLoadImageCompleteHandler(e:Event):void {
			
			image_preview_mc.addChild(_loader);
		}
		
		protected function getComparisonObjects():Array {			
			return _xmlParser.objects;
		}		
	}
}