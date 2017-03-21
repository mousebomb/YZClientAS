package tl.core.DataSources
{
	import flash.events.EventDispatcher;

	import game.frameworks.system.model.vo.CsvBuffVO;

	public class BuffVO extends EventDispatcher
	{
		public var csvVO:CsvBuffVO;

		
		public var nowTime:int;				//当前Buff剩余时间(秒)
		public var timeEndCallBack:Function;	//时间到执行回调
		public var refreshCallBack:Function;	//每秒刷新BUFF后执行的回调
		
		public function BuffVO()  {  }
		
		/** 刷新时间,每一秒执行一次 **/
		public function refreshTime():void
		{
			if(nowTime == 0)
			{
				if(timeEndCallBack != null) timeEndCallBack(this);
				return;
			}
			if(nowTime == -1) return;
			nowTime--;
			if(refreshCallBack != null) refreshCallBack(this);
		}
	}
}