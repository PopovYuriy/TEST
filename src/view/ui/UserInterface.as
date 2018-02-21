package view.ui 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class UserInterface extends Sprite implements IOutputView
	{
		private var _ruleTitle:TextField;
		private var _ruleLable:TextField;
		
		private var _multiplierTitle:TextField;
		private var _multiplierLable:TextField;
		
		public function UserInterface() 
		{
			super();
			init();
		}
		
		private function init():void 
		{
			var titleFormat:TextFormat = new TextFormat(null, 14, 0x474747, true);
			var labelFormat:TextFormat = new TextFormat(null, 14, 0x474747, false);
			
			_ruleTitle = new TextField();
			_ruleTitle.defaultTextFormat = titleFormat;
			_ruleTitle.mouseEnabled = false;
			_ruleTitle.text = "Rules:";
			_ruleTitle.height = 30;
			_ruleTitle.x = 20;
			_ruleTitle.y = 500;
			
			_ruleLable = new TextField();
			_ruleLable.defaultTextFormat = labelFormat;
			_ruleLable.width = 300;
			_ruleLable.height = 30;
			_ruleLable.x = 130;
			_ruleLable.y = 500;
			
			_multiplierTitle = new TextField();
			_multiplierTitle.defaultTextFormat = titleFormat;
			_multiplierTitle.mouseEnabled = false;
			_multiplierTitle.text = "Total multiplier:";
			_multiplierTitle.width = 120;
			_multiplierTitle.height = 30;
			_multiplierTitle.x = 20;
			_multiplierTitle.y = 525;
			
			_multiplierLable = new TextField();
			_multiplierLable.defaultTextFormat = labelFormat;
			_multiplierLable.width = 300;
			_multiplierLable.height = 30;
			_multiplierLable.x = 130;
			_multiplierLable.y = 525;
			
			this.addChild(_ruleTitle);
			this.addChild(_ruleLable);
			this.addChild(_multiplierTitle);
			this.addChild(_multiplierLable);
		}
		
		
		/* INTERFACE view.ui.IOutputView */
		
		public function updateRules(value:String):void 
		{
			_ruleLable.text = value;
		}
		
		public function updateMultiplier(value:Number):void 
		{
			_multiplierLable.text = String(value);
		}
		
	}

}