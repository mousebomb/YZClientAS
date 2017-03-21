package tl.core.common
{
	import starling.display.Image;

	import tl.core.DataSources.Item;
	import tl.utils.HCss;

	public class HScreenText extends HSprite
	{
		private var _eventList:Vector.<HLinkText>;
		private var _txtList:Vector.<StarlingTextField>;
		private var _imageList:Vector.<Image>;
		private var _showColor:String = "#ffffff16nu00";
		public function HScreenText()
		{
		}
		/** 更新显示文本*/		
		public function updateShowText(text:String):void
		{
			var rawText:String=text;
			rawText=rawText.replace(/\n/g,"");
			rawText=rawText.replace(/<A/gi,"\n<A");
			rawText=rawText.replace(/\/A>/gi,"/A>\n");
			var regExp:RegExp=/^(<A.*>).*(<\/A>)$/gimx;
			var matchArr:Array=rawText.match(regExp);		//得到所有的文本链接
			//使用中间变量保存当前文本字符
			var tempStr:String=text;
			tempStr=tempStr.replace(/<\/A>/gi,"\n</A>");	//先转换链接
			tempStr=tempStr.replace(/<A.*>/gi,"[");		//将链接标签转义
			tempStr=tempStr.replace(/\n<\/A>/gim,"]");	//将链接标签转义
			tempStr=tempStr.replace(/</g,"\n<");			//将html标签转义
			tempStr=tempStr.replace(/>/g,">\n");			//将html标签转义
			tempStr=tempStr.replace(/\n<.*>\n/g,"");		//过滤html标签
			var index:int=0;//链接的索引
			var msg:String = tempStr;
			var i:int;
			var addStr:String = "";
			var currentIndex:int = 0;
			if(tempStr.indexOf("[") > -1)
			{
				msg = "";
				var nameArr:Array = [];
				while(tempStr.indexOf("[",index)>=0){
					currentIndex = index;
					var minIndex:int=tempStr.indexOf("[",index);
					var maxIndex:int=tempStr.indexOf("]",index);
					if(minIndex>=maxIndex){
						break;
					} 
					addStr = tempStr.slice(currentIndex,minIndex);
					var linkText:String = tempStr.slice(minIndex+1,maxIndex);
					msg += addStr + "[" + linkText + "]";
					index=maxIndex+1;
					nameArr.push(linkText);
				}
				msg += tempStr.slice(index,tempStr.length);
				var linkArr:Array = [];
				if(matchArr.length>0){
					var xmlStr:String="<root>"
					for(i=0;i<matchArr.length;i++){
						xmlStr+=matchArr[i].replace(/href/gi,"HREF");
					}
					xmlStr+="</root>";
					var xm:XML=XML(xmlStr);
					var length:int=xm.A.length();
					for(i=0;i<xm.A.length();i++){
						var args:Array=String(xm.A[i].@HREF).split(":");
						linkArr.push(args[1]);
					}
				}
			}
			
			var list:Array = msg.split("[");
			var len:int = list.length;
			var txt:StarlingTextField;
			var vx:int;
			//文本拼装
			var id:int, str:String, eventStr:String;
			var eventTxt:HLinkText, item:Item, itemArr:Array, image:Image;
			for(i=0; i<len; i++)
			{
				str = list[i];
				if(str.indexOf("]") > -1)
				{
					index = str.indexOf("]");
					eventStr = str.substring(0,index);
					if(String(linkArr[id]).substr(0, 8) == "showcamp"){
						image = getImage(String(linkArr[id]).substr(-1));
						if(image)
						{
							this.addChild(image);
							image.x = vx;
							image.y = 3;
							vx += 18;
						}
					}	else {
						eventTxt = getEventTxt();
						if(String(linkArr[id]).substr(0, 9) == "show_item")
						{
							itemArr = String(linkArr[id]).split("|");
							item = new Item;
							item.RefreshItemById(itemArr[1]);
							eventTxt.label = HCss.QualityColorArray[item.Item_Quality] + 16 + eventStr + "*" + itemArr[2];
						}	else  {
							if(String(linkArr[id]).substr(0, 4) == "user")
								eventTxt.eventLabel = _showColor + eventStr;
							else
								eventTxt.eventLabel = HCss.TipsColor3 + "16nu00" + eventStr;
						}
						eventTxt.data = {linkListSource:linkArr[id], playerName:nameArr[id]};
						this.addChild(eventTxt);
						eventTxt.x = vx;
						vx += eventTxt.textWidth;
					}
					id ++;
					str = str.substring(index+1);
					if(str && str.length > 0)
					{
						txt = getTxt();
						txt.label = "#d2a67216" + str;
						this.addChild(txt);
						txt.x = vx;
						vx += txt.textWidth;
					}
				}	else if(str.length > 0) {
					if(str != "")
					{
						txt = getTxt();
						txt.label = str;
						this.addChild(txt);
						txt.x = vx;
						vx += txt.textWidth;
					}
				}
			}
			this.myWidth = vx;
		}
		/**获取链接文本*/
		private function getEventTxt():HLinkText
		{
			if(_eventList == null)
				_eventList = new <HLinkText>[];
			var event:HLinkText;
			if(_eventList.length > 0)
				event = _eventList.pop();
			else {
				event = new HLinkText;
				event.needPose = false;
			}
			return event;
		}
		/**获取普通文本*/
		private function getImage(id:String):Image
		{
			var image:Image, str:String = '';
			/*if(!id || id == "" || id == "0") {
				_showColor = "#ffffff16nu00";
				return null;
			}
			if(_imageList == null)
				_imageList = new <Image>[];
			if(id == '1')
				str = "face/face_65_00";
			else if(id == '2')
				str = "face/face_64_00";
			var texture:Texture = HAssetsManager.getInstance().getMyTexture(SourceTypeEvent.MAIN_FACE_SOURCE, str);
			if(!texture)
			{
				_showColor = "#ffffff16nu00";
				return null;
			}
			if(_imageList.length > 0)
			{
				image = _imageList.pop();
				if(image.texture != texture)
				{
					image.texture = texture;
					image.readjustSize();
				}
			} 	else
				image = new Image(texture);
			if(HMapSources.getInstance().mainWizardObject.Player_Camp == int(id))
				_showColor = "#52fa0016nu00";
			else
				_showColor = "#ff000016nu00";*/
			return image;
		}
		/**获取普通文本*/
		private function getTxt():StarlingTextField
		{
			if(_txtList == null)
				_txtList = new <StarlingTextField>[];
			var txt:StarlingTextField;
			if(_txtList.length > 0)
				txt = _txtList.pop();
			else
			{
				txt = new StarlingTextField;
				txt.width = 600;
			}
			return txt;
		}
		/**清除文本*/
		public function clearTxt():void
		{
			while(this.numChildren)
			{
				var dd:* = this.removeChildAt(0);
				if(dd is StarlingTextField)
					_txtList.push(dd);
				else if(dd is HLinkText)
					_eventList.push(dd);
				else if(dd is Image)
					_imageList.push(dd);
			}
		}
	}
}