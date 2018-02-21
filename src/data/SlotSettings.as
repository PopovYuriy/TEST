package data 
{
	import data.vo.Vec2VO;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class SlotSettings 
	{
		private static var _instance:SlotSettings;
		
		private var _reelItems:Vector.<String>;
		
		private var _reelsCount:int;
		
		private var _itemsOnReel:int;
		
		private var _reelSchemes:Vector.<Vector.<int>>;
		private var _reelWeights:Vector.<Vector.<int>>;
		
		private var _lines:Vector.<Vector.<data.vo.Vec2VO>>;
		
		private var _board:Vector.<Vector.<Vec2VO>>;
		public function SlotSettings(p:PrvtClass) 
		{
			
		}
		
		public static function get instance():SlotSettings {
			return _instance ? _instance : _instance = new SlotSettings(new PrvtClass());
		}
		
		/**
		 * Список возможных символов, в порядке возрастания стоимости.
		 */
		public function get reelItems():Vector.<String> 
		{
			return _reelItems;
		}
		
		public function set reelItems(value:Vector.<String>):void 
		{
			_reelItems = value;
		}
		
		/**
		 * Количество рилов.
		 */
		public function get reelsCount():int 
		{
			return _reelsCount;
		}
		
		public function set reelsCount(value:int):void 
		{
			_reelsCount = value;
		}
		
		/**
		 * Количество симоволов на риле.
		 */
		public function get itemsOnReel():int 
		{
			return _itemsOnReel;
		}
		
		public function set itemsOnReel(value:int):void 
		{
			_itemsOnReel = value;
		}
		
		/**
		 * Схемы рилов.
		 */
		public function get reelSchemes():Vector.<Vector.<int>> 
		{
			return _reelSchemes;
		}
		
		public function set reelSchemes(value:Vector.<Vector.<int>>):void 
		{
			_reelSchemes = value;
		}
		
		/**
		 * Значения веса остановок на рилах.
		 */
		public function get reelWeights():Vector.<Vector.<int>> 
		{
			return _reelWeights;
		}
		
		public function set reelWeights(value:Vector.<Vector.<int>>):void 
		{
			_reelWeights = value;
		}
		
		public function get lines():Vector.<Vector.<data.vo.Vec2VO>> 
		{
			return _lines;
		}
		
		/**
		 * Список выигрышных линий.
		 */
		public function set lines(value:Vector.<Vector.<data.vo.Vec2VO>>):void 
		{
			_lines = value;
		}
		
		public function get board():Vector.<Vector.<Vec2VO>> 
		{
			return _board;
		}
		
		public function set board(value:Vector.<Vector.<Vec2VO>>):void 
		{
			_board = value;
		}
		
	}

}
class PrvtClass {
	public function PrvtClass() 
	{
	}
}