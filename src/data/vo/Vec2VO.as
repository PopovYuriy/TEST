package data.vo 
{
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class Vec2VO 
	{
		private var _y:int;
		private var _x:int;
		
		public function Vec2VO(x:int, y:int) 
		{
			this._y = y;
			this._x = x;
		}
		
		public function get y():int { return this._y }
		
		public function set y(value:int):void { _y = value }
		
		public function get x():int {return this._x}
		
		public function set x(value:int):void { _x = value }
		
	}

}