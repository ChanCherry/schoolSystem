<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    
<script type="text/javascript">
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
//检测用户名是否已经被注册
function checkSno()
{
	//window.alert("进入到checkSno()函数");
	var sno = document.getElementById("sno").value;//获取输入框参数
	if(sno=="")
	{
	    alert("学号输入为空！");
	    return false;
	}
	//首先创建对象
	createXmlHttpRequest();
	//指明准备状态改变时回调的函数名
	xmlHttpReq.onreadystatechange=handle;
	//尝试以异步的get方式访问某个URL,get请求参数
	//请求服务器端的一个servlet
	//url后面加上时间搓或者随机数禁止浏览器缓存
	var url = "./snoSelect_servlet?sno="+sno+"&nowtime="+new Date().getTime();//+Math.random();
	//window.alert(sno);
	//anyAjaxObj.setRequestHeader("Cache-Control","no-cache");//禁止浏览器缓存
	xmlHttpReq.open("get",url,true);
	//向服务器发送请求
	xmlHttpReq.send();
	//window.alert("已经发送数据");
}
//状态发生改变时回调的函数
function handle()
{
	//准备状态值为4
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

<!--
<script>
function checkSno(){
	$.ajax({
		url:"snoSelect_servlet",//请求路径
		type:"GET",//请求方式
		async:false,//同步
		cache:false,
		//data:"username=jack&age=23",  //请求参数
		data:{sno:document.getElementById("sno").value},//json格式
		processData: false,   // jQuery不要去处理发送的数据
		  contentType: false,   // jQuery不要去设置Content-Type请求头
		success:function(data){
			alert(data);
			var result = document.getElementById("result");
	        result.innerHTML = "<font color=red>"+data+"</font>";//将res写入到result中
		},
		error:function (){
			alert("出错啦……")
		}//表示请求响应如果出错，会执行的回调函数
	});
}
</script>
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>学号查询学生</title>
  </head>
<body>
<h2>学号查询学生</h2>
	请输入要查询的学生学号：<br><br>
	<input type="text" name="sno" id="sno" style="height:30px;"/>&nbsp;&nbsp;
	<input type="button" value="查询" style="width:100px;height:30px;background-color: #BBFFFF;" onclick="checkSno()">&nbsp;&nbsp;
	&nbsp;&nbsp;<input type="button" style="width:100px;height:30px;" value="返回" onclick="window.location.href='adminInfo.jsp'">
	<br><br><hr>
	<span id="result"></span>
</body>
</html>