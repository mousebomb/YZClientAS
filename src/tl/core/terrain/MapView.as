/**
 * Created by gaord on 2016/12/13.
 */
package tl.core.terrain
{
	import away3d.bounds.AxisAlignedBoundingBox;
	import away3d.containers.ObjectContainer3D;
	import away3d.textures.ATFTexture;

	import flash.utils.Dictionary;

	import tl.core.GPUResProvider;

	import tool.StageFrame;

	/** 地形视图模型 */
	public class MapView extends ObjectContainer3D
	{
		public var mapVO:TLMapVO;

		public function MapView()
		{
			super();
			StageFrame.addGameFun(validateNow);
		}

		public var bounds:AxisAlignedBoundingBox = new AxisAlignedBoundingBox();

//
//		/** 平面用来hittest 不飘的 */
//		public var planeHitTest:Mesh;


		/** 从地图显示 */
		public function fromMapVO(tlMapVO:TLMapVO):void
		{
			clear();
			//
			mapVO = tlMapVO;
			// 开始显示
			for (var i:int = 0; i < mapVO.tiles.length; i++)
			{
				var tileVO:TLTileVO   = mapVO.tiles[i];
				var tileView:TileView = new TileView(tileVO);
				tileViewDic[tileVO]   = tileView;
				addChild(tileView);
			}
			isHeightDirty = false;
			validateTextures();
			bounds.fromExtremes(0, 0, 0, mapVO.terrainVerticlesX * TLMapVO.TERRAIN_SCALE, 0, -mapVO.terrainVerticlesY * TLMapVO.TERRAIN_SCALE);
			//
//			mouseEnabled = true;
			isShowGrid = false;
			isShowZone=false;
			//
//			if(planeHitTest==null)
//			{
//				planeHitTest = new Mesh(new PlaneGeometry(1, 1, 1, 1));
//				addChild( planeHitTest );
//				planeHitTest.mouseEnabled=true;
//			}
//			planeHitTest.scaleX = bounds.max.x;
//			planeHitTest.scaleZ = bounds.max.z;
//			planeHitTest.position=new Vector3D(bounds.halfExtentsX,bounds.halfExtentsY,bounds.halfExtentsZ);
		}

		/** 地形棋格 */
		private var tileViewDic:Dictionary = new Dictionary();

		/** 清理场景 */
		public function clear():void
		{
			isShowZone=false;
			isShowGrid=false;
			isTextureDirty = isHeightDirty=false;
			if(mapVO && mapVO.tiles)
			{
				for (var i:int = 0; i < mapVO.tiles.length; i++)
				{
					var tileVO:TLTileVO   = mapVO.tiles[i];
					var tileView:TileView = tileViewDic[tileVO];
					delete tileViewDic[tileVO];
					tileView.dispose();
				}
			}
		}

		/** Dirty Validation */
		public function validateNow():void
		{
			if (isHeightDirty)
				validateTileHeight();
			if (isTextureDirty)
				validateTextures();
		}

		// #pragma mark --  高度图变化		  ------------------------------------------------------------
		/** 高度数据变化 ，刷新显示 */
		public function validateTileHeight():void
		{
			for (var i:int = 0; i < mapVO.tiles.length; i++)
			{
				var tileVO:TLTileVO = mapVO.tiles[i];
				(tileViewDic[tileVO] as TileView).validateHeight();
			}
			isHeightDirty = false;
		}

		/** 高度数据已变化 ，需要刷新显示 */
		public var isHeightDirty:Boolean = false;

		// #pragma mark --  纹理加载和变化  ------------------------------------------------------------
		/** 纹理数据变化，需要刷新显示 （不是alpha） */
		public var isTextureDirty:Boolean = false;

		/**纹理数据变化，刷新显示*/
		public function validateTextures():void
		{
			texturesLoaded = 0;
			isTextureDirty = false;
			textures       = [];
			for (var i:int = 0; i < mapVO.textureFiles.length; i++)
			{
				textures [i] = null;
				GPUResProvider.getInstance().getTerrainTexture(mapVO.textureFiles[i], onTextureLoadedOne,i);
			}
		}

		private var textures:Array;
		private var texturesLoaded:int = 0;

		private function onTextureLoadedOne(layerIndex:int, atfTexture:ATFTexture):void
		{
			textures[layerIndex] = atfTexture;
			if (++texturesLoaded == mapVO.textureFiles.length)
			{
//				trace(StageFrame.renderIdx,"MapView/onTextureLoadedOne");
				// 所有需要的纹理都加载完成后通知tile刷新
				TileView.clearSharedMaterial();
				TileView.setSharedMaterial(textures , mapVO.splatAlphaTexture , mapVO.numTileX,mapVO.numTileY );
				for (var i:int = 0; i < mapVO.tiles.length; i++)
				{
					var tileVO:TLTileVO = mapVO.tiles[i];
					(tileViewDic[tileVO] as TileView).validateTexture();
				}


			}
		}




		// #pragma mark --  显示网格  ------------------------------------------------------------
		/** 显示网格 */
		private var _isShowGrid :Boolean;

		public function get isShowGrid():Boolean
		{
			return _isShowGrid;
		}

		public function set isShowGrid(value:Boolean):void
		{
			if(_isShowGrid == value ) return ;
			_isShowGrid = value;
			if(_isShowGrid)
			{
				for (var i:int = 0; i < mapVO.tiles.length; i++)
				{
					var tileVO:TLTileVO   = mapVO.tiles[i];
					var tileView:TileGridView = new TileGridView(tileViewDic[tileVO]);
					tileGridViewDic[tileVO]   = tileView;
					tileView.y =10.0;
					addChild(tileView);
				}
			}else{
				for each (var view:TileGridView in tileGridViewDic)
				{
					view.dispose();//away3d的dispose自带removeFromParent
				}
				tileGridViewDic = new Dictionary();
			}
		}
		/** 地形网格棋格 */
		private var tileGridViewDic:Dictionary = new Dictionary();




		// #pragma mark --  显示格子信息（区域）  ------------------------------------------------------------
		/** 地形区域显示格 */
		private var _isShowZone :Boolean;

		public function get isShowZone():Boolean
		{
			return _isShowZone;
		}

		public function set isShowZone(value:Boolean):void
		{
			if(_isShowZone == value ) return ;
			_isShowZone = value;
			if(_isShowZone)
			{
				for (var i:int = 0; i < mapVO.tiles.length; i++)
				{
					var tileVO:TLTileVO   = mapVO.tiles[i];
					var tileView:TileNodeView = new TileNodeView(tileViewDic[tileVO],tileVO.parentTerrain.debugNodeMap);
					tileZoneViewDic[tileVO]   = tileView;
					tileView.y = 1.5;
					addChild(tileView);
					trace(StageFrame.renderIdx,"[MapView]/isShowGrid this.x",tileView.x,tileView.z);
				}
			}else{
				for each (var view:TileNodeView in tileZoneViewDic)
				{
					view.dispose();//away3d的dispose自带removeFromParent
				}
				tileZoneViewDic = new Dictionary();
				TileNodeView.clearSharedMaterial();
			}
		}
		/** 地形区域显示格 */
		private var tileZoneViewDic:Dictionary = new Dictionary();

	}
}
