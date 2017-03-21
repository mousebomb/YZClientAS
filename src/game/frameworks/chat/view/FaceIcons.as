package game.frameworks.chat.view
{
    import flash.geom.Rectangle;

    import game.frameworks.chat.view.richText.TextMovieClip;

    import game.frameworks.uicontainer.NotifyUIConst;

    import starling.textures.Texture;

    import tl.core.GPUResProvider;

    import tl.core.common.HSprite;

    /**
	 * 表情显示集 
	 * @author Administrator
	 */	
	public class FaceIcons extends HSprite
	{
		private var _faceAlgs:Vector.<TextMovieClip>;
		private var _rows:int = 8;				//表情行
		private var _cols:int = 8;				//表情列
		public function FaceIcons()
		{
			super();
		}
		public function Init():void
		{
			if(this.isInit) return;
			this.isInit = true;
            var texture:Texture = GPUResProvider.getInstance().getMyTexture(NotifyUIConst.UI_MAIN_SOURCE,"chat/chatBack");
            this.myDrawByTexture(texture);
            this.myScale9Grid = new Rectangle(8,8,16,16);
			_faceAlgs = new <TextMovieClip>[];
			var mc:TextMovieClip , nameStr:String, algs:Vector.<Texture>, iconW:int = 28 , index:int = 5;
			for(var i:int=0; i<_cols; i++)
			{
				for(var j:int=0; j<_rows; j++)
				{
					if((i*_rows +j) < 10)
						nameStr = "0" + (i*_rows +j);
					else
						nameStr = int(i*_rows +j).toString();
					algs = GPUResProvider.getInstance().getMyTextures(NotifyUIConst.UI_FACE_SOURCE,"face/face_" + nameStr + "_0")
					mc = new TextMovieClip();
					this.addChild(mc);
					mc.mouseHand = true;
					mc.setTextureList(algs);
					mc.x = iconW * j + index;
					mc.y = iconW * i + index;
					mc.nameStr = nameStr;
					mc.src = "face/face_" + nameStr + "_0";
					_faceAlgs.push(mc);
				}
			}
			this.myImageWidth  = iconW * j + index * 2;
			this.myImageHeight  = iconW * i + index * 2;
		}
		
		/**
		 * 显示表情时开始动作播放 
		 */		
		public function showFace():void
		{
			if(!this.isInit)
				this.Init();
			var mc:TextMovieClip ;
			for(var i:int=0; i<_cols; i++)
			{
				for(var j:int=0; j<_rows; j++)
				{
					mc = _faceAlgs[int(i*_rows + j)];
					mc.play();
				}
			}
		}
		/**
		 * 隐藏表情时停止动作播放 
		 * 
		 */		
		public function hideFace():void
		{
			var mc:TextMovieClip ;
			for(var i:int=0; i<_cols; i++)
			{
				for(var j:int=0; j<_rows; j++)
				{
					mc = _faceAlgs[int(i*_rows + j)];
					mc.stop();
				}
			}
		}
	}
}