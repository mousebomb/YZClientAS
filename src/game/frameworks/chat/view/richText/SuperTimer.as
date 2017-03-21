package game.frameworks.chat.view.richText
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * 第三方类
	 * 超级计时器(100mm以上 防止加速浏览器有效)
	 */	
	public class SuperTimer extends EventDispatcher
	{
		
		private const DELAY_DEF:Number = 100;
		public static var TRACE:Boolean = false;
			
		//--------------------------------------------------------------------------
		//
		//   Class constructor
		//
		//--------------------------------------------------------------------------
		
		public function SuperTimer(delay:Number, repeatCount:int = 0 )
		{
			_baseDelay = delay;
			_repeatCount = repeatCount;
			_baseTimer = new Timer( _baseDelay > DELAY_DEF ? DELAY_DEF : _baseDelay );
			_timerFunc = new Vector.<Function>;
			_timerCompleteFunc = new Vector.<Function>;
		}
		
		//--------------------------------------------------------------------------
		//
		//         Class properties
		//
		//--------------------------------------------------------------------------
		
		private var _baseTimer:Timer;
		
		//----------------------------------------
		//   delay
		//----------------------------------------
		
		private var _baseDelay:Number;
		
		public function get delay():Number
		{
			return _baseDelay;
		}
		
		/**
		 * 计时器事件间的延迟（以毫秒为单位）。
		 * @param value
		 */
		public function set delay( value:Number ):void
		{
			_baseDelay = value;
		}
		
		//----------------------------------------
		//   currentCount
		//----------------------------------------
		
		private var _currentCount:Number = 0;
		private var _currentCountTemp:Number = 0;
		
		/**
		 * 计时器从 0 开始后触发的总次数。
		 * @return
		 */
		public function get currentCount():int
		{
			return _currentCount;
		}
		
		//----------------------------------------
		//   repeatCount
		//----------------------------------------
		
		private var _repeatCount:int;
		
		public function get repeatCount():int
		{
			return _repeatCount;
		}
		
		/**
		 * 设置的计时器运行总次数。
		 * @param value
		 */
		public function set repeatCount( value:int ):void
		{
			_repeatCount = value;
		}
		
		//----------------------------------------
		//   running
		//----------------------------------------
		
		/**
		 * 计时器的当前状态；如果计时器正在运行，则为 true，否则为 false。
		 * @return
		 */
		public function get running():Boolean
		{
			return _baseTimer.running;
		}
		
		//--------------------------------------------------------------------------
		//
		//   Override methods
		//
		//--------------------------------------------------------------------------
		
		private var _timerFunc:Vector.<Function>;
		private var _timerCompleteFunc:Vector.<Function>;
		private var _lastOverTime:Number = 0;
		private var _nowTime:Number = 0;
		
		override public function addEventListener( type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false ):void
		{
			if( type == TimerEvent.TIMER )
			{
				_timerFunc.push( listener );
				
				if( !_baseTimer.hasEventListener( TimerEvent.TIMER ))
					_baseTimer.addEventListener( type, timerHandler );
			}
			else if( type == TimerEvent.TIMER_COMPLETE )
			{
				_timerCompleteFunc.push( listener );
				
				if( !_baseTimer.hasEventListener( TimerEvent.TIMER_COMPLETE ))
					_baseTimer.addEventListener( type, timerCompleteHandler );
			}
		}
		
		override public function removeEventListener( type:String, listener:Function, useCapture:Boolean = false ):void
		{
			var index:int;
			
			if( type == TimerEvent.TIMER )
			{
				index = _timerFunc.indexOf( listener );
				
				if( index != -1 )
					_timerFunc.splice( index, 1 );
				
				if( _timerFunc.length == 0 )
					_baseTimer.removeEventListener( type, timerHandler );
			}
			else if( type == TimerEvent.TIMER_COMPLETE )
			{
				index = _timerCompleteFunc.indexOf( listener );
				
				if( index != -1 )
					_timerCompleteFunc.splice( index, 1 );
				
				if( _timerCompleteFunc.length == 0 )
					_baseTimer.removeEventListener( type, timerCompleteHandler );
			}
		}
		
		protected function timerHandler( event:TimerEvent ):void
		{
			_nowTime = new Date().time;
			
			if( _nowTime - _lastOverTime < _baseDelay )
				return;
			
			_lastOverTime = _nowTime - ( _nowTime - _lastOverTime - _baseDelay );
			_currentCount++;
			_currentCountTemp++;
			
			var func:Function;
			
			if( _timerFunc.length > 0 )
			{
				for each( func in _timerFunc )
				{
					func( event );
				}
			}
			
			if( repeatCount > 0 && _currentCountTemp >= repeatCount )
			{
				stop();
				timerCompleteHandler( new TimerEvent( TimerEvent.TIMER_COMPLETE, false, false ));
			}
		}
		
		protected function timerCompleteHandler( event:TimerEvent ):void
		{
			var func:Function;
			
			if( _timerCompleteFunc.length > 0 )
			{
				for each( func in _timerCompleteFunc )
				{
					func( event );
				}
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//   Class methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 如果计时器正在运行，则停止计时器，并将 currentCount 属性设回为 0，这类似于秒表的重置按钮。
		 */
		public function reset():void
		{
			_baseTimer.reset();
			_nowTime = 0;
			_lastOverTime = 0;
			_currentCount = 0;
			_currentCountTemp = 0;
		}
		
		/**
		 * 如果计时器尚未运行，则启动计时器。
		 */
		public function start():void
		{
			if( !_baseTimer.running )
			{
				_baseTimer.start();
				_lastOverTime = new Date().time;
			}
		}
		
		/**
		 * 停止计时器。
		 */
		public function stop():void
		{
			if( _baseTimer.running )
			{
				_baseTimer.stop();
				_currentCountTemp = 0;
			}
		}
		
		/**
		 * 注销释放资源
		 */
		public function destroy():void
		{
			var func:Function;
			
			_baseTimer.reset();
			_nowTime = 0;
			_lastOverTime = 0;
			_currentCount = 0;
			_currentCountTemp = 0;
			
			if( _timerFunc.length > 0 )
			{
				for each( func in _timerFunc )
				{
					_baseTimer.removeEventListener( TimerEvent.TIMER, func );
				}
				
				_timerFunc.length = 0;
			}
			
			if( _timerCompleteFunc.length > 0 )
			{
				for each( func in _timerCompleteFunc )
				{
					_baseTimer.removeEventListener( TimerEvent.TIMER_COMPLETE, func );
				}
				
				_timerCompleteFunc.length = 0;
			}
			
			_baseTimer = null;
		}
	}
}