/**
 * Created by Administrator on 2017/3/3.
 */
package game.frameworks.gameLoading.mediator
{
	import game.frameworks.NotifyConst;
	import game.frameworks.system.model.CsvDataModel;
	import game.frameworks.uicontainer.view.mainUI.LoadingUI;

	import org.robotlegs.mvcs.Mediator;

	import starling.display.Image;

	import starling.events.Event;
    import starling.filters.BlurFilter;
    import starling.filters.GlowFilter;
    import starling.textures.Texture;

	import tl.core.GPUResProvider;
    import tl.utils.HCss;

    import tool.StageFrame;

	public class LoadingMediator extends Mediator
	{
		public function LoadingMediator()
		{
		}
		[Inject]
		public var ui:LoadingUI;
		[Inject]
		public var gpuRes:GPUResProvider;
		[Inject]
		public var csvModel:CsvDataModel;
		private var _id:Number = 0.5

		override public function onRegister():void
		{
			ui.ui_txt_name.label = '#F2D89A26地图名字';
			ui.adviceTxt.label = HCss.TipsColor3 + 15 + "抵制不良游戏，拒绝盗版游戏。注意自我保护，谨防受骗上当。适度游戏益脑，沉迷游戏伤身。合理安排时间，享受健康生活。";
			ui.ui_progress_bar.maxNum = 100;
			updatePosition();
			eventMap.mapListener(ui.stage,Event.RESIZE, onResize);
			addContextListener(NotifyConst.CLOSE_LOADING_UI, onClose);

			StageFrame.addActorFun(onUpdateProgress);
		}


		override public function onRemove():void
		{
			StageFrame.removeActorFun(onUpdateProgress);
		}

		private function onUpdateProgress( ):void
		{
			_id = (gpuRes.getUILoadProgress() + csvModel.progress)/2;
			if(isNaN(_id)) _id = 0;
			if(_id > 1)
			{
				_id = 1;
				StageFrame.removeActorFun(onUpdateProgress);
			}
			ui.ui_progress_bar.nowProgress = _id * 100;
		}
		private function onResize(event:* = null):void
		{
			updatePosition();
		}

		private function updatePosition():void
		{
			var imgw:int = 256;
			var imgh:int = 128;
			var vw:int = StageFrame.stage.stageWidth;
			var vh:int = StageFrame.stage.stageHeight;
			if(vw > 1800)
			{
				var scal:Number = vw/1800
				ui.ui_bg.scale = scal;
				ui.ui_bg.x = 0;
				ui.ui_bg.y = 0;
			}	else {
				ui.ui_bg.x = vw - 1800 >> 1;
				ui.ui_bg.y = vh - 900 >> 1;
			}
			var vy:int = vh - imgh ;
			var index:int = vw /imgw + 1;
			var image:Image;
			var textureUp:Texture = gpuRes.getMyTexture("loadingBg" , "Loading_Map_Image_Up");
			var textureDown:Texture = gpuRes.getMyTexture("loadingBg" , "Loading_Map_Image_Down");
			for(var i:int=0; i<index; i++)
			{
				//上标题背景图片
				if(ui.imageUpArr.length-1 < i)
				{
					image = new Image(textureUp);
					ui.addChildAt(image, 1);
					image.x = i*imgw;
					ui.imageUpArr.push(image);
				}
				//下标题背景图片
				if(ui.imageDownArr.length-1 < i)
				{
					image = new Image(textureDown);
					ui.addChildAt(image, 1);
					image.x = i*imgw;
					ui.imageDownArr.push(image);
				}	else {
					image = ui.imageDownArr[i];
				}
				image.y = vy;
			}
			//背景图片
			var vx:int = vw - ui.ui_progress_bar.myWidth >> 1;

			ui.ui_progress_bar.x = vx
			ui.ui_progress_bar.y = vy + 31;
			//地图名背景
			vx = vw - 264 >> 1;
			ui.ui_txt_bg.x = vx;
			ui.ui_txt_bg.y = 24;
			ui.ui_txt_name.x = vx;
			ui.ui_txt_name.y = 24 + 39;

            ui.adviceTxt.y = vh - 25;
            ui.adviceTxt.x = vw - ui.adviceTxt.textWidth >> 1;
		}
		private function onClose():void
		{
			if(ui.parent)
			{
				ui.parent.removeChild(ui);
			}
		}
	}
}
