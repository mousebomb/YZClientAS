package tl.core.common
{
	/**
	 * 对象sprite基类,所有继承Sprite类都继承此类方便以后扩张 
	 */

import flash.geom.Rectangle;

import starling.display.Image;
	import starling.textures.Texture;

	public class HSprite extends HBaseSprite
	{

		private var _image:Image;
		/**是否事件穿透*/
		public var isPierce:Boolean;					//
		public function HSprite()
		{
			super();
		}
		/**
		 * 通过一个纹理创建图片 
		 * @param _Textuer
		 * 
		 */		
		public function myDrawByTexture(_Textuer:Texture):void{
			if(_Textuer)
			{
				myWidth=_Textuer.width;
				myHeight=_Textuer.height;
				if(!_image){
					_image=new Image(_Textuer);
					this.addChildAt(_image,0);
				}else{
					_image.texture=_Textuer;
					_image.readjustSize();
				}
			}
			isInit = true;
		}
		
		public override function dispose():void
		{
			if(_image)
			{
				_image.texture.dispose();
				_image.dispose();
				_image = null;
			}
			super.dispose();
		}

		public function get myImage():Image
		{
			return _image;
		}

        public function set myScale9Grid(rectangle:Rectangle):void
        {
            _image.scale9Grid = rectangle;
        }

        public function get myScale9Grid():Rectangle
        {
            return _image.scale9Grid;
        }

        public function set myImageWidth(value:int):void
        {
            this.myWidth = _image.width = value;
        }

        public function set myImageHeight(value:int):void
        {
            this.myHeight = _image.height = value;
        }
	}
}