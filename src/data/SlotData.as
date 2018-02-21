package data 
{
	import logic.rules.RuleSolversDirector;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class SlotData 
	{
		private static var _instance:SlotData;
		
		private var _board:Vector.<Vector.<int>>;
		private var _rules:RuleSolversDirector;
		
		public function SlotData(p:PrvtClass) 
		{
			this._rules = new RuleSolversDirector();
		}
		
		public static function get instance():SlotData {
			return _instance ? _instance : _instance = new SlotData(new PrvtClass());
		}
		
		public function get board():Vector.<Vector.<int>> 
		{
			return _board;
		}
		
		public function set board(value:Vector.<Vector.<int>>):void 
		{
			_board = value;
		}
		
		public function get rules():RuleSolversDirector 
		{
			return _rules;
		}
		
		public function set rules(value:RuleSolversDirector):void 
		{
			_rules = value;
		}
		
	}

}

class PrvtClass {
	public function PrvtClass() 
	{
	}
}