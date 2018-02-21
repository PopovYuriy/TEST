package view 
{
	import data.SlotSettings;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class ReelsPattern extends Sprite implements IReelsPattern
	{
		private var _reels:Vector.<ReelView>;
		
		public function ReelsPattern() 
		{
			super();
			
			_reels = new Vector.<ReelView>(data.SlotSettings.instance.reelsCount, true);
			
			for (var i:int = 0; i < data.SlotSettings.instance.reelsCount; i++ ) {
				var reel:ReelView = new ReelView(data.SlotSettings.instance.itemsOnReel);
				reel.x = i * ReelItem.ITEM_WIDTH;
				addChild(reel);
				_reels[i] = reel;
			}
			
		}
		
		public function setReels(reels:Vector.<Vector.<int>>):void {
			for (var i:int = 0; i < _reels.length; i++) {
				_reels[i].setItems(reels[i]);
			}
		}
		
		public function startSpin():void 
		{
			trace("START_SPIN");
		}
		
		public function stopSpin(reels:Vector.<Vector.<int>>):void {
			trace("STOP_SPIN");
			setReels(reels);
		}
	}

}