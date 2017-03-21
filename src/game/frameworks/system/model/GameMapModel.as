/**
 * Created by gaord on 2017/2/27.
 */
package game.frameworks.system.model
{
	import flash.geom.Point;

	import game.frameworks.system.model.vo.CsvMapVO;

	import tl.core.mapnode.AStar;
	import tl.core.mapnode.AstarFloyd;
	import tl.core.mapnode.Node;
	import tl.core.terrain.TLMapModel;
	import tl.core.terrain.TLMapVO;

	public class GameMapModel extends TLMapModel
	{
		/**地图id*/
		public var mapId:int;
		/**当前地图csv配置*/
		public var csvMapVO:CsvMapVO;
		/**进入类型(0表示是副本大厅进入; 1表示地图跳转点进入)*/
		public var enterType:int;
		/**场景ID*/
		public var scenceId:int;
		/**是否自动战斗标志*/
        public var hookState:int;


		public function GameMapModel()
		{
			super();
		}

		// 地图解析完毕 进一步解析
		override protected function onMapVOInited():void
		{
			refreshNodeArgs();
			super.onMapVOInited();
		}

		// #pragma mark --  寻路相关		  ------------------------------------------------------------

		//----------------------------------------------------------------------------------------------
		private static var _nodePools:Vector.<Node> = new Vector.<Node>();

		private static function getNodeByPool(x:int, y:int):Node
		{
			var tmpNode:Node;
			if (_nodePools.length)
			{
				tmpNode = _nodePools.pop();
			}
			else
			{
				tmpNode = new Node();
			}
			tmpNode.init(x, y);
			return tmpNode;
		}

		private static function recycleNode(node:Node):void
		{
			node.reset();
			if (_nodePools.length < 10000)
			{
				_nodePools.push(node);
			}
		}

		//----------------------------------------------------------------------------------------------

		public var _NodeArgs:Vector.<Vector.<Node>>;
		public var _GridRows:int;
		public var _GridCols:int;
		private const STRAIGHT_COST:Number = 1.0;
		private const DIAG_COST:Number     = Math.SQRT2;

		/**按地图文件创建Node矩阵*/
		public function refreshNodeArgs():void
		{
			_AStar.mapData = mapVO;

			var tmpNode:Node;

			var tmpL:Vector.<Node>;
			for each (tmpL in _NodeArgs)
			{
				for each (tmpNode in tmpL)
				{
					recycleNode(tmpNode);
				}
			}

			_NodeArgs = new Vector.<Vector.<Node>>();
			_GridCols = mapVO.terrainVerticlesX;
			_GridRows = mapVO.terrainVerticlesY;

			for (var i:int = 0; i < _GridRows; i++)
			{
				tmpL = new Vector.<Node>();
				for (var j:int = 0; j < _GridCols; j++)
				{
					tmpNode        = getNodeByPool(j, i);//new Node(i, j);
					tmpNode.pointX = (j + .5) * TLMapVO.TERRAIN_SCALE;
					tmpNode.pointY = (i + .5) * TLMapVO.TERRAIN_SCALE;
					tmpNode.value  = mapVO.getNodeVal(j, i);	//刷新格子类型
					tmpNode.pointH = 0;
					tmpL.push(tmpNode);
				}
				_NodeArgs.push(tmpL);
			}

			calculateLinks();
		}


//		private var _tmpCostVec:Vector.<Vector.<Number>> = new Vector.<Vector.<Number>>(20);
		/**
		 * @param type判断类型
		 */
		public function calculateLinks():void
		{
			var i:int, j:int;
			var tmpNode:Node;
			for (i = 0; i < _GridRows; i++)
			{
				for (j = 0; j < _GridCols; j++)
				{
					initNodeLink(_NodeArgs[i][j]);
				}
			}
		}

		/**
		 *
		 * @param node
		 * @param type启发参数类型
		 */
		public function initNodeLink(node:Node):void
		{
			var startX:int = Math.max(0, node.x - 1);
			var endX:int   = Math.min(_GridRows - 1, node.x + 1);
			var startY:int = Math.max(0, node.y - 1);
			var endY:int   = Math.min(_GridCols - 1, node.y + 1);
			//			node.links = new Vector.<Link>();
			for (var i:int = startX; i <= endX; i++)
			{
				for (var j:int = startY; j <= endY; j++)
				{
					var test:Node = getNode(j, i);
					if (test == null || test == node || !test.walkable)
					{
						continue;
					}
					if (i == node.x || j == node.y)
					{
						node.addLinkNode(test, STRAIGHT_COST);//links.push(new Link(test, STRAIGHT_COST + _tmpCostVec[i][j]));//getNodeCost(test)  + _tmpCostVec[i][j]
					}
					else
					{
						node.addLinkNode(test, DIAG_COST);//node.links.push(new Link(test, DIAG_COST + _tmpCostVec[i][j]));//getNodeCost(test)	 + _tmpCostVec[i][j]
					}
				}
			}
		}

		/*
		 private function getNodeCost(node:Node):Number
		 {
		 var tmpCost:Number = 0;

		 var tmpNode:Node;
		 var half:uint = 1;
		 var maxDist:uint = 3;//half * half;
		 for (var j:int = -half; j <= half; ++j)
		 {
		 for (var k:int = -half; k <= half; ++k)
		 {
		 tmpNode = getNode(node.x + j, node.y + k);
		 if (tmpNode && tmpNode != node && tmpNode.walkable == false)
		 {
		 tmpCost += (maxDist - (Math.abs(j) + Math.abs(k))) * 0.3;
		 }
		 }
		 }
		 return tmpCost;
		 }*/

		/** 按指定的坐标点返回此点对应的Node对象 */
		public function getNodeByPoint(point:Point):Node
		{
			return getNode(point.y / TLMapVO.TERRAIN_SCALE, point.x / TLMapVO.TERRAIN_SCALE);
		}

		/** 获取距离终点最近的可行走点 */
		public function getEndNearest(startPoint:Point, endPoint:Point):Node
		{
			var tx1:int = int(startPoint.x / TLMapVO.TERRAIN_SCALE);
			var ty1:int = int(startPoint.y / TLMapVO.TERRAIN_SCALE);
			var tx2:int = int(endPoint.x / TLMapVO.TERRAIN_SCALE);
			var ty2:int = int(endPoint.y / TLMapVO.TERRAIN_SCALE);

			var retNode:Node;

			retNode = getNode(ty2, tx2);
			if (retNode && retNode.walkable)
			{
				return retNode;
			}

			if (tx1 == tx2 && ty1 == ty2)
			{
				return getNode(ty1, tx1);
			}

			var stepX:int      = tx2 - tx1 > 0 ? 1 : -1;
			var stepY:int      = ty2 - ty1 > 0 ? 1 : -1;
			var tmpx:int       = tx2;
			var tmpy:int       = ty2;
			var i:int, j:int;
			var tmpMaxIncr:int = Math.max(Math.abs(tx2 - tx1), Math.abs(ty2 - ty1));
			var tmpIncr:int    = 1;
			var tmpNode:Node;

			while (tmpIncr < tmpMaxIncr)
			{
				for (i = -tmpIncr; i <= tmpIncr; ++i)
				{
					for (j = -tmpIncr; j <= tmpIncr; ++j)
					{
						if (Math.max(Math.abs(i), Math.abs(j)) == tmpIncr)
						{
							tmpNode = getNode(ty2 + i, tx2 + j);
							if (tmpNode && tmpNode.walkable)
							{
								return tmpNode;
							}
						}
					}
				}
				tmpIncr++;
			}

			return null;
		}

		/**按指定的索引返回对应的Node对象*/
		public function getNode(r:int, c:int):Node
		{
			if (r < 0 || c < 0 || r >= _GridRows || c >= _GridCols)
			{
				return null;
			}
			return _NodeArgs[r][c];
		}


		////////////
		private var _AStar:AStar = new AStar();						//A*寻路
		/**
		 * 依据起始与结束坐标返回a星寻路的路径,返回值是一个由Node对象组成的数组
		 * @param sPoint    : 起始点
		 * @param tPoint    : 目标点
		 * @return
		 */
		private function getPath(sPoint:Point, tPoint:Point):Vector.<Node>
		{
			var retPaths:Vector.<Node>;
			var node1:Node = this.getNodeByPoint(sPoint);
			var node2:Node = this.getNodeByPoint(tPoint);
			//判断目标点是否不可行走区域,返回一下null
			if (!node1 || !node2 || !node2.walkable) //|| !node1.walkable
			{
				return retPaths;
			}
			if (_AStar.findPath(node1, node2))
			{
				retPaths = AstarFloyd.floyd(_AStar.path,this);
			}

			return retPaths;
		}

		private var startP:Point = new Point();
		private var toP:Point    = new Point();

		/** 依据起点终点 返回尽可能可抵达的位置的路径
		 *  坐标采用场景像素坐标 */
		public function autoGetPath(sX:uint, sZ:uint, tX:uint, tZ:uint):Vector.<Node>
		{
			startP.x = sX;
			startP.y = sZ;
			toP.x    = tX;
			toP.y    = tZ;

			var retPaths:Vector.<Node>;
			var node2:Node = getEndNearest(startP, toP);
			var node1:Node = this.getNodeByPoint(startP);
			//判断目标点是否不可行走区域,返回一下null
			if (!node1 || !node2 || !node2.walkable) //|| !node1.walkable
			{
				return retPaths;
			}
			if (_AStar.findPath(node1, node2))
			{
//				retPaths = _AStar.path;
				retPaths = AstarFloyd.floyd(_AStar.path,this);
			}

			return retPaths;
		}



	}
}
