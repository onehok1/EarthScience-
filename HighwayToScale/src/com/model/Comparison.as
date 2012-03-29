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
		
		public function Comparison(firstComparison:ComparisonItem, secondComparison:ComparisonItem) {
			_comparisonItemA = firstComparison;
			_comparisonItemB = secondComparison;
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
			return _comparisonItemA.dimension >= _comparisonItemB.dimension;
		}
			
		public function getRoundedRatio():Number {
			return Math.round(getLargerItem().dimension / getSmallerItem().dimension);
		}
	}

}