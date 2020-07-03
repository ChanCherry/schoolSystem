<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script>
var xmlHttpReq;
//创建一个XmlHttpRequest对象
function createXmlHttpRequest()
{
    //window.alert("进入到createXmlHttpRequest()函数");
    if(window.XMLHttpRequest)
    {
       xmlHttpReq = new XMLHttpRequest();//非IE浏览器
    }else
    {
       xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");//IE浏览器
    }
}

function checkNum()
{
	var num = document.getElementById("num").value;//获取输入框参数
	if(num=="")
	{
	    alert("账号输入为空！");
	    return false;
	}
	//首先创建对象
	createXmlHttpRequest();
	//指明准备状态改变时回调的函数名
	xmlHttpReq.onreadystatechange=handle;
	//尝试以异步的get方式访问某个URL,get请求参数
	//请求服务器端的一个servlet
	var url = "./userSelect_servlet?num="+num+"&fresh="+Math.random();
	xmlHttpReq.open("get",url,true);
	//向服务器发送请求
	xmlHttpReq.send();
	//window.alert("已经发送数据");
}
//状态发生改变时回调的函数
function handle()
{
	//准备状态为4
	//window.alert("进入到handle()函数");
    if(xmlHttpReq.readyState==4)
    {
    //window.alert("响应已完成，您可以获取并使用服务器的响应了。");
    //响应状态码为200，代表一切正常
       if(xmlHttpReq.status==200)
       {
           window.alert("响应完成！ ");
           var res = xmlHttpReq.responseText;//获得返回值
           var result = document.getElementById("result");
           result.innerHTML = "<font color=red>"+res+"</font>";//将res写入到result中
       }
    }
}
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>工号查询教师</title>
</head>
  
<body>
<h2>账号查询用户</h2>
	请输入要查询的用户账号：<br><br>
	<input type="text" name="num" id="num" style="height:30px;"/>&nbsp;&nbsp;
	<input type="button" value="查询" style="width:100px;height:30px;background-color: #BBFFFF;" onclick="checkNum()">&nbsp;&nbsp;
	&nbsp;&nbsp;<input type="button" style="width:100px;height:30px;" value="返回" onclick="window.location.href='adminInfo.jsp'">
	<br><br><hr>
	<span id="result"></span>


</body>

</html>