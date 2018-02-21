package controller 
{
	import data.SlotData;
	import data.SlotSettings;
	import data.vo.RuleVO;
	import data.vo.Vec2VO;
	import logic.rules.AnyRuleSolver;
	import logic.rules.ComboRuleSolver;
	import logic.rules.MatchRuleBase;
	import logic.rules.ScatterRuleSolver;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class SomeControllerForInputData 
	{
		/**
		 * Контроллер-заглушка. Здесь мы получаем настройки слота.
		 * Например из какого-то JSON.
		 */
		public function SomeControllerForInputData() 
		{
			slotSettings();
			slotData();
		}
		
		private function slotData():void 
		{
			var slotData:SlotData = SlotData.instance;
			
			var combo:MatchRuleBase = new ComboRuleSolver();
			combo.addRule(new RuleVO("BAR1", "BAR1", 1, 3, 3));
			combo.addRule(new RuleVO("BAR2", "BAR2", 2, 3, 4));
			combo.addRule(new RuleVO("BAR3", "BAR3", 3, 3, 5));
			combo.addRule(new RuleVO("BAR7", "BAR7", 4, 3, 25));
			combo.addRule(new RuleVO("H7", "H7", 5, 3, 100));
			combo.addRule(new RuleVO("WILD", "WILD", 8, 3, 1000));
			combo.specialSymbolId = 8;
			
			var anyBar:MatchRuleBase = new AnyRuleSolver();
			anyBar.addRule(new RuleVO("ANY_BAR1", "ANY_BAR", 1, 1, 2));
			anyBar.addRule(new RuleVO("ANY_BAR2", "ANY_BAR", 2, 1, 2));
			anyBar.addRule(new RuleVO("ANY_BAR3", "ANY_BAR", 3, 1, 2));
			anyBar.addExcludeRuleId("BAR1");
			anyBar.addExcludeRuleId("BAR2");
			anyBar.addExcludeRuleId("BAR3");
			
			var any7:MatchRuleBase = new AnyRuleSolver();
			any7.addRule(new RuleVO("ANY_BAR7", "ANY_7", 4, 1, 10));
			any7.addRule(new RuleVO("ANY_H7", "ANY_7", 5, 1, 10));
			any7.addExcludeRuleId("BAR7");
			any7.addExcludeRuleId("H7");
			
			var cherry:ScatterRuleSolver = new ScatterRuleSolver();
			cherry.addRule(new RuleVO("CHERRY_1", "CHERRY", 6, 1, 2));
			cherry.addRule(new RuleVO("CHERRY_2", "CHERRY", 6, 2, 10));
			cherry.addRule(new RuleVO("CHERRY_3", "CHERRY", 6, 3, 25));
			cherry.symbolId = 6;
			
			var bonus:ScatterRuleSolver = new ScatterRuleSolver();
			bonus.addRule(new RuleVO("BONUS", "BONUS", 7, 3, 10));
			bonus.symbolId = 7;
			bonus.multiplier = 1000;
			
			slotData.rules.addSolver(combo, SlotSettings.instance.lines);
			slotData.rules.addSolver(anyBar, SlotSettings.instance.board);
			slotData.rules.addSolver(any7, SlotSettings.instance.board);
			slotData.rules.addSolver(cherry, SlotSettings.instance.board);
			slotData.rules.addSolver(bonus, SlotSettings.instance.board);
		}
		
		private function slotSettings():void 
		{
			var settings:data.SlotSettings = data.SlotSettings.instance;
			
			settings.reelsCount = 3;
			settings.itemsOnReel = 3;
			
			settings.reelItems = new < String > ["BLANK", "BAR1", "BAR2", "BAR3", "BAR7", "H7", "CHERRY", "BONUS", "WILD"];
			
			settings.reelSchemes = new < Vector.<int> > [
									new <int> [0, 4, 0, 3, 0, 7, 0, 2, 0, 5, 0, 1, 0, 8, 0, 3, 0, 7, 0, 5, 0, 6],
									new <int> [0, 4, 0, 3, 0, 7, 0, 1, 0, 5, 0, 2, 0, 8, 0, 1, 0, 7, 0, 5, 0, 6],
									new <int> [0, 4, 0, 3, 0, 7, 0, 2, 0, 5, 0, 1, 0, 8, 0, 2, 0, 7, 0, 5, 0, 6]
			];
			
			settings.reelWeights = new < Vector.<int> > [
									new <int>[1, 25, 10, 15, 30, 25, 30, 40, 15, 10, 8, 45, 3, 5, 3, 10, 30, 25, 30, 10, 1, 1],
									new <int>[2, 25, 10, 15, 30, 15, 30, 20, 8, 10, 8, 40, 2, 3, 2, 20, 30, 20, 30, 10, 2, 2],
									new <int>[3, 25, 10, 25, 15, 20, 15, 40, 8, 10, 8, 25, 1, 2, 1, 15, 15, 20, 15, 10, 3, 3]
			];
			
			settings.lines = new < Vector.<data.vo.Vec2VO> > [
									new <data.vo.Vec2VO>[new data.vo.Vec2VO(0, 1), new data.vo.Vec2VO(1, 1), new data.vo.Vec2VO(2, 1)],
									new <data.vo.Vec2VO>[new data.vo.Vec2VO(0, 0), new data.vo.Vec2VO(1, 0), new data.vo.Vec2VO(2, 0)],
									new <data.vo.Vec2VO>[new data.vo.Vec2VO(0, 2), new data.vo.Vec2VO(1, 2), new data.vo.Vec2VO(2, 2)],
									new <data.vo.Vec2VO>[new data.vo.Vec2VO(0, 0), new data.vo.Vec2VO(1, 1), new data.vo.Vec2VO(2, 2)],
									new <data.vo.Vec2VO>[new data.vo.Vec2VO(0, 2), new data.vo.Vec2VO(1, 1), new data.vo.Vec2VO(2, 0)]
			];
			
			settings.board = new < Vector.<data.vo.Vec2VO> > [
									new <data.vo.Vec2VO>[new data.vo.Vec2VO(0, 0), new data.vo.Vec2VO(0, 1), new data.vo.Vec2VO(0, 2)],
									new <data.vo.Vec2VO>[new data.vo.Vec2VO(1, 0), new data.vo.Vec2VO(1, 1), new data.vo.Vec2VO(1, 2)],
									new <data.vo.Vec2VO>[new data.vo.Vec2VO(2, 0), new data.vo.Vec2VO(2, 1), new data.vo.Vec2VO(2, 2)]
			];
		}
		
	}

}