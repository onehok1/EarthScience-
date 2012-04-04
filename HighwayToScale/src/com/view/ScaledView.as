package com.view 
{
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	
	import com.controller.Controller;
	import com.view.interactive.controls.BackButton;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	
	public class ScaledView extends View
	{
		private var _smallLoader:Loader;
		private var _bigLoader:Loader;
		public var back_bttn_mc:BackButton;
		
		public function ScaledView() { }
		
		public override function enable():void {
			super.enable();
			back_bttn_mc.enable();
			
			setComparisonText();
			setLargerImage();
			setSmallerImage();
		}
		
		public override function disable():void {
			if(_smallLoader) _smallLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadSmallImageCompleteHandler, false);
			if (_bigLoader)_bigLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadBigImageCompleteHandler, false);
			_smallLoader = null;
			_bigLoader = null;
			_bigLoader = null;
			if(image_smaller_mc.numChildren > 0) image_smaller_mc.removeChildAt(0);
			if(image_larger_mc.numChildren > 0) image_larger_mc.removeChildAt(0);
			back_bttn_mc.disable();
			super.disable();
		}
		
		protected function setComparisonText():void {
			bigger_item_txt.text = Controller.comparisonDTO.getLargerItem().name;
			smaller_item_txt.text = Controller.comparisonDTO.getSmallerItem().name;
			ratio_txt.text = Controller.comparisonDTO.getRoundedRatio().toString();
		}
		
		protected function setSmallerImage():void {
			_smallLoader = new Loader();
			_smallLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadSmallImageCompleteHandler, false, 0, true);
			_smallLoader.load(new URLRequest(Controller.comparisonDTO.getSmallerItem().source));			
		}
		
		protected function setLargerImage():void {
			_bigLoader = new Loader();
			_bigLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadBigImageCompleteHandler, false, 0, true);
			_bigLoader.load(new URLRequest(Controller.comparisonDTO.getLargerItem().source));			
		}
		
		protected function onLoadSmallImageCompleteHandler(e:Event):void {
			image_smaller_mc.addChild(_smallLoader);
		}
		
		protected function onLoadBigImageCompleteHandler(e:Event):void {
			image_larger_mc.addChild(_bigLoader);
			scaleImages();
		}
		
		protected function scaleImages():void {
			image_smaller_mc.getChildAt(0).width = image_larger_mc.getChildAt(0).width / Math.sqrt(Controller.comparisonDTO.getRoundedRatio());
			image_smaller_mc.getChildAt(0).height = image_larger_mc.getChildAt(0).height / Math.sqrt(Controller.comparisonDTO.getRoundedRatio());
		}
	}

}