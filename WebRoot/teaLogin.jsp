<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>教师登录/注册</title>
	<link rel="stylesheet" type="text/css" href="css/tealog.css">
  </head>
  
<body>
<div id="aa">
	<form action="TeaLogin_servlet" method="post">
		<div class="log">
			<!-- 头部提示信息 -->
			<div class="lgA">
				<p class="p1">教师登录/注册</p>
			</div>
			
			<div class="lgB">
				工号：<input type="text" name="tno" placeholder="输入教师工号" />
			</div>
			<div class="lgB">
				姓名：<input type="text" name="tname" placeholder="输入教师姓名" />
			</div>
			<div class="lgB">
				密码：<input type="password" name="tpwd" placeholder="输入登录密码" />
			</div>
			<div class="lgC">
				<input type="submit" name="login" value="登    录">
			</div>
			<div class="lgD">
				<input type="submit" formaction="teaReg.jsp" name="register" value="注    册">
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