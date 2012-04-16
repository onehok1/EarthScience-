package com.model 
{
	/**
	 * ...
	 * @author Brandon Dockery
	 */
	public class ComparisonItem
	{
		private var _name:String = "";
		private var _dimension:Object = {};
		private var _unit:String = "";
		private var _location:String = "";
		private var _format:String = "";
		
		
		public function ComparisonItem() {
			_dimension = new Array();
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
		
		public function get dimension():Object {
			return _dimension;
		}
		
		public function set dimension(newDimensions:Object):void {
			_dimension = newDimensions;
		}
		
		public function set source(newSource:String):void {
			_location = newSource;
		}
		
		public function get source():String {
			return _location;
		}
		
		public function get format():String {
			return _format;
		}
		
		public function set format(newFormat:String):void {
			_format = newFormat;
		}
		
		
	}

}