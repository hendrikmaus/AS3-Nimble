package net.aidentailor.layout.nimble
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Nimble
	{
		// stores alignment parameters
		private var _parameterObject:Object;
		
		// target object
		private var _target:DisplayObject;
		
		// instance to access the stage
		private var _stage:Stage;
		
		// new position coordinates
		private var _newX:Number;
		private var _newY:Number;
		
		/**
		 * Constructor
		 * @param target:DisplayObject
		 * @param parameterObject:Object
		 */
		public function Nimble(target:DisplayObject, parameterObject:Object = null)
		{
			// create parameterObject if it's null
			if (parameterObject == null) parameterObject = {};
			
			// save target, stage instance and parameter object
			_target = target;
			_parameterObject = parameterObject;
			_stage 	= target.stage;
			
			// check parameter values
			_parameterObject = checkParameters(_parameterObject);
			
			// listen to stage resize event
			placeResizeListener();
			
			// create the fluid object
			createNimble(_target, _parameterObject);
		}

		/**
		 * createNimble
		 * @param target:DisplayObject
		 * @param parameterObject:Object
		 */
		private function createNimble(target:DisplayObject, parameterObject:Object):void
		{
			// save alignment & margin
			var alignment:String = parameterObject.alignment;
			var margin:Number    = parameterObject.margin;
			
			// save target dimensions
			var targetWidth:Number  = target.width;
			var targetHeight:Number = target.height;
			
			switch (alignment) {
				case "TOP_LEFT":
					parameterObject = {
						x: 0,
						y: 0,
						offsetX: margin,
						offsetY: margin
					};
				break;
				
				case "TOP":
					parameterObject = {
						x: .5,
						y: 0,
						offsetX: -targetWidth >> 1,
						offsetY: margin
					};
				break;
				
				case "TOP_RIGHT":
					parameterObject = {
						x: 1,
						y: 0,
						offsetX: -targetWidth - margin,
						offsetY: margin
					};
				break;
				
				case "LEFT":
					parameterObject = {
						x: 0,
						y: .5,
						offsetX: margin,
						offsetY: -targetHeight >> 1
					};
				break;
				
				case "MIDDLE":
					parameterObject = {
						x: .5,
						y: .5,
						offsetX: -1 - (targetWidth >> 1) - (margin >> 1),
						offsetY: -1 - (targetHeight >> 1) - (margin >> 1)
					};
				break;
				
				case "RIGHT":
					parameterObject = {
						x: 1,
						y: .5,
						offsetX: -targetWidth - margin,
						offsetY: -targetHeight >> 1
					};
				break;
				
				case "BOTTOM_LEFT":
					parameterObject = {
						x: 0,
						y: 1,
						offsetX: margin,
						offsetY: -targetHeight - margin
					};
				break;
				
				case "BOTTOM":
					parameterObject = {
						x: .5,
						y: 1,
						offsetX: -targetWidth >> 1,
						offsetY: -targetHeight - margin
					};
				break;
				
				case "BOTTOM_RIGHT":
					parameterObject = {
						x: 1,
						y: 1,
						offsetX: -targetWidth - margin,
						offsetY: -targetHeight - margin
					};
				break;
			}
			
			// store updated calculatedParameters
			_parameterObject = parameterObject;
			
			// reposition object
			draw();
		}
		
		/**
		 * reposition
		 * @return void
		 */
		public function draw():void
		{
			// get current dimensions of the stage
			var stageWidth:Number  = _stage.stageWidth;
			var stageHeight:Number = _stage.stageHeight;
			
			// calculate the new x & y
			if (_parameterObject.x != undefined) _newX = (stageWidth  * _parameterObject.x) + _parameterObject.offsetX;
			if (_parameterObject.y != undefined) _newY = (stageHeight * _parameterObject.y) + _parameterObject.offsetY;
			
			// assigns coordinates to target
			_target.x = _newX;
			_target.y = _newY;	
		}
		
		/**
		 * checkParameters
		 * @param obj:Object
		 * @return Object
		 */
		private function checkParameters(parameterObject:Object):Object
		{
			// set default alignment
			if (parameterObject.alignment == undefined) parameterObject.alignment = "MIDDLE";
			
			// set default margin
			if (parameterObject.margin == undefined) parameterObject.margin = 0;
			
			return parameterObject;
		}
		
		/**
		 * placeResizeListener
		 * @return void
		 */
		private function placeResizeListener():void
		{
			_stage.addEventListener(Event.RESIZE,onStageResize);
		}
		
		/**
		 * onStageResize Event Handler
		 * @param e:Event
		 * @return void
		 */
		private function onStageResize(e:Event):void
		{
			draw();
		}
		
		public function get parameterObject():Object
		{
			return _parameterObject;
		}
		
		public function set parameterObject(parameterObject:Object):void
		{
			_parameterObject = parameterObject;
			createNimble(_target, _parameterObject);
		}
	}
}