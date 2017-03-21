/**
 * Created by Administrator on 2017/3/10.
 */
package game.frameworks.functionOpen.model
{
    import game.frameworks.system.model.vo.CsvFunctionVO;

    public class FunctionVO
    {
        public var csvVo:CsvFunctionVO;
        public var currentStep:int = 100;
        /**显示3D模型标志*/
        public var isShowWizard:Boolean;
        /**显示图标路径*/
        public var showIcon:String;
        /**显示模型id*/
        public var showWizardId:String;
        /**模型缩放倍数*/
        public var wizardScale:Number ;
        /**是否旋转*/
        public var isRotation:Boolean;
        public var extraFactorKey:int;
        public var extraFactorValue:int;
        /**功能名称*/
        public var functionName: String;
        public function FunctionVO()
        {
        }

        public function updateVo(csvVo:CsvFunctionVO):void
        {
            functionName = csvVo.Name;
            var arr:Array = csvVo.showIcon.split('|');
            showIcon = arr[0];
            if(arr.length > 3)
            {
                isShowWizard = true;
                showWizardId = arr[1];
                wizardScale  = Number(int(arr[2])/100);
                isRotation   = Boolean(arr[3])
            }
            arr = String(csvVo.ExtraFactor).split("|");
            if(arr.length>1)
            {
                extraFactorKey = arr[0];
                extraFactorValue = arr[1];
            }
        }
    }
}
