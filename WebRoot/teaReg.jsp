<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <title>教师登录/注册</title>
	<!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
<style type="text/css">
#aa {
	width: 100%;
	height: 713px;
	background-image: url(./images/bg.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-size:100%,100%;
	position: relative;
}
#foot {
	width: 100%;
	height: 116px;
	background-color: #00BFFF;
	position: relative;
}
#aa .log {
	height: 450px;
	width: 368px;  
	position: absolute;
	background-color: #FFFFFF;
	top: 10%;
	right: 10%;
	border-radius: 6px;
}
#aa .log .lgA {
	width: 86%;
	border-bottom: 1px solid #00BFFF;
	margin-bottom: 0px;
	margin-top: 0px;
	margin-right: auto;
	margin-left: auto;
}
.log .lgA .p1 {
	display: inline-block;
	font-size: 28px;
	margin-top: 30px;
	width: 86%;
	text-align: center;
}
#aa .log .lgB {
	width: 86%;
	position: relative;
	margin-bottom: 20px;
	margin-top: 20px;
	margin-right: auto;
	margin-left: auto;

}
.log .lgB img {
	position: absolute;
	top: 12px;
	left: 8px;
}
.log .lgB input {
	width: 70%;
	height: 32px;
	border-radius: 6px;
}
#aa .log .lgC {
	width: 87%;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
}
.lgC input {
	width: 100%;
	height: 45px;
	background-color: #00BFFF;
	border: none;
	color: white;
	font-size: 18px;
	border-radius: 6px;
}
#aa .log .lgD {
	width: 87%;
	margin-top: 5px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
}
.lgD input {
	width: 100%;
	height: 45px;
	background-color: #ee7700;
	border: none;
	color: white;
	font-size: 18px;
	border-radius: 6px;
}
.copyright {
	font-family: "宋体";
	color: #FFFFFF;
	position: absolute;
	top: 20%;
	left: 30%;
	height: 60px;
	width: 40%;
	text-align:center;
}
.tj {
	font-family: "宋体";
	color: #FFFFFF;
	position: absolute;
	top: 63%;
	right: 10%;
	height: 60px;
	width: 40%;
	text-align:right;
}
</style>
	
  </head>
  
<body>
<div id="aa">
	<form action="TeaReg_servlet" method="post">
		<div class="log">
			<!-- 头部提示信息 -->
			<div class="lgA">
				<p class="p1">教师注册</p>
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
			<!-- 注册时教师自己不能输入得分和工资
			<div class="lgB">
				得分：<input type="text" name="tmark" placeholder="输入老师得分" />
			</div>
			<div class="lgB">
				工资：<input type="text" name="twage" placeholder="输入教师年龄" />
			</div>
			 -->
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