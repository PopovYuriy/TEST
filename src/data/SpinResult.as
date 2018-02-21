package data 
{
	import data.vo.RuleVO;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class SpinResult 
	{
		private var _rules:Dictionary;
		private var _multiplier:Number;
		
		public function SpinResult() 
		{
			_rules = new Dictionary();
		}
		
		public function addRule(ruleId:String, rule:RuleVO):void 
		{
			_rules[ruleId] = rule;
		}
		
		public function containsRule(ruleId:String):Boolean {
			return Boolean(_rules[ruleId]);
		}
		
		public function get totalMultiplier():Number {
			var result:Number = 0;
			var rule:RuleVO;
			for each(rule in _rules) {
				result += rule.multiplier;
			}
			
			if (_multiplier) result *= _multiplier;
			
			return result;
		}
		
		public function get ruleList():Vector.<String> {
			var result:Vector.<String> = new <String>[];
			var rule:RuleVO;
			for each(rule in this._rules) {
				result.push(rule.name);
			}
			return result;
		}
		
		public function get multiplier():Number 
		{
			return _multiplier;
		}
		
		public function set multiplier(value:Number):void 
		{
			_multiplier = value;
		}
		
	}

}