<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="stuQuery" class="Deal.query" scope="page"/>

<%
String sno=request.getParameter("sno");
String sql="select * from user1 where 账号='"+sno+"'";
ResultSet rs=stuQuery.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/center.css">
</head>
<body>
<div id="aa">

	<form action="UserUpdate_servlet" method="post">
	<div class="log">
		<!-- 头部提示信息 -->
		<div class="lgA">
			<p class="p1">学生用户信息</p>
		</div>
		<%while(rs.next()){ %>
		<div class="lgB">
			学号：<%=rs.getString(1) %><input name="sno" type="hidden" value=<%=rs.getString(1) %>>
		</div>
		<div class="lgB">
			电话：<input name="stele" type="text" value=<%=rs.getString(2) %>>
		</div>
		<div class="lgB">
			密码：<input name="spwd" type="text" value=<%=rs.getString(3) %>>
		</div>
		<%} %>
		<div class="lgC">
			<input type="submit" name="submit" value="提    交">
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