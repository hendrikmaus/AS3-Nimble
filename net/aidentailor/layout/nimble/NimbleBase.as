package net.aidentailor.layout.nimble
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	
	public class NimbleBase
	{
		// stores alignment parameters
		protected var _parameterObject:Object;
		
		// target object
		protected var _target:DisplayObject;
		
		// instance to access the stage
		protected var _stage:Stage;
		
		// stage dimensions
		protected var _stageW:Number;
		protected var _stageH:Number;
		
		// new position coordinates
		protected var _newX:Number;
		protected var _newY:Number;
		
		//tween type & time
		protected var _tweenType:Object;
		protected var _tweenTime:Number;
		
		/**
		 * Constructor
		 * @param target:DisplayObject
		 * @param paramObj:Object
		 * @description Initialize the variables, invoke method placeResizeListener
		 * 				to listen to the resize event of the stage
		 */
		public function NimbleBase(target:DisplayObject, paramObj:Object)
		{
			// save target, stage instance and parameter object
			_target = target;
			_parameterObject 	= paramObj;
			_stage 	= target.stage;
			
			// check parameter values
			_parameterObject = checkParameters(_parameterObject);
			
			// listen to stage resize event
			placeResizeListener();
			
			// position the object
			reposition();
		}
		
		/**
		 * reposition
		 * @return void
		 * @description reposition the display object
		 */
		protected function reposition():void
		{
			_parameterObject = checkParameters(_parameterObject);
			
			TweenLite.to(_target, _tweenTime, {
				x: _newX,
				y: _newY,
				ease: _tweenType
			});
		}
		
		/**
		 * checkParameters
		 * @param obj:Object
		 * @return Object
		 */
		protected function checkParameters(obj:Object):Object
		{
			// get current dimensions of the stage
			_stageW = _stage.stageWidth;
			_stageH = _stage.stageHeight;
			
			// get new coordinates
			_newX = _target.x;
			_newY = _target.y;
			
			// calculate the new x & y
			if (obj.x != undefined) _newX = (_stageW * obj.x) + obj.offsetX;
			if (obj.y != undefined) _newY = (_stageH * obj.y) + obj.offsetY;
			
			// set default alignment
			if (obj.alignment == undefined) obj.alignment = "MIDDLE";
			
			// set default margin
			if (obj.margin == undefined) obj.margin = 0;
			
			// set default tweenType and tweenTime
			if (obj.tweenType == undefined) obj.tweenType = Expo.easeOut;
			if (obj.tweenTime == undefined) obj.tweenTime = 0.5;
			
			// assign values
			_tweenType = obj.tweenType;
			_tweenTime = obj.tweenTime;
			
			// return object
			return obj;
		}
		
		/**
		 * placeResizeListener
		 * @return void
		 * @description listen to the resize event of the stage instance
		 */
		private function placeResizeListener():void
		{
			_stage.addEventListener(Event.RESIZE,onStageResize);
		}
		
		/**
		 * onStageResize
		 * @param e:Event
		 * @return void
		 * @description Resize event handler - invokes reposition method
		 */
		protected function onStageResize(e:Event):void
		{
			reposition();
		}
	}
}