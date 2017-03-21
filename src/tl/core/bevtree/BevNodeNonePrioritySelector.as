package tl.core.bevtree
{
	/**
	 * BevNodeNonePrioritySelector
	 * Bomb:
	 * 选择器 。 （组） ，执行一个通过的就跳出。
	 * 遍历子节点，直到评估结果为true
	 *  首次评估都按子节点顺序评估执行谁，只执行最先可执行的。有已经选定的节点时不会自动exit节点
	 * @author hbb
	 */
	public class BevNodeNonePrioritySelector extends BevNodePrioritySelector
	{
		// ----------------------------------------------------------------
		// :: Static
		
		// ----------------------------------------------------------------
		// :: Public Members
		
		// ----------------------------------------------------------------
		// :: Public Methods
		
		public function BevNodeNonePrioritySelector(debugName:String=null)
		{
			super(debugName);
		}
		
		// ----------------------------------------------------------------
		// :: Override Methods
		
		override protected function doEvaluate(input:BevNodeInputParam):Boolean
		{
			if( checkIndex( _currentSelectedIndex ) )
			{
				if( _children[ _currentSelectedIndex ].evaluate( input ) )
				{
					return true;
				}
			}
			
			return super.doEvaluate( input );
		}
		
		
		// ----------------------------------------------------------------
		// :: Private Methods
		
		// ----------------------------------------------------------------
		// :: Private Members
	}
}