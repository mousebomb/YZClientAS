package tl.Net.Socket
{
	import flash.events.Event;

	public class ConnetEvent extends Event
	{
		public static const ConnetSuccess:String="ConnetSuccess";
		public static const ConnetLost:String="ConnetLost";

		public var data:Object;
		public function ConnetEvent(type:String, object:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			data=object;
			super(type, bubbles, cancelable);
		}
	}
}