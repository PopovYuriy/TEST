package controller 
{
	import events.SlotEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import view.IReelsPattern;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class StartSpinController extends Sprite
	{
		private var _view:IReelsPattern;
		
		public function StartSpinController(view:IReelsPattern) 
		{
			this._view = view;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.stage.addEventListener(SlotEvent.START_SPIN, onStartSpinHandler);
			this.stage.addEventListener(SlotEvent.STOP_SPIN, onStartStopHandler);
		}
		
		public function dispose():void {
			this._view = null;
			this.stage.removeEventListener(SlotEvent.START_SPIN, onStartSpinHandler);
			this.stage.removeEventListener(SlotEvent.STOP_SPIN, onStartStopHandler);
		}
		
		private function onStartStopHandler(e:SlotEvent):void 
		{
			var reels:Vector.<Vector.<int>> = e.data as Vector.<Vector.<int>>;
			
			if (!reels) return;
			
			_view.stopSpin(reels);
		}
		
		private function onStartSpinHandler(e:SlotEvent):void 
		{
			_view.startSpin();
		}
		
	}

}