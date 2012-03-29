package com.model 
{
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class ComparisonItem
	{
		private var _name:String = "";
		private var _dimension:Number;
		private var _unit:String = "";
		private var _location:String = "";
		
		
		public function ComparisonItem() {
			
		}
		
		public function get name():String {
			return _name;
		}
		
		public function set name(newName:String):void {
			_name = newName;
		}
		
		public function set unit(newUnit:String):void {
			_unit = newUnit;
		}
		
		public function get unit():String {
			return _unit;
		}
		
		public function get dimension():Number {
			return _dimension;
		}
		
		public function set dimension(newDimension:Number):void {
			_dimension = newDimension;
		}
		
		public function set source(newSource:String):void {
			_location = newSource;
		}
		
		public function get source():String {
			return _location;
		}
		
		
	}

}