<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String tno=request.getParameter("tno");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>模糊查询学生信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  </head>
  
<body>
<div>
<h2>模糊查询学生信息</h2>
1.请输入要查询的学生的姓：<br><br>
<form name="form1" action="moStuSelect1_servlet" method="post">
	<input type="text" name="xing" style="height:30px" />&nbsp;&nbsp;&nbsp;
	<input type="submit" value="查询" style="width:100px;height:30px" name="select1"/>
	<input type="text" value=<%=tno %> name="tno" hidden/><!-- 便于返回传参 -->
</form>
<br><br>

2.请输入要查询的学生姓名最后一个字（名字两个字的）：<br><br>
<form name="form2" action="moStuSelect2_servlet" method="post">
<input type="text" name="last2" style="height:30px" />&nbsp;&nbsp;&nbsp;
<input type="submit" value="查询" style="width:100px;height:30px" name="select2"/>
<input type="text" value=<%=tno %> name="tno" hidden/><!-- 便于返回传参 -->
</form>
<br><br>
3.请输入要查询的学生姓名最后一个字（名字三个字的）：<br><br>
<form name="form3" action="moStuSelect3_servlet" method="post">
<input type="text" name="last3" style="height:30px" />&nbsp;&nbsp;&nbsp;
<input type="submit" value="查询" style="width:100px;height:30px" name="select3"/>
<input type="text" value=<%=tno %> name="tno" hidden/><!-- 便于返回传参 -->
</form>
<br><br>
<button name="back" style="width:100px;height:30px" onclick="window.location.href='teaInfo.jsp?tno=<%=tno%>'">返回</button>
</div>	
	
</body>
</html>