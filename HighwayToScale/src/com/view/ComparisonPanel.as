package com.view 
{
	import com.controller.Controller;
	import com.model.ComparisonItem;
	import com.model.XMLParser;
	import com.view.interactive.controls.NextButton;
	import fl.controls.List;
	import fl.data.DataProvider;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.*;
	
	
	/**
	 * Hey look, I wrote a comment so Aaron won't have to bitch.
	 * @author Brandon Dockery
	 */
	
	 
	public class ComparisonPanel extends View
	{
		private var itemList:Array;
		private var _xmlParser:XMLParser;
		private var _loader:Loader;
		
		public var item_panel:List
		public var item_txt:TextField;
		public var image_preview_mc:MovieClip;
		public var next_bttn_mc:NextButton;
		
		/**
		 * This here is a constructor. That should be obvious, but you can thank Aaron for this.
		 */
		public function ComparisonPanel() {
			_xmlParser = new XMLParser("comp_think_items.xml");
		}
		
		public override function enable():void {
			super.enable();		
			itemList = getComparisonObjects();			
			initializeListPanel();	
		}
		
		public override function disable():void {
			disableLoader();

			if(image_preview_mc.numChildren > 0) image_preview_mc.removeChildAt(0);
			item_panel.selectedItem = null;
			clearTextFields();
			
			super.disable();
		}
		
		protected function disableLoader():void {
			if (_loader) 
				_loader.contentLoaderInfo.removeEventListener(Event.CHANGE, onChangeListItemHandler, false);
		}
		
		protected function clearTextFields():void {
			item_txt.text = "";
			dimension_txt.text = "";
			unit_txt.text = "";
		}
		
		protected function initializeListPanel():void {
			var dp:DataProvider = new DataProvider();
			
			for each(var item:ComparisonItem in itemList) {
				if(item.dimension[Controller.comparisonDTO.comparisonDimension]){
					dp.addItem( { label: item.name, compItem: item } );
				}
			}
			
			item_panel.allowMultipleSelection = false;
			item_panel.dataProvider = dp;
			item_panel.addEventListener(Event.CHANGE, onChangeListItemHandler, false, 0, true);
		}
		
		protected function setTextFields():void {
			item_txt.text = item_panel.selectedItem.label;
			dimension_txt.text = item_panel.selectedItem.compItem.dimension[Controller.comparisonDTO.comparisonDimension];
			unit_txt.text = item_panel.selectedItem.compItem.unit[Controller.comparisonDTO.comparisonDimension];
		}
		
		protected function onChangeListItemHandler(e:Event):void {			
			setTextFields();
			
			while (image_preview_mc.numChildren > 0) {
				image_preview_mc.removeChildAt(0);
			}
			if(item_panel.selectedItem.compItem.format == "bitmap"){
				_loader = new Loader();
				_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadImageCompleteHandler, false, 0, true);
				_loader.load(new URLRequest(item_panel.selectedItem.compItem.source));
			}
			else {
				addVectorImage(item_panel.selectedItem.compItem.source);
			}
			
			if (this.name == "selectionA"){
				Controller.comparisonDTO.comparisonItemA = item_panel.selectedItem.compItem;
			}
			else if(this.name == "selectionB"){
				Controller.comparisonDTO.comparisonItemB = item_panel.selectedItem.compItem;
			}
		}
		protected function addVectorImage(className:String):void {
			var vectorClass:Class = getDefinitionByName(className) as Class;
			var vectorMovieClip:MovieClip = new vectorClass() as MovieClip;
			image_preview_mc.addChild(vectorMovieClip);
		}
		
		protected function onLoadImageCompleteHandler(e:Event):void {	
			image_preview_mc.addChild(_loader);
		}
		
		protected function getComparisonObjects():Array {			
			return _xmlParser.objects;
		}		
	}
}