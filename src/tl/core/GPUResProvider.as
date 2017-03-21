/**
 * Created by gaord on 2016/12/21.
 */
package tl.core
{
	import away3d.animators.SkeletonAnimationSet;
	import away3d.animators.data.Skeleton;
	import away3d.core.base.Geometry;
	import away3d.library.assets.IAsset;
	import away3d.materials.ColorMaterial;
	import away3d.textures.ATFCubeTexture;
	import away3d.textures.ATFTexture;

	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	import game.frameworks.Config;

	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	import tl.core.bombloader.JYLoader;

	/**GPU资源 ： 贴图 统一管理 */
	public class GPUResProvider
	{

		private static var instance:GPUResProvider;

		/** */
		public function GPUResProvider()
		{
			if (instance) throw new Error("单例只能实例化一次,请用 getInstance() 取实例。");
			instance = this;
		}

		public static function getInstance():GPUResProvider
		{
			instance ||= new GPUResProvider();
			return instance;
		}


		// #pragma mark --  地图贴图相关  ------------------------------------------------------------
		/** 获得地图贴图材质; 完成会回调cb(layerIndex,ATFTexture) */
		public final function getTerrainTexture(name:String, cb:Function ,layerIndex : int):void
		{
			var url:String = Config.TERRAIN_TEXTURE_URL + name + GPUResType.Suffix_ATF;
			JYLoader.getInstance().reqResource(url, JYLoader.RES_ATF_A3D, 0, JYLoader.GROUP_SCENE, onTerrainTextureLoaded, null,[cb,layerIndex]);

		}

		private final function onTerrainTextureLoaded(url:String, atf :ATFTexture, mark:Array):void
		{
			mark[0](mark[1] , atf);
		}

		/**获得地图预览材质 png
		 * @param name 不包含扩展名的贴图名
		 * @param cb 回调cb(bmd:BitmapData); */
		public function getTerrainTexturePreview(name:String, cb:Function):void
		{
			var url:String = Config.TERRAIN_TEXTURE_URL + name + GPUResType.Suffix_PNG;
			JYLoader.getInstance().reqResource(url, JYLoader.RES_BITMAP, 0, JYLoader.GROUP_UI, onTerrainTexturePngLoaded,null,[cb,name]);
		}
		private function onTerrainTexturePngLoaded(url:String, bmd:BitmapData, mark:Array):void
		{
			(mark[0])(mark[1],bmd);
		}


		// #pragma mark --  精灵加载相关  ------------------------------------------------------------
		/** 加载精灵的mesh文件，需要得到mesh ， skeleton ， skeletonAnimationSet */
		public function getWizardMesh(packName:String, subPath:String, cb:Function):void
		{
			var url:String = Config.PROJECT_URL + subPath + "/" + packName + GPUResType.Suffix_MD5Mesh;
			JYLoader.getInstance().reqResource(url,JYLoader.RES_MESH, 0,JYLoader.GROUP_CHARA,onMD5MeshLoaded,null,cb);
		}

		private function onMD5MeshLoaded(url:String, assets :Vector.<IAsset> , callback:Function):void
		{
			// away3D 解析完毕
			var geo :Geometry;
			var ske:Skeleton ;
			var sas :SkeletonAnimationSet;
			for (var i:int = 0; i < assets.length; i++)
			{
				var asset:IAsset = assets[i];
				if(asset is Geometry) geo = asset as Geometry;
				else if (asset is Skeleton) ske = asset as Skeleton;
				else if (asset is SkeletonAnimationSet) sas = asset as SkeletonAnimationSet;
			}
			// 回调  TODO 采用自动引用计数 采用弱引用保存
			callback( geo , ske , sas);
		}

		/** 加载精灵骨骼动画 */
		public function getWizardAnim(packName:String, subPath:String,name:String, cb:Function):void
		{
			var url:String = Config.PROJECT_URL + subPath + "/" + packName + GPUResType.Suffix_MD5Anim;
			JYLoader.getInstance().reqResource(url,JYLoader.RES_ANIM, 0,JYLoader.GROUP_CHARA,onWizardAnimLoaded,null,[cb,name]);
		}

		private function onWizardAnimLoaded(url:String, assets :Vector.<IAsset>, args:Array):void
		{
			// SkeletonClipNode
			args[0](args[1],assets[0]);
		}

		/** 加载精灵的atf贴图 */
		public function getWizardTexture(packName:String, subPath:String, cb:Function):void
		{
			var url:String = Config.PROJECT_URL + subPath + "/" + packName + GPUResType.Suffix_ATF;
			JYLoader.getInstance().reqResource(url,JYLoader.RES_ATF_A3D, 0,JYLoader.GROUP_CHARA,onWizardAtfLoaded,null,cb);
		}

		private function onWizardAtfLoaded(url:String ,atf :ATFTexture,callback :Function):void
		{
			// 回调  TODO 采用自动引用计数 采用弱引用保存
			callback(atf);
		}


		// #pragma mark --  新3D显示对象加载  ------------------------------------------------------------
		/*
		* 所有的3D模型 用awd格式，带骨骼动作 放在awd文件夹里，以数字.awd命名 数字对应表里配的resId
		* */
		/** 加载3D模型 */
		public function getAWD(resId : String , cb:Function ,priority = 0 ):void
		{
			var url :String = Config.MOXING_AWD_URL +resId +".awd";
			JYLoader.getInstance().reqResource( url ,JYLoader.RES_AWD, priority,JYLoader.GROUP_CHARA,onAWDLoaded,null,[cb,resId]);
		}

		private function onAWDLoaded(url:String , assets :Vector.<IAsset>, args:Array ):void
		{
			args[0](args[1] , assets);
		}



		// #pragma mark --  公共彩色材质  ------------------------------------------------------------

		private  var materialDic :Dictionary = new Dictionary();
		/**公共彩色材质*/
		public  function getColorMaterial(color:uint):ColorMaterial
		{
			if( materialDic[color] ==null)
			{
				materialDic[color] = new ColorMaterial(color , 0.8);
			}
			return materialDic[color];
		}

		// #pragma mark --  天空盒材质  ------------------------------------------------------------

		/** 加载天空盒材质 */
		public function getSkyboxTexture( cubeName :String ,cb :Function ):void
		{
			var url:String = Config.SKYBOX_URL + cubeName + GPUResType.Suffix_ATF;
			JYLoader.getInstance().reqResource(url,JYLoader.RES_ATF_CUBE_A3D, 0,JYLoader.GROUP_SCENE,onCubeAtfLoaded,null,cb);
		}

		private function onCubeAtfLoaded(url:String ,atf :ATFCubeTexture,callback :Function):void
		{
			// 回调  TODO 采用自动引用计数 采用弱引用保存
			callback(atf);
		}



		// #pragma mark --  Starling UI  ------------------------------------------------------------
		/**
		 * 加载一个UI所需要的所有外部纹理集  (直接根据UI类)
		 * 如 preloadUIDependencies();
		 *  */
		public function preloadUIDependencies( uiClazz :Class ,finishCb:Function ):void
		{
			var resNames :Array = uiClazz.dependsRes;
			for (var i:int = 0; i < uiClazz.dependsClass.length; i++)
			{
				var eachDependClass:Class= uiClazz.dependsClass[i];
				for (var j:int = 0; j < eachDependClass.dependsRes.length; j++)
				{
					var eachDependRes:String = eachDependClass.dependsRes[j];
					if(resNames.indexOf(eachDependRes)==-1)
					{
						resNames.push(eachDependRes);
					}
				}
			}
			preloadUITextureAtlas(resNames,finishCb);
		}
		/**
		 * 预加载多个纹理集 (已知依赖的纹理集)
		 * @param finishCb  ^() 完成后的回调()
		 * */
		public function preloadUITextureAtlas(resNames:Array, finishCb:Function ):void
		{
			var waitLoad:int=0;
			for (var i:int = 0; i < resNames.length; i++)
			{
				var resName:String = resNames[i];
				if(uiAtlasCache[resName]==null)
				{
					getUITextureAtlas(resName, null);
					waitLoad++;
				}
			}
			if(finishCb!=null)
			{
				if (waitLoad>0)
					JYLoader.getInstance().addAllLoadCompleteCallback(JYLoader.GROUP_UI, finishCb);
				else
					finishCb();
			}
		}
		/** 加载一个纹理集 */
		public function getUITextureAtlas( resName :String ,cb :Function ):void
		{
			if(uiAtlasCache[resName])
			{
				if(cb!=null) cb(uiAtlasCache[resName]);
				return;
			}
			//TODO 改成合到一起
			var res1 :String = Config.UI_TEXTURE_URL +resName + ".atf";
			var res2 :String = Config.UI_TEXTURE_URL +resName + ".xml";
			JYLoader.getInstance().reqResource(res1,JYLoader.RES_ATF_UI,0,JYLoader.GROUP_UI, function (url:*,data:Texture,mark:*):void
			{
				JYLoader.getInstance().reqResource(res2,JYLoader.RES_BYTEARRAY,0,JYLoader.GROUP_UI, function (url:*, xmlData:ByteArray, mark:*)
				{
					var atlasXML:XML = XML(xmlData.readUTFBytes(xmlData.bytesAvailable));
					var atlas :TextureAtlas = new TextureAtlas(data , atlasXML);
					uiAtlasCache[resName] = atlas;
					if(cb!=null)
					{
						cb(atlas);
					}
				});
			});
		}
		/** 存储atlas */
		private var uiAtlasCache:Dictionary = new Dictionary();

		/** 直接获取纹理集(已加载好的) */
		public function getTextureAtlas(resName:String):TextureAtlas
		{
			if(uiAtlasCache[resName])
				return uiAtlasCache[resName];
			else
			{
				getUITextureAtlas(resName, null);
				return null;
			}
		}

        /** 直接获取纹理(已加载好的) */
        public function getMyTexture(atlasResName:String, imgName:String ):Texture
        {
            var atlas :TextureAtlas=getTextureAtlas(atlasResName);
            if(atlas)
                return atlas.getTexture(imgName);
            else
                return null;
        }
        /** 直接获取纹理组(已加载好的) */
        public function getMyTextures(atlasResName:String, imgName:String ):Vector.<Texture>
        {
            var atlas :TextureAtlas=getTextureAtlas(atlasResName);
            if(atlas)
                return atlas.getTextures(imgName);
            else
                return null;
        }

		/** 获得当前UI的加载进度
		 * */
		public function getUILoadProgress():Number
		{
			return 	 JYLoader.getInstance().loadingProgress(JYLoader.GROUP_UI);
		}

	}
}
