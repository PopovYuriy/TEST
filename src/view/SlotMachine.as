package view 
{
	import controller.StartSpinController;
	import flash.display.Sprite;
	import flash.text.TextField;
	import view.ReelsPattern;
	
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class SlotMachine extends Sprite
	{
		private var _reelsPattern:ReelsPattern;
		private var _spinController:StartSpinController;
		
		public function SlotMachine() 
		{
			super();
			init();
		}
		
		public function dispose():void {
			_spinController.dispose();
		}

		
		private function init():void 
		{
			_reelsPattern = new ReelsPattern();
			addChild(_reelsPattern);
			
			_spinController = new StartSpinController(_reelsPattern);
			addChild(_spinController);
		}
		
	}

}