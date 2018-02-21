package logic.rules 
{
	import data.SlotData;
	import data.SpinResult;
	import data.vo.Vec2VO;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class RuleSolversDirector 
	{
		private var _solvers:Vector.<MatchRuleBase>;
		private var _solversData:Dictionary;
		
		private var _result:SpinResult;
		
		public function get result():SpinResult 
		{
			return _result;
		}
		
		public function get solvers():Dictionary 
		{
			return _solversData;
		}
		
		public function RuleSolversDirector() 
		{
			_solvers = new <MatchRuleBase>[];
			_solversData = new Dictionary();
		}
		
		public function addSolver(solver:MatchRuleBase, data:Vector.<Vector.<Vec2VO>>):void {
			_solversData[solver] = data;
			_solvers.push(solver);
		}
		
		public function doSolve():void {
			var solver:MatchRuleBase;
			
			this._result = new SpinResult();
			
			for each (solver in _solvers) {
				solver.doSolve(getDataForSolver(solver), this._result);
			}
		}
		
		private function getDataForSolver(solver:MatchRuleBase):Vector.<Vector.<int>> {
			var result:Vector.<Vector.<int>> = new < Vector.<int> > [];
			
			var positions:Vector.<Vector.<Vec2VO>> = this._solversData[solver];
			var rowPositions:Vector.<Vec2VO>;
			var vec:Vec2VO;
			for each(rowPositions in positions) {
				var row:Vector.<int> = new <int>[];
				
				for each(vec in rowPositions) {
					row.push(SlotData.instance.board[vec.x][vec.y]);
				}
				
				result.push(row);
			}
			
			return result;
		}
		
	}

}