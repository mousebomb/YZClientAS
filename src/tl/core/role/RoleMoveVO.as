/**
 * Created by gaord on 2017/3/15.
 */
package tl.core.role
{
    import tl.core.terrain.TLMapVO;

    import tool.StageFrame;

    public class RoleMoveVO
    {
        public var oldCellX:Number = 0;
        public var oldCellY:Number = 0;
        public var toCellX:Number = 0;
        public var toCellY:Number = 0;
        public var moveDurTime:Number = 0;
        public var moveStartTime:Number = 0;
        public var moveUpdateFunType:uint = 0;
        public var isFirstMoveFrame:Boolean = false;
        public var moveUpdateDir:uint = 0;

        public function get nowY():Number
        {
            return _nowY;
        }

        public function get nowX():Number
        {
            return _nowX;
        }

        public function get nowCellX():Number
        {
            return _nowX / TLMapVO.TERRAIN_SCALE;
        }

        public function get nowCellY():Number
        {
            return _nowY / TLMapVO.TERRAIN_SCALE;
        }

        public function get nowJumpZ():Number
        {
            return _nowJumpZ;
        }

        public var callback:Function;


        private var _passTime:Number = 0;
        private var _nowX:Number = 0;
        private var _nowY:Number = 0;
        /** 跳跃的话 就有z */
        private var _nowJumpZ:Number = 0;
        private var _jumpMaxZ:Number = 0;

        /** 更新计算移动中的位置 */
        public function update():void
        {
            _passTime = StageFrame.curTime -  moveStartTime;
            switch (moveUpdateFunType)
            {
                case CreatureMoveUpdateFunType.JUMP_SKILL:
                case CreatureMoveUpdateFunType.JUMP_INMAP:
                    updateJump();
                    break;
                case CreatureMoveUpdateFunType.Chong_Feng:
                    updateChongFeng();
                    break;
                case CreatureMoveUpdateFunType.BLINK:
                    updateBlink();
                    break;
                default :
                    updateNormal();
                    break;
            }
        }

        /** 冲锋移动，先快后停 */
        private function updateChongFeng():void
        {
            var percent:Number = passTime / chongfengStage1Time*.6 ;
            if(percent > 1 ) percent = 1.0;
            if( percent < 1)
            {
                _nowX = (oldCellX + (toCellX - oldCellX) * percent) * TLMapVO.TERRAIN_SCALE;
                _nowY = (oldCellY + (toCellY - oldCellY) * percent) * TLMapVO.TERRAIN_SCALE;
            }else{
                _nowX = toCellX * TLMapVO.TERRAIN_SCALE;
                _nowY = toCellY * TLMapVO.TERRAIN_SCALE;
            }
            _nowJumpZ = 0;
        }

        /** 跳跃移动，先快后停 */
        private function updateJump():void
        {
//            if(isFirstMoveFrame)
//            {
//                //首帧 处理一些数据的初始化 如跳跃的话，计算曲线的预估
//                // 冲得越远 跳得越高
//                var distance :Number = PointUtil.distanceOf2Points(oldCellX,oldCellY,toCellX,toCellY);
//                // 最后参数是高度投影系数
//                _jumpMaxZ = distance *TLMapVO.TERRAIN_SCALE* 0.8;
//            }
//            var percent:Number = passTime / jumpStage1Time ;
//            if(percent > 1 ) percent = 1.0;
//            if( percent < 1)
//            {
////				var p :Point = PointUtil.calcPointInLine( oldCellX,oldCellY,toCellX,toCellY,percent ,1 );
////				_nowX = p.x * TLMapVO.TERRAIN_SCALE;
////				_nowY = p.y * TLMapVO.TERRAIN_SCALE;
//                _nowX = (oldCellX + (toCellX - oldCellX) * percent) * TLMapVO.TERRAIN_SCALE;
//                _nowY = (oldCellY + (toCellY - oldCellY) * percent) * TLMapVO.TERRAIN_SCALE;
//                _nowJumpZ = _jumpMaxZ *  Math.sin(percent * Math.PI);
//            }else{
//                _nowX = toCellX * TLMapVO.TERRAIN_SCALE;
//                _nowY = toCellY * TLMapVO.TERRAIN_SCALE;
//                _nowJumpZ = 0;
//            }
        }
        public static const JUMP_STAGE1_PERCENT:Number = 0.5;
        public static const CHONGFENG_STAGE1_PERCENT:Number = 0.3;

        /** 跳和冲锋等 阶段1快速冲刺的时长 */
        public function get jumpStage1Time():Number
        {
            return moveDurTime * JUMP_STAGE1_PERCENT;
        }

        public function get chongfengStage1Time():Number
        {
            return moveDurTime * CHONGFENG_STAGE1_PERCENT;
        }

        /** 不为normal move 的时候，自动判定的 stage1的时长 */
        public function get stage1Time():Number
        {
            switch (moveUpdateFunType)
            {
                case CreatureMoveUpdateFunType.JUMP_SKILL:
                case CreatureMoveUpdateFunType.JUMP_INMAP:
                    return jumpStage1Time;
                    break;
                case CreatureMoveUpdateFunType.Chong_Feng:
                    return chongfengStage1Time;
                    break;
                default :
                    trace("未处理的情形 CreatureMoveVO/stage1Time()");
                    break;
            }
            return 0;
        }

        /** 匀速移动 普通方式 */
        private function updateNormal():void
        {
            if(isFirstMoveFrame)
            {
                //首帧 处理一些数据的初始化
                _jumpMaxZ = 0;
            }
            var percent:Number = passTime / moveDurTime;
            if(percent > 1 ) percent = 1.0;
            _nowX = (oldCellX + (toCellX - oldCellX) * percent) * TLMapVO.TERRAIN_SCALE;
            _nowY = (oldCellY + (toCellY - oldCellY) * percent) * TLMapVO.TERRAIN_SCALE;
            _nowJumpZ = _jumpMaxZ *  Math.sin(percent * Math.PI);
            //			trace("CreatureMoveVO/update()",percent, (oldCellX + (toCellX - oldCellX) * percent)  ,(oldCellY + (toCellY - oldCellY) * percent)   ,  _nowX,_nowY);
        }

        private function updateBlink():void
        {
            if(isFirstMoveFrame)
            {
                //首帧 处理一些数据的初始化
                _jumpMaxZ = 0;
            }
            var percent:Number = passTime / moveDurTime;
            if(percent > 1 ) percent = 1.0;
            if ( percent < 0.5 )
            {
                _nowX = oldCellX * TLMapVO.TERRAIN_SCALE;
                _nowY = oldCellY * TLMapVO.TERRAIN_SCALE;
            }
            else
            {
                _nowX = toCellX * TLMapVO.TERRAIN_SCALE;
                _nowY = toCellY * TLMapVO.TERRAIN_SCALE;
            }
            _nowJumpZ = _jumpMaxZ *  Math.sin(percent * Math.PI);
        }

        public function get passTime():Number
        {
            return _passTime;
        }

        public function get isOver():Boolean
        {
            //trace("isOver");
            //_passTime = getTimer() - moveStartTime;
            return  _passTime >= moveDurTime;
        }
    }

}
