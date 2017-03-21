<?php
$html = file_get_contents("./NOXClient.html");

$user= $_REQUEST["user"];

if(empty($_REQUEST['s']))
{
	$serverId = 'gaord';
}else{
	$serverId = $_REQUEST['s'];
}
if($serverId=='gaord')
{ 
	//高瑞德
	$server = "172.16.131.42"; $port="9010";
}
else if($serverId=='yangk')
{ 
	//杨凯
	$server = "172.16.131.35"; $port="9010";
}else if($serverId=='songw')
{ 
	//宋伟
	$server = "172.16.131.30"; $port="9010";
}else if($serverId==''){
	//开发服
	$server = "172.16.128.149"; $port="9012";
}

$server = "172.16.128.149"; $port="9012";

if(!empty($_REQUEST['scout']))
{
	$swf = "YZBombDebug";
}else{
	$swf = "Main";
}

$r = time();
echo str_replace("NOXClient.swf","$swf.swf?ver=201601109_989996&server=&ip=$server&port=$port&non_kid=1&localver=100&source=q1.com&sid=q1.com&regdate=1478693586&isfrommicro=0&chargeurl=http%3A%2F%2F$server%2Fwgame%2Faction.php%3Faction%3Dpay&addictedurl=http%3A%2F%2Fwww.163.com&microdownurl=http%3A%2F%2Fwww.pconline.com.cn%2F&openid=1&openkey=1&pf=1&pfkey=1&appid=1105321519&proleurl=http%3A%2F%2F$server%2Fwgame%2Fproleurl.php&platformurl=http://sq.q1.com&vipurl=http://sq.q1.com&resurl=&xmlver=201601109_989996&user=$user&pid=1&r=$r",$html);

?>