package logic.rules 
{
	import data.SpinResult;
	import data.vo.RuleVO;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class AnyRuleSolver extends MatchRuleBase 
	{
		
		public function AnyRuleSolver() 
		{
			super();
			
		}
		
		override public function doSolve(data:Vector.<Vector.<int>>, result:SpinResult):void 
		{
			if (checkExcludeRule(result)) return;
			
			var rule:RuleVO;
			var row:Vector.<int>;
			
			for each(row in data) {
				for each(rule in this._rules) {
					if (find(row, rule.symbolId) >= rule.count) {
						result.addRule(rule.id, rule);
						return;
					}
				}
			}
		}
		
	}

}