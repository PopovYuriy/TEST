package view 
{
	import data.SlotSettings;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class ReelView extends Sprite 
	{		
		private var _reelItems:Vector.<ReelItem>;
		
		public function ReelView(itemsCount:int) 
		{
			super();
			
			_reelItems = new Vector.<ReelItem>(itemsCount, true);
			
			for (var i:int = 0; i < itemsCount; i++) {
				var reelItem:ReelItem = new ReelItem();
				reelItem.y = i * ReelItem.ITEM_HEIGHT;
				addChild(reelItem);
				_reelItems[i] = reelItem;
			}
		}
		
		public function setItems(items:Vector.<int>):void {
			for (var i:int = 0; i < _reelItems.length; i++) {
				_reelItems[i].setContent(data.SlotSettings.instance.reelItems[items[i]]);
			}
		}
		
	}

}