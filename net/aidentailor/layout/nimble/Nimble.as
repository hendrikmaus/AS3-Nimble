package net.aidentailor.layout.nimble
{
	import flash.display.DisplayObject;

	public class Nimble extends NimbleBase
	{
		/**
		 * Constructor
		 * @param target:DisplayObject
		 * @param parameterObject:Object
		 */
		public function Nimble(target:DisplayObject, parameterObject:Object = null)
		{
			// create parameterObject if it's null
			if (parameterObject == null) parameterObject = {};
			
			// invoke superclass's constructor
			super(target, parameterObject);
			
			// check the parameter object's contents
			parameterObject = checkParameters(parameterObject);
			
			// create Nimble
			createNimble(target, parameterObject);
		}
		
		/**
		 * createNimble
		 * @param target:DisplayObject
		 * @param parameterObject:Object
		 */
		private function createNimble(target:DisplayObject, parameterObject:Object):void
		{
			// assign parameters
			var _alignment:String 	=   parameterObject.alignment;
			var _margin:Number 		=   parameterObject.margin;
			var _tweenType:Object 	=   parameterObject.tweenType;
			var _tweenTime:Number 	=   parameterObject.tweenTime;
			
			// precalculate dimensions
			var _targetWidth:Number  = target.width;
			var _targetHeight:Number = target.height;
			
			// create new values
			var calculatedParameters:Object = new Object();
			
			switch (_alignment) {
				case "TOP_LEFT":
					calculatedParameters = {
						x: 0,
						y: 0,
						offsetX: _margin,
						offsetY: _margin,
						tweenType: _tweenType,
						tweenTime: _tweenTime
					};
				break;
				
				case "TOP":
					calculatedParameters = {
						x: .5,
						y: 0,
						offsetX: -_targetWidth*.5,
						offsetY: _margin,
						tweenType: _tweenType,
						tweenTime: _tweenTime
					};
				break;
				
				case "TOP_RIGHT":
					calculatedParameters = {
						x: 1,
						y: 0,
						offsetX: -_targetWidth - _margin,
						offsetY: _margin,
						tweenType: _tweenType,
						tweenTime: _tweenTime
					};
				break;
				
				case "LEFT":
					calculatedParameters = {
						x: 0,
						y: .5,
						offsetX: _margin,
						offsetY: -_targetHeight*.5,
						tweenType: _tweenType,
						tweenTime: _tweenTime
					};
				break;
				
				case "MIDDLE":
					calculatedParameters = {
						x: .5,
						y: .5,
						offsetX: -_targetWidth*.5 - _margin*.5,
						offsetY: -_targetHeight*.5 - _margin*.5,
						tweenType: _tweenType,
						tweenTime: _tweenTime
					};
				break;
				
				case "RIGHT":
					calculatedParameters = {
						x: 1,
						y: .5,
						offsetX: -_targetWidth - _margin,
						offsetY: -_targetHeight*.5,
						tweenType: _tweenType,
						tweenTime: _tweenTime
					};
				break;
				
				case "BOTTOM_LEFT":
					calculatedParameters = {
						x: 0,
						y: 1,
						offsetX: _margin,
						offsetY: -_targetHeight - _margin,
						tweenType: _tweenType,
						tweenTime: _tweenTime
					};
				break;
				
				case "BOTTOM":
					calculatedParameters = {
						x: .5,
						y: 1,
						offsetX: -_targetWidth*.5,
						offsetY: -_targetHeight - _margin,
						tweenType: _tweenType,
						tweenTime: _tweenTime
					};
				break;
				
				case "BOTTOM_RIGHT":
					calculatedParameters = {
						x: 1,
						y: 1,
						offsetX: -_targetWidth - _margin,
						offsetY: -_targetHeight - _margin,
						tweenType: _tweenType,
						tweenTime: _tweenTime
					};
				break;
			}
			
			// store updated calculatedParameters
			_parameterObject = calculatedParameters;
			
			// reposition object
			reposition();
		}
	}
}