/**
 * Created by Administrator on 2017/3/14.
 */
package game.frameworks.createRole
{
    import game.frameworks.system.model.CsvDataModel;

    public class CreateRoleModel
    {
        [Inject]
        public var csv: CsvDataModel;
        public var surnamesVec:Vector.<String>;			//姓氏
        public var symbolStrVec:Vector.<String>;			//符号
        public var secondBoyNameVec:Vector.<String>;		//男名
        public var secondGirlNameVec:Vector.<String>;		//女名
        public function CreateRoleModel()
        {
        }
        public function init():void
        {
            var dataArray:Array = csv.table_nameslib;
            var len:int = dataArray.length;

            surnamesVec = new Vector.<String>();
            symbolStrVec = new Vector.<String>();
            secondBoyNameVec = new Vector.<String>();
            secondGirlNameVec = new Vector.<String>();

            for(var i:int = 0; i < len; i++)
            {
                if(int(dataArray[i][0]) == 0) continue;
                //姓氏
                if(dataArray[i][1] != "0")
                    surnamesVec.push( dataArray[i][1] );
                //符号
                if(dataArray[i][2] != "0")
                    symbolStrVec.push( dataArray[i][2] );
                //男名
                if(dataArray[i][3] != "0")
                    secondBoyNameVec.push( dataArray[i][3] );
                //女名
                if(dataArray[i][4] != "0")
                    secondGirlNameVec.push( dataArray[i][4] );
            }
        }
    }
}
