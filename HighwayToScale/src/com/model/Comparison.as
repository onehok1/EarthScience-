package com.model 
{
	import adobe.utils.CustomActions;
	import com.controller.Controller;
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class Comparison
	{
		private const INCHES_IN_METER:Number = 39.3700787;
		private const FEET_IN_METER:Number = 3.2808399;
		private const INCHES_IN_FEET:Number = 12;
		private const FEET_IN_MILES:Number = 5280;
		private const KILOMETERS_IN_MILES:Number = 1.6093440006146921597227828997904;
		private const SQUARE_KILOMETERS_IN_SQUARE_MILES:Number = 2.58998811;
		private const SQUARE_METERS_IN_SQUARE_KILOMETERS:Number = 1000000;
		private const SQUARE_FEET_IN_SQUARE_METER:Number = 10.7639104;
		private const SQUARE_INCHES_IN_SQUARE_FEET:Number = 144;
		private const METERS_IN_KILOMETERS:Number = 1000;
		
		private var _comparisonItemA:ComparisonItem;
		private var _comparisonItemB:ComparisonItem;
		private var _comparisonDimension:String = "area";
		
		private var _unitValues:Object = { 
			inches: 0,
			inches2:1,
			ft: 2,
			ft2:3,
			m: 4,
			m2: 5,
			km:6,
			km2:7,
			miles:8,
			miles2:9
		};
		
		public function Comparison() {
		}
		
		public function get comparisonItemA():ComparisonItem {
			return _comparisonItemA;
		}
		
		public function set comparisonItemA(newItem:ComparisonItem):void {
			_comparisonItemA = newItem;
		}
		
		public function get comparisonItemB():ComparisonItem {
			return _comparisonItemB;
		}
		
		public function set comparisonItemB(newItem:ComparisonItem):void {
			_comparisonItemB = newItem;
		}
		
		public function set comparisonDimension(newDimension:String):void {
			_comparisonDimension = newDimension;
		}
		
		public function get comparisonDimension():String {
			return _comparisonDimension;
		}
		
		public function getLargerItem():ComparisonItem {
			if (itemAIsGreater()) return _comparisonItemA;
			else return _comparisonItemB;
		}

		public function getSmallerItem():ComparisonItem {
			if (!itemAIsGreater()) return _comparisonItemA;			
			else return _comparisonItemB;
		}
		
		public function convertItemsDimensions():void {
			var targetUnit:String = getSmallerUnit();
			
			convertItem(targetUnit, _comparisonItemA);
			convertItem(targetUnit, _comparisonItemB);
		}
		
		protected function itemAIsGreater():Boolean {
			return _comparisonItemA.dimension[comparisonDimension] >= _comparisonItemB.dimension[comparisonDimension];
		}
			
		public function getRoundedRatio():Number {
			return Math.round(getLargerItem().dimension[comparisonDimension] / getSmallerItem().dimension[comparisonDimension]);
		}
		
		protected function kilometersToInches(kilometerValue:Number):Number {
			return INCHES_IN_METER * 1000;
		}
		
		protected function getLargerUnit():String {
			if (_unitValues[_comparisonItemA.unit[_comparisonDimension]] > _unitValues[_comparisonItemB.unit[_comparisonDimension]]) {
				return _comparisonItemA.unit[_comparisonDimension];
			}
			else {
				return _comparisonItemB.unit[_comparisonDimension];
			}
		}
		
		protected function getSmallerUnit():String {
			var aUnit:Number = _unitValues[_comparisonItemA.unit[_comparisonDimension]];
			var bUnit:Number = _unitValues[_comparisonItemB.unit[_comparisonDimension]];
			if (aUnit > bUnit) {
				return _comparisonItemB.unit[_comparisonDimension];
			}
			else {
				return _comparisonItemA.unit[_comparisonDimension];
			}
		}
		
		protected function convertKilometers(targetUnit:String, comparator:ComparisonItem):Number {
			var dimension:Number = comparator.dimension[_comparisonDimension];
			
			switch(targetUnit) {
				case "km":
					return dimension;
					break;
				default:
					return convertMeters(targetUnit, comparator) * METERS_IN_KILOMETERS;
					break;
			}
			
		}
		
		protected function convertSquareKilometers(targetUnit:String, comparator:ComparisonItem):Number {
			var dimension:Number = comparator.dimension[_comparisonDimension];
			
			switch(targetUnit) {
				case "km2":
					return dimension;
					break;
				default:
					return convertSquareMeters(targetUnit, comparator) * SQUARE_METERS_IN_SQUARE_KILOMETERS;
					break;
			}
			
		}
		
		protected function convertMiles(targetUnit:String, comparator:ComparisonItem):Number {
			switch(targetUnit) {
				case "miles":
					return comparator.dimension[_comparisonDimension];
					break;
				default:
					return convertKilometers(targetUnit, comparator) * KILOMETERS_IN_MILES;
					break;
			}
			
		}
		
		protected function convertSquareMiles(targetUnit:String, comparator:ComparisonItem):Number {
			switch(targetUnit) {
				case "miles2":
					return comparator.dimension[_comparisonDimension];
					break;
				default:
					return convertSquareKilometers(targetUnit, comparator) * SQUARE_KILOMETERS_IN_SQUARE_MILES;
					break;
			}
			
		}
		
		protected function convertMeters(targetUnit:String, comparator:ComparisonItem):Number {
			switch(targetUnit) {
				case "m":
					return comparator.dimension[_comparisonDimension];
					break;
				default:
					return convertFeet(targetUnit, comparator) * FEET_IN_METER;
					break;
			}
		}
		
		protected function convertSquareMeters(targetUnit:String, comparator:ComparisonItem):Number {
			switch(targetUnit) {
				case "m2":
					return comparator.dimension[_comparisonDimension];
					break;
				default:
					return convertSquareFeet(targetUnit, comparator) * SQUARE_FEET_IN_SQUARE_METER;
					break;
			}
		}
		
		protected function convertSquareFeet(targetUnit:String, comparator:ComparisonItem):Number {			
			switch(targetUnit) {
				case "ft2":
					return comparator.dimension[_comparisonDimension];
					break;
				case "inches2":
					return comparator.dimension[_comparisonDimension] * SQUARE_INCHES_IN_SQUARE_FEET;
					break;
				default:
					return 0;
					break;
			}	
		}
		
		protected function convertFeet(targetUnit:String, comparator:ComparisonItem):Number {			
			switch(targetUnit) {
				case "ft":
					return comparator.dimension[comparisonDimension];
					break;
				case "inches":
					return comparator.dimension[comparisonDimension] * INCHES_IN_FEET;
					break;
				default:
					return 0;
					break;
			}			
		}
		
		private function convertItem(targetUnit:String, comparisonItem:ComparisonItem):void {
			var unit:String = comparisonItem.unit[_comparisonDimension];
			
			
			if (unit == "miles") {
				comparisonItem.dimension[comparisonDimension] = convertMiles(targetUnit, comparisonItem);
			}
			else if (unit == "miles2") {
				comparisonItem.dimension[comparisonDimension] = convertSquareMiles(targetUnit, comparisonItem);
			}
			else if (unit == "km") {
				comparisonItem.dimension[comparisonDimension] = convertKilometers(targetUnit, comparisonItem);
			}
			else if (unit == "km2") {
				comparisonItem.dimension[comparisonDimension] = convertSquareKilometers(targetUnit, comparisonItem);
			}
			else if (unit == "m") {
				comparisonItem.dimension[comparisonDimension] = convertMeters(targetUnit, comparisonItem);
			}
			else if (unit == "m2") {
				comparisonItem.dimension[comparisonDimension] = convertSquareMeters(targetUnit, comparisonItem);
			}
			else if (unit == "ft") {
				comparisonItem.dimension[comparisonDimension] = convertFeet(targetUnit, comparisonItem);
			}
			else if (unit == "ft2") {
				comparisonItem.dimension[comparisonDimension] = convertSquareFeet(targetUnit, comparisonItem);
			}
			/*switch(comparisonItem.unit[_comparisonDimension]) {
				case "miles":
					comparisonItem.dimension[comparisonDimension] = convertMiles(targetUnit, comparisonItem);
					break;
				case "miles2":
					comparisonItem.dimension[comparisonDimension] = convertSquareMiles(targetUnit, comparisonItem);
					break;
				case "km":
					comparisonItem.dimension[comparisonDimension] = convertKilometers(targetUnit, comparisonItem);
					break;
				case "km2":
					comparisonItem.dimension[comparisonDimension] = convertSquareKilometers(targetUnit, comparisonItem);
					break;
				case "m":
					comparisonItem.dimension[comparisonDimension] = convertMeters(targetUnit, comparisonItem);
					break;
				case "m2":
					comparisonItem.dimension[comparisonDimension] = convertSquareMeters(targetUnit, comparisonItem);
					break;
				case "ft":
					comparisonItem.dimension[comparisonDimension] = convertFeet(targetUnit, comparisonItem);
					break;
				case "ft2":
					comparisonItem.dimension[comparisonDimension] = convertSquareFeet(targetUnit, comparisonItem);
					break;
				default:
					break;
			}	*/								
		}				
	}
}