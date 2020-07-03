<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String tno = request.getParameter("tno");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>安全检查</title>
  </head>
  
<body>
<h3>系统使用有一段时间了，来自我安全检查一下吧(*^▽^*)</h3><br>
<form action="teaCheck_servlet" method="post">
	<input type="text" value=<%=tno %> name="tno" hidden/><br>
    <input type="submit" style="width:150px;height:30px;" name="submit" value="点击开始安全检查" />
</form>
</body>
</html>
