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
			return _comparisonItemA.dimension[0] >= _comparisonItemB.dimension[0];
		}
			
		public function getRoundedRatio():Number {
			return Math.round(getLargerItem().dimension[0] / getSmallerItem().dimension[0]);
		}
	}

}