<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生登录/注册</title>
	<link rel="stylesheet" type="text/css" href="css/stuReg.css"> 
  </head>
  
<body>
<div id="aa">
	<form action="StuReg_servlet" method="post">
		<div class="log">
			<!-- 头部提示信息 -->
			<div class="lgA">
				<p class="p1">学生注册</p>
			</div>
			<div class="lgB">
				学号：<input type="text" name="sno" placeholder="输入学生学号" />
			</div>
			<div class="lgB">
				姓名：<input type="text" name="sname" placeholder="输入学生姓名" />
			</div>
			<div class="lgB">
				性别：<input type="text" name="sex" placeholder="输入学生性别" />
			</div>
			<div class="lgB">
				出生：<input type="text" name="sage" placeholder="输入学生出生年月" />
			</div>
			<div class="lgB">
				专业：<input type="text" name="special" placeholder="输入学生专业" />
			</div>
			<div class="lgB">
				班级：<input type="text" name="sclass" placeholder="输入学生班级，例1801" />
			</div>
			<div class="lgB">
				导师：<input type="text" name="steacher" placeholder="输入学生导师" />
			</div>
			<div class="lgB">
				GPA：<input type="text" name="gpa" placeholder="输入学生GPA（初始为0）" />
			</div>
			<div class="lgC">
				<input type="submit" name="login" value="注   册">
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