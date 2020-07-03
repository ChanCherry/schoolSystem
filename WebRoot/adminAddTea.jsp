<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加教师</title>
	<link rel="stylesheet" type="text/css" href="css/stuReg.css">
  </head>
  
<body>
<div id="aa">
	<form action="ATeaReg_servlet" method="post">
		<div class="log">
			<!-- 头部提示信息 -->
			<div class="lgA">
				<p class="p1">添加教师信息</p>
			</div>
			<div class="lgB">
				工号：<input type="text" name="tno" placeholder="输入教师工号" />
			</div>
			<div class="lgB">
				姓名：<input type="text" name="tname" placeholder="输入教师姓名" />
			</div>
			<div class="lgB">
				性别：<input type="text" name="sex" placeholder="输入教师性别" />
			</div>
			<div class="lgB">
				年龄：<input type="text" name="tage" placeholder="输入教师年龄" />
			</div>
			<div class="lgB">
				得分：<input type="text" name="tmark" placeholder="输入教师得分（未知输入0）" />
			</div>
			<div class="lgB">
				工资：<input type="text" name="twage" placeholder="输入教师工资（未知输入0）" />
			</div>
			<div class="lgC">
				<input type="submit" name="login" value="添   加">
			</div>
			<div class="lgD">
				<input type="reset" name="reset" value="重    置">
			</div>
		</div>
	</form>
</div>

<div id="foot">
  	<div class="copyright">
	    Copyright &copy; 2020 ChanCherry All Rights Reserved.<br>
		联系邮箱：3324838931@qq.com<br>
		联系地址：南昌大学<br>
		联系电话：18189027785
   	</div>
   	<div class="tj">
   		<%--实现访问量统计 --%>
		<%
			Integer count = (Integer)application.getAttribute("count");
		  	if(count!=null){
			  	count++;
		  	}else{
			  	count=1;
		  	}
		   	application.setAttribute("count", count);
		%>
	   	٩(๑❛ᴗ❛๑)۶此站点已经被访问<%=count %>次啦！
   	</div>
</div>    
    
</body>
</html>