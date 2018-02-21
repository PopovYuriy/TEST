package view 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class ReelItem extends Sprite 
	{
		public static const ITEM_WIDTH:int = 120;
		public static const ITEM_HEIGHT:int = 100;
		
		private var _content:TextField;
		
		public function ReelItem() 
		{
			super();
			
			init();
		}
		
		private function init():void 
		{
			var shape:Shape = new Shape();
			shape.graphics.lineStyle(1, 0x0, 1);
			shape.graphics.beginFill(0x0, 0);
			shape.graphics.drawRect(0, 0, ITEM_WIDTH, ITEM_HEIGHT);
			shape.graphics.endFill();
			this.addChild(shape);
			
			var textFormat:TextFormat = new TextFormat(null, 25, 0x474747, true);
			textFormat.align = TextFormatAlign.CENTER;
			
			_content = new TextField();
			_content.defaultTextFormat = textFormat;
			_content.autoSize = TextFieldAutoSize.CENTER;
			_content.text = "Blank";
			addChild(_content);
			
			resizeContent();
		}
		
		private function resizeContent():void 
		{
			_content.x = this.width - _content.textWidth >> 1;
			_content.y = this.height - _content.textHeight >> 1;
		}
		
		public function setContent(val:String):void {
			_content.text = val;
			if (val == "BLANK") _content.text = "";
			resizeContent();
		}
		
	}

}