package com.view 
{
	import flash.events.Event;
	import com.controller.Controller;
	import flash.net.FileReferenceList;
	import fl.controls.List;
	import fl.data.DataProvider;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class ComparisonSelectionView extends View
	{
		
		public function ComparisonSelectionView() {}
		
		public override function enable():void {
			super.enable();
			
			initializeListPanel();
			enableViews();	
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrameHandler, false, 0, true);
		}
		
		protected function initializeListPanel():void {
			var dp:DataProvider = new DataProvider();
			
			dp.addItem( { label: "Area", attribute: "area" } );
			dp.addItem( { label: "Width", attribute: "width" } );
			dp.addItem( { label: "Height", attribute: "height" } );
			dp.addItem( { label: "Length", attribute: "length" } );		
			
			//_dimensionList.allowMultipleSelection = false;
			_dimensionList.dataProvider = dp;
			_dimensionList.addEventListener(Event.CHANGE, onChangeListItemHandler, false, 0, true);
		}
		
		protected function onChangeListItemHandler(e:Event):void {
			Controller.comparisonDTO.comparisonDimension = _dimensionList.selectedItem.attribute;
			disableViews();
			enableViews();
		}
		
		public override function disable():void {
			disableViews();
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler, false);
			hideNextButton();
			
			super.disable();
		}
		
		private function enableViews():void {
			(getChildByName("selectionA") as View).enable();
			(getChildByName("selectionB") as View).enable();
		}
		
		private function disableViews():void {
			(getChildByName("selectionA") as View).disable();
			(getChildByName("selectionB") as View).disable();
		}
		
		private function hideNextButton():void {
			next_button_mc.visible = false;
			next_button_mc.disable();
		}
		
		protected function onEnterFrameHandler(e:Event):void {
			if (Controller.comparisonDTO.comparisonItemA && Controller.comparisonDTO.comparisonItemB) {
				next_button_mc.visible = true;
				next_button_mc.enable();
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrameHandler, false);
			}
		}
	}
}