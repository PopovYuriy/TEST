package logic.rules 
{
	import data.SpinResult;
	import data.vo.Vec2VO;
	import data.vo.RuleVO;
	
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class MatchRuleBase
	{
		protected var _rules:Vector.<RuleVO>;
		protected var _excludeRuleIds:Vector.<String>;
		protected var _specialSymbolId:int = -1;
		
		public function MatchRuleBase() 
		{
			_rules = new <RuleVO>[];
			_excludeRuleIds = new <String>[];
		}
		
		public function addRule(rule:RuleVO):void 
		{
			this._rules.push(rule);
		}
		
		public function addExcludeRuleId(ruleId:String):void {
			this._excludeRuleIds.push(ruleId);
		}
		
		public function doSolve(data:Vector.<Vector.<int>>,result:SpinResult):void 
		{
			
		}
		
		protected function find(data:Vector.<int>, symbolId:int):int {
			var result:int = 0;
			var id:int;
			for each(id in data) {
				if (id == symbolId || (_specialSymbolId != -1 && id == _specialSymbolId)) result++;
			}
			return result;
		}
		
		protected function checkExcludeRule(result:SpinResult):Boolean {
			var ruleId:String;
			for each(ruleId in this._excludeRuleIds) {
				if (result.containsRule(ruleId)) return true;
			}
			return false;
		}
		
		public function get specialSymbolId():int 
		{
			return _specialSymbolId;
		}
		
		public function set specialSymbolId(value:int):void 
		{
			_specialSymbolId = value;
		}
		
	}

}