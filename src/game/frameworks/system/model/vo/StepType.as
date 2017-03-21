package game.frameworks.system.model.vo
{
	public class StepType
	{
		
		public static var step_0:int = 0;
		public static var step_1:int = 1;
		public static var step_2:int = 2;		//开始加载setting文件
		public static var step_3:int = 3;		//setting文件加载完成、version文件开始加载
		public static var step_4:int = 4;		//version文件加载完成、加载背景开始加载
		public static var step_5:int = 5;		//加载背景文件加载完成、
		public static var step_6:int = 6;		//开始连接服务器
		public static var step_7:int = 7;		//服务器连接成功
		public static var step_8:int = 8;		//开始加载csv文件
		public static var step_9:int = 9;		//csv加载完成
		public static var step_10:int = 10;		//发送MsgId_Login_Login登陆
		public static var step_11:int = 11;		//等待前一相同角色下线
		public static var step_12:int = 12;		//加载创建角色界面
		public static var step_13:int = 13;		//创建角色界面加载完成，
		public static var step_14:int = 14;		//创建角色完成
		public static var step_15:int = 15;		//加载主界面资源
		public static var step_16:int = 16;		//主界面资源加载完成
		public static var step_17:int = 17;		//进入游戏
		public static var step_18:int = 18;
		public static var step_19:int = 19;
		public static var step_20:int = 20;
		public function StepType()
		{
		}
	}
}