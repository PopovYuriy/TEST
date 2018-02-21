package
{
	import controller.SlotInputController;
	import controller.SomeControllerForInputData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import view.SlotMachine;
	import view.ui.IOutputView;
	import view.ui.UserInterface;
	
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class Main extends Sprite 
	{
		private var _slotView:view.SlotMachine;
		private var _ui:IOutputView;
		private var _slotInputController:SlotInputController;
		private var _someControllerForSlotSettings:SomeControllerForInputData;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_someControllerForSlotSettings = new SomeControllerForInputData();
			
			_ui = new UserInterface();
			addChild(_ui as DisplayObject);
			
			_slotInputController = new SlotInputController(_ui);
			addChild(_slotInputController);
			
			_slotView = new view.SlotMachine();
			_slotView.x = this.stage.stageWidth - _slotView.width >> 1;
			_slotView.y = this.stage.stageHeight - _slotView.height >> 1;
			addChild(_slotView);
		}
		
	}
	
}