package com.model 
{
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class Comparison
	{
		private var _comparisonItemA:ComparisonItem;
		private var _comparisonItemB:ComparisonItem;
		private var _unitValues:Object = { 
			inches: 0,
			ft: 1,
			m: 2,
			miles:3,
			miles2:4,
			km:5,
			km2:6
		};
		
		private const INCHES_IN_METER:Number = 39.3700787;
		private const FEET_IN_METER:Number = 3.2808399;
		private const INCHES_IN_FEET:Number = 12;
		private const FEET_IN_MILES:Number = 5280;
		private const KILOMETERS_IN_MILES:Number = 1.6093440006146921597227828997904;
		
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
		
		public function getLargerItem():ComparisonItem {
			if (itemAIsGreater()) return _comparisonItemA;
			else return _comparisonItemB;
		}

		public function getSmallerItem():ComparisonItem {
			if (!itemAIsGreater()) return _comparisonItemA;			
			else return _comparisonItemB;
		}
		
		protected function itemAIsGreater():Boolean {
			if(
			return _comparisonItemA.dimension[0] >= _comparisonItemB.dimension[0];
		}
			
		public function getRoundedRatio():Number {
			return Math.round(getLargerItem().dimension[0] / getSmallerItem().dimension[0]);
		}
		
		protected function kilometersToInches(kilometerValue:Number):Number {
			return INCHES_IN_METER * 1000;
		}
		
		protected function getLargerUnit():String {
			if (_unitValues[_comparisonItemA.unit] > _unitValues[_comparisonItemB.unit]) {
				return _comparisonItemA.unit;
			}
			else {
				return _comparisonItemB.unit;
			}
		}
		
		protected function getSmallerUnit():String {
			if (_unitValues[_comparisonItemA.unit] > _unitValues[_comparisonItemB.unit]) {
				return _comparisonItemB.unit;
			}
			else {
				return _comparisonItemA.unit;
			}
		}
		
		protected function convertKilometers(targetUnit:String, comparator:ComparisonItem):Number {
			switch(targetUnit) {
				case "km":
					return comparator.dimension[0];
					break;
				case "km2":
					return comparator.dimension[0];
					break;
				case "m":
					return comparator.dimension[0] * 1000;
					break;
				case "ft":
					return comparator.dimension[0] * 1000 * FEET_IN_METER;
					break;
				case "inches":
					return comparator.dimension[0] * 1000 * INCHES_IN_METER;
					break;
			}
			
		}
		
		
		
	}

}