package logic 
{
	import data.SlotSettings;
	/**
	 * ...
	 * @author mr.Ralf
	 */
	public class SimpleBoardGenerator implements IMatrixGenerator 
	{
		
		public function SimpleBoardGenerator() 
		{
			
		}
		
		
		/* INTERFACE logic.IMatrixGenerator */
		
		public function generate():Vector.<Vector.<int>> 
		{
			var itemPos:int;
			var len:int = data.SlotSettings.instance.reelsCount;
			var itemsCount:int = data.SlotSettings.instance.itemsOnReel;
			
			var result:Vector.<Vector.<int>> = new Vector.<Vector.<int>>(len, true);
			
			var reelStop:int;
			for (var i:int = 0; i < len; i++) {
				result[i] = new Vector.<int>(itemsCount, true);
				reelStop = randomByWeights(data.SlotSettings.instance.reelWeights[i]);
				
				for (var j:int = 0; j < itemsCount; j++) {
					itemPos = reelStop + j;
					if (itemPos >= data.SlotSettings.instance.reelSchemes[i].length) {
						itemPos = reelStop + j - data.SlotSettings.instance.reelSchemes[i].length;
					}
					result[i][j] = data.SlotSettings.instance.reelSchemes[i][itemPos];
				}
			}
			
			return result;
		}
		
		private function randomByWeights(weights:Vector.<int>):int {
			var weightsSum:int = sumNumbers(weights);
			var counter:int = 0;
			var random:int = int(Math.floor(Math.random() * weightsSum));
			var len:int = weights.length;
			
			for (var i:int = 0; i < len; i++) {
				counter += weights[i];
				if (random <= counter - 1) {
					return i;
				}
			}
			return 0;
		}
		
		private function sumNumbers(numbers:Vector.<int>):int {
			var sum:int = 0;
			for each(var i:int in numbers) {
				sum += i;
			}
			return sum;
		}
		
	}

}