package controller 
{
	import data.SlotData;
	import data.SpinResult;
	import events.SlotEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import logic.IMatrixGenerator;
	import logic.SimpleBoardGenerator;
	import view.ui.IOutputView;
	
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class SlotInputController extends Sprite
	{
		private var _boardGenerator:IMatrixGenerator;
		private var _view:IOutputView;
		
		/**
		 * Контроллер отвечающий за входящие данные от игрока.
		 */
		public function SlotInputController(view:IOutputView) 
		{
			this._view = view;
			
			if (this.stage) init();
			else this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function dispose():void 
		{			
			this.stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUpHandler);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_boardGenerator = new SimpleBoardGenerator();
			
			this.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUpHandler);
		}
		
		private function onKeyUpHandler(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.SPACE) {
				this.dispatchEvent(new SlotEvent(SlotEvent.START_SPIN, null, true));
				
				var reels:Vector.<Vector.<int>> = _boardGenerator.generate();
				/*var reels:Vector.<Vector.<int>> = new < Vector.<int> > [
					new <int>[1,0,2],
					new <int>[8,0,2],
					new <int>[8,0,8]
				];*/
				SlotData.instance.board = reels;
				
				this.dispatchEvent(new SlotEvent(SlotEvent.STOP_SPIN, reels, true));
				
				SlotData.instance.rules.doSolve();
				
				output(SlotData.instance.rules.result);
			}
		}
		
		private function output(result:SpinResult):void {
			_view.updateRules(result.ruleList.toString());
			_view.updateMultiplier(result.totalMultiplier);
		}
		
	}

}