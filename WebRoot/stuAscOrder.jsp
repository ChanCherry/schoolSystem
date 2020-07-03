<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String tno = request.getParameter("tno");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生GPA升序排序</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  
<body>
	请输入要进行GPA升序排序的专业：<br><br>
	<form action="oascGPA.jsp?tno=<%=tno %>">
	<input type="text" name="special" /><input type="text" value=<%=tno %> name="tno" hidden/>&nbsp;&nbsp;&nbsp;&nbsp;
	<button style="width:110px;height:26px" onclick="window.location.href='oascGPA.jsp?tno=<%=tno %>'">GPA升序排序</button>
	</form>
</body>
</html>