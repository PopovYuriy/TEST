package logic.rules 
{
	import data.SpinResult;
	import data.vo.RuleVO;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class ScatterRuleSolver extends MatchRuleBase 
	{
		protected var _symbolId:int;
		protected var _multiplier:int;
		
		public function ScatterRuleSolver() 
		{
			super();
			
		}
		
		override public function doSolve(data:Vector.<Vector.<int>>, result:SpinResult):void 
		{
			if (checkExcludeRule(result)) return;
			
			var count:int = 0;
			var row:Vector.<int>;
			var rule:RuleVO;
			
			for each(row in data) {
				count += find(row, this._symbolId);
			}
			
			for each(rule in _rules) {
				if (rule.count == count) {
					if (_multiplier) {
						result.multiplier = _multiplier;
						result.addRule(rule.id, new RuleVO(rule.id, rule.id, rule.symbolId, rule.count, 0));
					} else {
						result.addRule(rule.id, rule);
					}
				}
			}
		}
		
		public function set symbolId(value:int):void 
		{
			_symbolId = value;
		}
		
		public function get multiplier():int 
		{
			return _multiplier;
		}
		
		public function set multiplier(value:int):void 
		{
			_multiplier = value;
		}
		
	}

}