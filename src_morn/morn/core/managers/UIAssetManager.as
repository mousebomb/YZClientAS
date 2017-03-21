/**
 * Morn UI Version 2.1.0623 http://www.mornui.com/
 * Feedback yungzhu@gmail.com http://weibo.com/newyung
 */
package morn.core.managers {
	import flash.display.BitmapData;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	
	import morn.core.utils.BitmapUtils;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	/**资源管理器*/
	public class UIAssetManager {
		private var _bmdMap:Object = {};
		private var _clipsMap:Object = {};
		private var _domain:ApplicationDomain = ApplicationDomain.currentDomain;
		private var _atlases:Dictionary;

		/**判断是否有类的定义*/
		public function hasClass(name:String):Boolean {
			return _domain.hasDefinition(name);
		}

		/**获取类*/
		public function getClass(name:String):Class {
			if (hasClass(name)) {
				return _domain.getDefinition(name) as Class;
			}
			App.log.error("Miss Asset:", name);
			return null;
		}

		/**获取资源*/
		public function getAsset(name:String):* {
			var assetClass:Class = getClass(name);
			if (assetClass != null) {
				return new assetClass();
			}
			return null;
		}

		/**获取位图数据*/
		public function getBitmapData(name:String, cache:Boolean = true):BitmapData {
			var bmd:BitmapData = _bmdMap[name];
			if (bmd == null) {
				var bmdClass:Class = getClass(name);
				if (bmdClass == null) {
					return null;
				}
				bmd = new bmdClass(1, 1);
				if (cache) {
					_bmdMap[name] = bmd;
				}
			}
			return bmd;
		}

		/**获取切片资源*/
		public function getClips(name:String, xNum:int, yNum:int, cache:Boolean = true):Vector.<BitmapData> {
			var clips:Vector.<BitmapData> = _clipsMap[name];
			if (clips == null) {
				var bmd:BitmapData = getBitmapData(name, false);
				if (bmd == null) {
					return null;
				}
				clips = BitmapUtils.createClips(bmd, xNum, yNum);
				if (cache) {
					_clipsMap[name] = clips;
				}
			}
			return clips;
		}

		/**缓存位图数据*/
		public function cacheBitmapData(name:String, bmd:BitmapData):void {
			if (bmd) {
				_bmdMap[name] = bmd;
			}
		}

		/**销毁位图数据*/
		public function disposeBitmapData(name:String):void {
			var bmd:BitmapData = _bmdMap[name];
			if (bmd) {
				delete _bmdMap[name];
				bmd.dispose();
			}
		}

		/**缓存切片资源*/
		public function cacheClips(name:String, clips:Vector.<BitmapData>):void {
			if (clips) {
				_clipsMap[name] = clips;
			}
		}

		/**销毁切片位图数据*/
		public function destroyClips(name:String):void {
			var clips:Vector.<BitmapData> = _clipsMap[name];
			if (clips) {
				for each (var item:BitmapData in clips) {
					item.dispose();
				}
				clips.length = 0;
				delete _clipsMap[name];
			}
		}

		public function getTexture(skin:String):Texture {
			var texture:Texture = null;
			if (skin) {
				var splitArr:Array = skin.split(".");
				if (splitArr.length >= 2) {
					var atlas:TextureAtlas = App.assetManager.getTextureAtlas(splitArr[0]);
					if (atlas) {
						texture = atlas.getTexture(splitArr[1]);
					}
				}
			}
			return texture;
		}
		
		/**
		 * 
		 * @param texturePath
		 * @param index
		 * @return 
		 */
		public function getTextureIndex(texturePath:String, index:uint):Texture {
			var texture:Texture = null;
			if (texturePath) {
				texture = getTexture(texturePath + "_" + index);
			}
			return texture;
		}
		
		
		public function getBmdTexture(skin:String):BitmapData {
			var bmd:BitmapData = null;
			if (skin) {
				var splitArr:Array = skin.split(".");
				if (splitArr.length >= 2) {
					var atlas:UITextureAtlas = App.asset.getTextureAtlas(splitArr[0]);
					if (atlas) {
						bmd = atlas.getTexture(splitArr[1]);
					}
				}
			}
			return bmd;
		}
		
		
		
		
		/** Returns a texture atlas with a certain name, or null if it's not found. */
		public function getTextureAtlas(name:String):UITextureAtlas {
			return _atlases[name] as UITextureAtlas;
		}
		
		/** Register a texture atlas under a certain name. It will be available right away.
		 *  If the name was already taken, the existing atlas will be disposed and replaced
		 *  by the new one. */
		public function addTextureAtlas(name:String, atlas:UITextureAtlas):void {
			trace("Adding texture atlas '" + name + "'");
			
			if (name in _atlases) {
				trace("Warning: name was already in use; the previous atlas will be replaced.");
				_atlases[name].dispose();
			}
			
			_atlases[name] = atlas;
		}
		
		/** Removes a certain texture atlas, optionally disposing it. */
		public function removeTextureAtlas(name:String, dispose:Boolean = true):void {
			trace("Removing texture atlas '" + name + "'");
			
			if (dispose && name in _atlases)
				_atlases[name].dispose();
			
			delete _atlases[name];
		}
		
		public function removeAllTextureAtlas(prefix:String = "", dispose:Boolean = true):void {
			for (var name:String in _atlases)
				if (name.indexOf(prefix) == 0)
					removeTextureAtlas(name, dispose);
		}
		
		/** Returns all texture atlas names that start with a certain string, sorted alphabetically.
		 *  If you pass an <code>out</code>-vector, the names will be added to that vector. */
		public function getTextureAtlasNames(prefix:String = "", out:Vector.<String> = null):Vector.<String> {
			return getDictionaryKeys(_atlases, prefix, out);
		}
		
		private function getDictionaryKeys(dictionary:Dictionary, prefix:String = "",
										   out:Vector.<String> = null):Vector.<String> {
			if (out == null) out = new <String>[];
			
			for (var name:String in dictionary)
				if (name.indexOf(prefix) == 0)
					out[out.length] = name; // avoid 'push'
			
			out.sort(Array.CASEINSENSITIVE);
			return out;
		}

	}

}