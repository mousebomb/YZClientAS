package tl.Net.Socket
{
	import com.demonsters.debugger.MonsterDebugger;

	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;

	import tool.StageFrame;

	public class Connect extends EventDispatcher
	{
		private var _Config:XML;
		private var _SocketRandom:SocketRandom =new SocketRandom();
		public var Version:String              = "1.0.0";

		public var ipAddress:String;
		public var port:int = 9000;
		private var _socket:Socket;

		private static var MyInstance :Connect;

		public function Connect()
		{
			if (MyInstance)
			{
				throw new Error ("单例只能实例化一次,请用 getInstance() 取实例。");
			}

			_tmpBytes        = new ByteArray();
			_tmpBytes.endian = Endian.LITTLE_ENDIAN;
			MyInstance       = this;
		}

		private var _tmpBytes:ByteArray;

		public function InIt(_xml:XML):void
		{
			if (_xml == null)
			{
				return;
			}
			_Config = _xml;
			_socket = new Socket();
			//连接c++的时候需要反转下顺序
			//if(serverType == CPP)

			_socket.endian = Endian.LITTLE_ENDIAN;
			_socket.addEventListener(Event.CONNECT, handleSocketConnection);
			_socket.addEventListener(Event.CLOSE, handleSocketDisconnection);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, handleIOError);
			_socket.addEventListener(IOErrorEvent.NETWORK_ERROR, handleIOError);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSecurityError);
			//			StageFrame.addGameFun(handleSocketData);
			ipAddress = String(_Config.LogicServer);
			port = int(_Config.LogicPort);

            trace(StageFrame.renderIdx, "[Connect]/InIt Set ip:" + ipAddress + "    port:" + port);
            MonsterDebugger.trace("[Connect]/InIt()" , ipAddress+":"+port,"socket","",0x111111);
			//连接服务端
			connect(ipAddress,port);
		}

		public static function getInstance():Connect
		{
			if (MyInstance == null)
			{
				MyInstance = new Connect();
			}
			return MyInstance;
		}

		public function setHoldRand(value:int):void
		{
			_SocketRandom.srand(value);
		}

		public function connect(ip:String = "", p:int = -1):void
		{
			if (ip != "")
			{
				this.ipAddress = ip;
			}
			if (p != -1)
			{
				this.port = p;
			}
//			HLog.getInstance().addPropertyCount("开始 ----> connect ip:"+ipAddress+"    port:"+port);
			_socket.connect(ipAddress, port);
		}

		public function disconnect():void
		{
			if (_socket.connected)
			{
				_socket.close()
			}
		}

		public function sendServer(modlueKey:int, msgKey:int, msgArgs:Array = null):void
		{
			var order:Order = new Order();
			order.setMsgHead(_SocketRandom.rand(), msgKey);
			order.writeBody(msgArgs);

			MonsterDebugger.trace("[Connect]/sendServer()" , msgKey,"socket","C>S",0x119999);
			writeToSocket(order);
		}

		private var _SocketFlag:Boolean=false;//缓冲区是否挂起
		private var _length:int = 0;

		public var totalFlow:uint = 0;
		//		private var _ReadStartTime:Number=0;
		private function handleSocketData(evt:ProgressEvent):void
		{
			//			if (_socket.connected)
			{
				//				_ReadStartTime =  getTimer();
				while (_socket.bytesAvailable)// && getTimer() - _ReadStartTime < 5
				{
					if (_SocketFlag)
					{
						if (_socket.bytesAvailable >= _length)
						{
							totalFlow += _length + 4;
							_tmpBytes.clear();
							_socket.readBytes(_tmpBytes, 0, _length);
							Resolve(_tmpBytes);
							_SocketFlag = false;
						}
						else
						{
							break;
						}
					}
					else
					{
						if (_socket.bytesAvailable < 2)
						{
							break;
						}
						_length     = _socket.readUnsignedShort();
						_SocketFlag = true;
					}
				}
			}
		}


		private var _ResolveFlag:Boolean = false;//解析是否挂起
		private var _Order:Order;

		private function Resolve(buffer:ByteArray):void
		{
			if (_ResolveFlag)
			{
				if (buffer.bytesAvailable >= 16383)
				{
					buffer.readBytes(_Order, _Order.bytesAvailable, 0);
					return;
				}
				if (buffer.bytesAvailable != 4)
				{
					buffer.readBytes(_Order, _Order.bytesAvailable, 0);
				}
				OnRecv();
				_ResolveFlag = false;
			}
			else
			{
				_Order        = new Order();
				_Order.endian =  Endian.LITTLE_ENDIAN;
				buffer.readBytes(_Order, 0, 0);
				if (_Order.bytesAvailable == 16383)
				{
					_ResolveFlag = true;
				}
				else
				{
					OnRecv();
				}
			}
		}

		private function OnRecv():void
		{
			_Order.getMsgHead();
			_Order.MsgType = 0;//强制设置Type为0
			_length        = 0;

			var eventKeyStr:String = "" + _Order.MsgType + _Order.MsgId;
			if (_callBackDic[eventKeyStr] != null)
			{
                MonsterDebugger.trace("[Connect]/OnRecv()" , eventKeyStr,"socket","S>C",0x119911);
                _callBackDic[eventKeyStr](_Order);//执行回调
			}else{
                MonsterDebugger.trace("[Connect]/OnRecv()" , eventKeyStr+" 未处理","socket","S>C",0x009900);
            }
		}

		/**
		 * 添加回调方法
		 * @param $type
		 * @param $callBack
		 */
		public function addOrderCallBack($type:String, $callBack:Function):void
		{
			_callBackDic[$type] = $callBack;
		}

		/**
		 * 移除回调方法
		 * @param $type    : 回调类型
		 */
		public function removeOrderCallBack($type:String):void
		{
			if (_callBackDic[$type] == null)
			{
				return;
			}
			delete _callBackDic[$type];
		}

		private var _callBackDic:Dictionary = new Dictionary();

		private function handleSocketConnection(e:Event):void
		{
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, handleSocketData);
			MonsterDebugger.trace("[Connect]/handleSocketConnection()" , "连接成功","socket","",0x111111);
			this.dispatchEvent(new ConnetEvent(ConnetEvent.ConnetSuccess));
		}

		private function writeToSocket(byte:ByteArray):void
		{
			if (_socket&&_socket.connected)
			{
				_socket.writeBytes(byte);
				_socket.flush();
			}
		}

		private function handleSocketDisconnection(e:Event):void
		{
            MonsterDebugger.trace("[Connect]/handleSocketDisconnection()" , "连接断开...","socket","",0x111111);
            trace("连接断开...");
			dispatchEvent(new ConnetEvent(ConnetEvent.ConnetLost));
		}

		private function handleIOError(err:IOErrorEvent):void
		{
			MonsterDebugger.trace("[Connect]/handleIOError()" , "连接出错...","socket","",0x111111);
            trace("连接出错...", err);
		}

		private function handleSecurityError(err:SecurityErrorEvent):void
		{
            MonsterDebugger.trace("[Connect]/handleSecurityError()" , "连接出错...","socket","",0x111111);
            trace("连接出错...", err);
//			HLog.getInstance().addPropertyCount("handleSecurityError:" + err.text);
		}

		/**读取64整数*/
		public function readUint64(order:ByteArray):Number
		{
			var num1:Number = order.readUnsignedInt();
			var num2:Number = order.readUnsignedInt();
			return num1 + num2 * (1 + uint.MAX_VALUE);
		}

		/**写入64整数*/
		public function writeUint64(num:Number):ByteArray
		{
			var byte:ByteArray = new ByteArray();
			byte.endian        = Endian.LITTLE_ENDIAN;
			var num1:int       = num / (1 + uint.MAX_VALUE);
			var num2:int       = num % (1 + uint.MAX_VALUE);
			byte.writeUnsignedInt(num2);
			byte.writeUnsignedInt(num1);
			byte.position = 0;
			return byte
		}
	}
}