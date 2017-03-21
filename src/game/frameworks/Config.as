/**
 * Created by gaord on 2016/12/15.
 */
package game.frameworks
{
	/** 全局的一些配置 */
	public class Config
	{



		public static const FONT:String = "宋体";

		public static const VERSION_NUN:String = "0.010";	//版本号

		public static var PROJECT_URL:String = "";



		///// old  compatible
		public static const STATE_TYPE_6:uint = 6;			//提升Y区域
		public static const MODEL_SIZE:Number = 3;			//模型窗口显示模型大小

		public function Config()
		{
		}

		public static function get TERRAIN_TEXTURE_URL():String
		{
			return PROJECT_URL +"TerrainTextures/";
		}

		public static function get MOXING_AWD_URL():String
		{
			return PROJECT_URL + "awd/";
		}

		public static function get SKYBOX_URL():String
		{
			return PROJECT_URL + "skybox/";
		}
		public static function get MAP_URL():String
		{
			return PROJECT_URL + "map/";
		}

		public static function get UI_TEXTURE_URL():String
		{
			return PROJECT_URL + "uiRes/";
		}

		public static function get SWF_URL():String
		{
			return PROJECT_URL + "swf/";
		}

		// #pragma mark --  其他配置  ------------------------------------------------------------
        /** 抗锯齿级别 */
		public static const ANTI_ALIAS :uint  = 4;

		/** 摄像机镜头可见距离 */
		public static const CAMERA_FAR :int = 5000;

		/** 开启雾气效果 */
		public static const FOG_ENABLE	:Boolean = true;
	}
}
