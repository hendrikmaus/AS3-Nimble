package  
{
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.Sprite;
	import net.aidentailor.layout.nimble.Nimble;

	[SWF(width="1100", height="700", frameRate="30", backgroundColor="0xFFFFFF")]

	/**
	 * @author aidentailor
	 */
	public class NimbleTestsuite extends Sprite 
	{
		public function NimbleTestsuite()
		{
			setStageScaleMode();
			createShapes();
		}
		
		/**
		 * createShapes
		 * @return void
		 */
		private function createShapes():void
		{
			var positions:Array = ["TOP_LEFT","TOP","TOP_RIGHT","LEFT","MIDDLE","RIGHT","BOTTOM_LEFT","BOTTOM","BOTTOM_RIGHT"];
			var length:int      = positions.length;
			var edgeLength:int  = 150;
			var centerX:Number  = (stage.stageWidth >> 1) - edgeLength >> 1;
			var centerY:Number  = (stage.stageHeight >> 1) - edgeLength >> 1;
			
			for (var i:int = 0; i < length; ++i) {
				var shape:Sprite = new Sprite();
				shape.graphics.lineStyle(1);
				shape.graphics.beginFill(0xCCCCCC);
				shape.graphics.drawRect(0, 0, edgeLength, edgeLength);
				shape.cacheAsBitmap = true;
				shape.x = centerX;
				shape.y = centerY;
				addChild(shape);
				
				var tf:TextField = new TextField();
				tf.text = positions[i];
				tf.autoSize = TextFieldAutoSize.LEFT;
				tf.cacheAsBitmap = true;
				tf.x = 5;
				tf.y = 10;
				shape.addChild(tf);
				
				
				if (positions[i] != "MIDDLE") {
					// give every sprite a margin of 20
					new Nimble(shape, {alignment: positions[i], margin: 20});
				}
				else {
					// middle one without margin
					new Nimble(shape);
				}
			}
		}

		/**
		 * setStageScaleMode();
		 * @return void
		 */
		private function setStageScaleMode():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
		}
	}
}
