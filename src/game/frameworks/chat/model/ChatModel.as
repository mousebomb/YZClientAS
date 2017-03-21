/**
 * Created by Administrator on 2017/3/7.
 */
package game.frameworks.chat.model
{
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;

    import game.frameworks.NotifyConst;

    import org.robotlegs.mvcs.Actor;

    import tl.utils.HashMap;


    public class ChatModel extends Actor
	{
		public var chatHash:HashMap = new HashMap();
        public var textFormat:TextFormat ;
        private var _leading:int = 8;
        //文本行间隔
		public function ChatModel()
		{
			super();
			textFormat = new TextFormat(NotifyConst.DEFAULT_FONT_NAME, NotifyConst.DEFAULT_TEXT_SIZE, 0xffffff, false, false, false, null, null, TextFormatAlign.LEFT, 0, 0, 0, 0);
            textFormat.leading = 3;
            textFormat.letterSpacing = 1;
		}

		public function addChat(key:String, value:String):void
		{
			var arr:Array;
			if(chatHash.containsKey(key))
			{
				arr = chatHash.get(key);
            }	else {
				arr = [];
				chatHash.put(key, arr);
			}
			var xml:XML = getChatXml(value);
			arr.push(xml);
		}

		public function getChatByKey(key:String):Array
		{
			var arr:Array;
            if(chatHash.containsKey(key))
            {
                arr = chatHash.get(key);
            }	else {
                arr = [];
                chatHash.put(key, arr);
            }
			return arr;
		}

		public function getChatXml(msg:String):XML
		{
			var isAdd:Boolean;
            var char:String = '', codeStr:String = '', checkMsg:String = '';
            var i:int, code1:int, code2:int, inster:int = -1, faceid:int = 0;
			var node:XML, nodeXml:XML =<sprites/>, xml:XML =  <rtf/>
			var leng:int = msg.length;
			while(i < leng)
			{
				char = msg.charAt(i);
                if(char == '@')
                {
                    code1 = msg.charCodeAt(i+1);
                    if(code1 > 47 && code1 < 55)
                    {
                        code2 = msg.charCodeAt(i+2);
                        if(code1 == 54 && code2>=52)
                        {
                            isAdd = true;
                        }	else {
                            if(code2 > 47 && code2 < 58)
                            {
                                codeStr = msg.charAt(i+1) + msg.charAt(i+2);
                                node = <sprite src={"face/face_" + codeStr + "_0"} index={inster} faceid={faceid} type={"movieclip"} />;
                                nodeXml.appendChild(node);
                                isAdd = false;
                            }	else
                                isAdd = true;
                        }
                    }	else {
                        isAdd = true;
                    }
                }   else {
	                isAdd = true;
                }
				if(isAdd)
				{
					i++;
					inster ++;
					checkMsg += char;
				}   else {
					faceid ++;
					/*if(isAddCode)
						isAddCode = fasle;
					else*/
						i += 3;
				}
			}
            var color:String = '#ffc80b';
            var msgHead:String =  "<textformat leading='" + _leading +"' letterSpacing='1'><FONT FACE='" + NotifyConst.DEFAULT_FONT_NAME +"' SIZE='" + NotifyConst.DEFAULT_TEXT_SIZE + "' COLOR='" + color + "'>";
            var msgEnd:String   = "</FONT></textformat>";
            xml.htmlText = msgHead + checkMsg + msgEnd;
            xml.sprites = nodeXml;
            return xml;

		}
	}
}
