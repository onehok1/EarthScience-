package com.view 
{
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	
	import com.controller.Controller;
	import com.view.interactive.controls.BackButton;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.*;
	
	
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
			setSmallerImage();
			setLargerImage();
	
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
			Controller.comparisonDTO.convertItemsDimensions();

			switch(Controller.comparisonDTO.comparisonDimension) {
				case "area":
					dimension_txt.text = "large";
					break;
				case "width":
					dimension_txt.text = "wide";
					break;
				case "height":
					dimension_txt.text = "tall";
					break;
				case "long":
					dimension_txt.text = "long";
					break;
				default:
					dimension_txt.text = "large"
					break;
			}
			bigger_item_txt.text = Controller.comparisonDTO.getLargerItem().name;
			smaller_item_txt.text = Controller.comparisonDTO.getSmallerItem().name;
			ratio_txt.text = Controller.comparisonDTO.getRoundedRatio().toString();
		}
		
		protected function setSmallerImage():void {
			var src:String = Controller.comparisonDTO.getSmallerItem().source;
			var format:String = Controller.comparisonDTO.getSmallerItem().format;
			if(format == "bitmap"){
				_smallLoader = new Loader();
				_smallLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadSmallImageCompleteHandler, false, 0, true);
				_smallLoader.load(new URLRequest(src));	
			}
			else {
				var smallClass:Class = getDefinitionByName(src) as Class;
				var smallClip:MovieClip = new smallClass() as MovieClip;
				image_smaller_mc.addChild(smallClip);
			}
		}
		
		protected function setLargerImage():void {
			var src:String = Controller.comparisonDTO.getLargerItem().source;
			var format:String = Controller.comparisonDTO.getLargerItem().format;
			if(format == "bitmap"){
				_bigLoader = new Loader();
				_bigLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadBigImageCompleteHandler, false, 0, true);
				_bigLoader.load(new URLRequest(src));
			}
			else if (format == "vector") {
				var bigClass:Class = getDefinitionByName(src) as Class;
				var bigClip:MovieClip = new bigClass() as MovieClip;
				image_larger_mc.addChild(bigClip);
				scaleImages();
			}			
		}
		
		protected function onLoadSmallImageCompleteHandler(e:Event):void {
			image_smaller_mc.addChild(_smallLoader);
		}
		
		protected function onLoadBigImageCompleteHandler(e:Event):void {
			image_larger_mc.addChild(_bigLoader);
			scaleImages();
		}
		
		protected function scaleImages():void {
			switch(Controller.comparisonDTO.comparisonDimension) {
				case "area":
					image_smaller_mc.getChildAt(0).width = image_larger_mc.getChildAt(0).width / Controller.comparisonDTO.getRoundedRatio();
					image_smaller_mc.getChildAt(0).height = image_larger_mc.getChildAt(0).height / Math.sqrt(Controller.comparisonDTO.getRoundedRatio());
					break;
				case "width":
					image_smaller_mc.getChildAt(0).width = image_larger_mc.getChildAt(0).width / Controller.comparisonDTO.getRoundedRatio();
					image_smaller_mc.getChildAt(0).scaleY = image_smaller_mc.getChildAt(0).scaleX;
					break;
				case "height":
					image_smaller_mc.getChildAt(0).height = image_larger_mc.getChildAt(0).height / Controller.comparisonDTO.getRoundedRatio();
					image_smaller_mc.getChildAt(0).scaleX = image_smaller_mc.getChildAt(0).scaleY;
					break;
				case "long":
					image_smaller_mc.getChildAt(0).width = image_larger_mc.getChildAt(0).width / Controller.comparisonDTO.getRoundedRatio();
					image_smaller_mc.getChildAt(0).scaleY = image_smaller_mc.getChildAt(0).scaleX;
					break;
				default:
					image_smaller_mc.getChildAt(0).width = image_larger_mc.getChildAt(0).width / Controller.comparisonDTO.getRoundedRatio();
					image_smaller_mc.getChildAt(0).height = image_larger_mc.getChildAt(0).height / Math.sqrt(Controller.comparisonDTO.getRoundedRatio());
					break;
			}
		}
	}

}