<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理员登录/注册</title>
	<link rel="stylesheet" type="text/css" href="css/ulogin.css">

  </head>
  
<body>
<div id="aa">
	<form action="UserLogin_servlet" method="post">
		<div class="log">
			<!-- 头部提示信息 -->
			<div class="lgA">
				<p class="p1">管理员登录</p>
			</div>
			<div class="lgB">
				<img src="./images/name.png" width="20" height="20"/>
				<input type="text" name="num" placeholder="输入管理员账号" />
			</div>
			<div class="lgB">
				<img src="./images/pwd.png" width="20" height="20"/>
				<input type="password" name="password" placeholder="输入管理员密码" />
			</div>
			<div class="lgC">
				<input type="submit" name="login" value="登    录" onClick="adminCheck()">
			</div>
			<div class="lgD">
				<input type="submit" formaction="" name="register" value="退   出">
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
