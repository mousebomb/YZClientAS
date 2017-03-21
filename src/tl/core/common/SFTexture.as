package tl.core.common
{
	import flash.display.BitmapData;
	
	import starling.textures.Texture;
	
	public class SFTexture extends Texture
	{
		public function SFTexture()
		{
			super();
		}
		/** Creates a texture object from bitmap data.
		 *  Beware: you must not dispose 'data' if Starling should handle a lost device context;
		 *  alternatively, you can handle restoration yourself via "texture.root.onRestore".
		 *
		 *  @param data   the texture will be created with the bitmap data of this object.
		 *  @param generateMipMaps  indicates if mipMaps will be created.
		 *  @param optimizeForRenderToTexture  indicates if this texture will be used as
		 *                  render target
		 *  @param scale    the scale factor of the created texture. This affects the reported
		 *                  width and height of the texture object.
		 *  @param format   the context3D texture format to use. Pass one of the packed or
		 *                  compressed formats to save memory (at the price of reduced image
		 *                  quality).
		 *  @param repeat   the repeat value of the texture. Only useful for power-of-two textures.
		 */
		public static function fromTextBitmapData(data:BitmapData, onRestore:Function, generateMipMaps:Boolean=true,
											  optimizeForRenderToTexture:Boolean=false,
											  scale:Number=1, format:String="bgra",
											  repeat:Boolean=false):Texture
		{
			try {
				var texture:Texture = Texture.empty(data.width / scale, data.height / scale, true,
				generateMipMaps, optimizeForRenderToTexture, scale,
				format, repeat);
				texture.root.uploadBitmapData(data);
			} 	catch (e:Error){
				return null;
			}
			if(onRestore)
			{
                texture.root.onRestore = onRestore;
			}	else {
                texture.root.onRestore = function():void
                {
                    texture.root.uploadBitmapData(data);
                };
			}
			
			return texture;
		}
	}
}