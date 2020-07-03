<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String tno = request.getParameter("tno");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>GPA降序排序</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<body>
	请输入要进行GPA降序排序的专业：<br><br>
	<form action="odescGPA.jsp">
	<input type="text" name="special" /><input type="text" value=<%=tno %> name="tno" hidden/>&nbsp;&nbsp;&nbsp;&nbsp;
	<button style="width:110px;height:26px" onclick="window.location.href='odescGPA.jsp'">GPA降序排序</button>
	</form>
</body>
</html>
