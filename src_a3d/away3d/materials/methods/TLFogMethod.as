package away3d.materials.methods
{
	import away3d.arcane;
	import away3d.core.managers.Stage3DProxy;
	import away3d.materials.compilation.ShaderRegisterCache;
	import away3d.materials.compilation.ShaderRegisterElement;
	
	use namespace arcane;

	/**
	 * FogMethod provides a method to add distance-based fog to a material.
	 */
	public class TLFogMethod extends EffectMethodBase
	{
		private var _minDistance:Number = 20;
		private var _maxDistance:Number = 100;

		/**
		 *    近处淡出
		 * @param minDistance The distance from which the fog starts appearing. 摄像机near
		 * @param maxDistance The distance at which the fog is densest. 近处就不显示的效果
		 */
		public function TLFogMethod(  minDistance:Number, maxDistance:Number)
		{
			super();
			this.minDistance = minDistance;
			this.maxDistance = maxDistance;
		}

		/**
		 * @inheritDoc
		 */
		override arcane function initVO(vo:MethodVO):void
		{
			vo.needsProjection = true;
		}

		/**
		 * @inheritDoc
		 */
		override arcane function initConstants(vo:MethodVO):void
		{
			var data:Vector.<Number> = vo.fragmentData;
			var index:int = vo.fragmentConstantsIndex;
			data[index + 2] = 0.0;
		}

		/** 彻底消失的地方（摄像机的near） */
		public function get minDistance():Number
		{
			return _minDistance;
		}
		
		public function set minDistance(value:Number):void
		{
			_minDistance = value;
		}

		/** 离得近的就渐渐消失alpha */
		public function get maxDistance():Number
		{
			return _maxDistance;
		}
		
		public function set maxDistance(value:Number):void
		{
			_maxDistance = value;
		}

		/**
		 * @inheritDoc
		 */
		arcane override function activate(vo:MethodVO, stage3DProxy:Stage3DProxy):void
		{
			var data:Vector.<Number> = vo.fragmentData;
			var index:int = vo.fragmentConstantsIndex;
			//fogData 近景消隐
			data[index + 0] = _minDistance;
			data[index + 1] = 1/(_maxDistance - _minDistance);
			data[index + 2] = 0.0;//alpha
		}

		/**
		 * @inheritDoc
		 */
		arcane override function getFragmentCode(vo:MethodVO, regCache:ShaderRegisterCache, targetReg:ShaderRegisterElement):String
		{
			var fogData:ShaderRegisterElement = regCache.getFreeFragmentConstant();
			var temp:ShaderRegisterElement = regCache.getFreeFragmentVectorTemp();
			regCache.addFragmentTempUsages(temp, 1);
			var code:String = "";
			vo.fragmentConstantsIndex = fogData.index*4;

            /*
             project.z-_maxDistance
             oc.a  = oc.a * (fogRatio);
            */
            // vt2.w = (projection.z-_minDistance)*(1/(_maxDistance-_minDistance)
			code += "sub " + temp + ".w, "+_sharedRegisters.projectionFragment + ".z" + fogData + ".x, \n" +
				"mul " + temp + ".w, " + temp + ".w, " + fogData + ".y					\n" +
				"sat " + temp + ".w, " + temp + ".w										\n" +//saturate 为0~1
            // oc.a = vt.a * fogRatio
				"mul " + targetReg + ", " + targetReg + ", " + temp + ".w					\n";
//				"mov " + targetReg + ".rgba, " + temp + ".w										\n";

			regCache.removeFragmentTempUsage(temp);
			
			return code;
		}

	}
}
