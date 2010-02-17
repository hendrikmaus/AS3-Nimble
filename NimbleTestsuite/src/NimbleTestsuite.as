package  
{
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.Sprite;
	import net.aidentailor.layout.nimble.Nimble;

	[SWF(width="1000", height="600", frameRate="30", backgroundColor="0xFFFFFF")]

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
			var length:uint = positions.length;
			var centerX:Number = stage.stageWidth * .5 - 75;
			var centerY:Number = stage.stageHeight * .5 - 75;
			
			for (var i:int = 0; i < length; ++i) {
				var shape:Sprite = new Sprite();
				shape.graphics.lineStyle(1);
				shape.graphics.beginFill(0xCCCCCC);
				shape.graphics.drawRect(0, 0, 150, 150);
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
					var shapeParams:Object = {
						alignment: positions[i],
						margin: 20
					};
					new Nimble(shape, shapeParams);
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
