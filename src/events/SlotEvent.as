package events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class SlotEvent extends Event 
	{
		public static const START_SPIN:String = "startSpin";
		public static const STOP_SPIN:String = "stopSpin";
		
		private var _data:Object;
		
		public function get data():Object { return _data; }
		
		public function SlotEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
			this._data = data;
		}
		
	}

}