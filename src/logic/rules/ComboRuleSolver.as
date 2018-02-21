package logic.rules 
{
	import data.SpinResult;
	import data.vo.RuleVO;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class ComboRuleSolver extends MatchRuleBase 
	{
		
		public function ComboRuleSolver() 
		{
			super();
			
		}
		
		override public function doSolve(data:Vector.<Vector.<int>>, result:SpinResult):void 
		{
			if (checkExcludeRule(result)) return;
			
			var row:Vector.<int>;
			var rule:RuleVO;
			
			for each(row in data) {
				for each(rule in this._rules) {
					var count:int = find(row, rule.symbolId);
					if (count == rule.count) {
						result.addRule(rule.id, rule);
					}
				}
			}
		}
	}

}