<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="teaQuery" class="Deal.query" scope="page"/>

<%
String tno=request.getParameter("tno");
String sql="select * from user1 where 账号='"+tno+"'";
ResultSet rs=teaQuery.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="css/center.css">
</head>
<body>
<div id="aa">
	<form action="UserUpdate1_servlet" method="post">
	<div class="log">
		<!-- 头部提示信息 -->
		<div class="lgA">
			<p class="p1">教师用户信息</p>
		</div>
		<%while(rs.next()){ %>
		<div class="lgB">
			工号：<%=rs.getString(1) %><input name="tno" type="hidden" value=<%=rs.getString(1) %>>
		</div>
		<div class="lgB">
			电话：<input name="ttele" type="text" value=<%=rs.getString(2) %>>
		</div>
		<div class="lgB">
			密码：<input name="tpwd" type="text" value=<%=rs.getString(3) %>>
		</div>
		<%} %>
		<div class="lgC">
			<input type="submit" name="submit" value="提    交">
		</div>
		<div class="lgD">
			<input type="reset" name="reset" value="重    置">
		</div>
		<input type="text" value=<%=tno %> name="tno" hidden/>
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