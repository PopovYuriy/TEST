package data.vo 
{
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class RuleVO 
	{
		
		private var _id:String;
		private var _name:String;
		private var _symbolId:int;
		private var _count:int;
		private var _multiplier:Number;
		
		public function RuleVO(id:String, name:String, symbolId:int, count:int, multiplier:Number = 0) 
		{
			this._id = id;
			this._name = name;
			this._symbolId = symbolId;
			this._count = count;
			this._multiplier = multiplier;
		}
		
		public function get id():String 
		{
			return _id;
		}
		
		public function set id(value:String):void 
		{
			_id = value;
		}
		
		public function get count():int 
		{
			return _count;
		}
		
		public function set count(value:int):void 
		{
			_count = value;
		}
		
		public function get multiplier():Number 
		{
			return _multiplier;
		}
		
		public function set multiplier(value:Number):void 
		{
			_multiplier = value;
		}
		
		public function get symbolId():int 
		{
			return _symbolId;
		}
		
		public function set symbolId(value:int):void 
		{
			_symbolId = value;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
	}

}