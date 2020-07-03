<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>模糊查询教师信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  </head>
  
<body>
<div>
<h2>模糊查询教师信息</h2>
1.请输入要查询的教师的姓：<br><br>
<form name="form1" action="AmoTeaSelect1_servlet" method="post">
	<input type="text" name="xing" style="height:30px" />&nbsp;&nbsp;&nbsp;
	<input type="submit" value="查询" name="select1" style="width:100px;height:30px"/>
</form>
<br><br>

2.请输入要查询的教师姓名最后一个字（名字两个字的）：<br><br>
<form name="form2" action="AmoTeaSelect2_servlet" method="post">
<input type="text" name="last2" style="height:30px" />&nbsp;&nbsp;&nbsp;
<input type="submit" value="查询" name="select2" style="width:100px;height:30px"/>
</form>
<br><br>
3.请输入要查询的教师姓名最后一个字（名字三个字的）：<br><br>
<form name="form3" action="AmoTeaSelect3_servlet" method="post">
<input type="text" name="last3" style="height:30px" />&nbsp;&nbsp;&nbsp;
<input type="submit" value="查询" name="select3" style="width:100px;height:30px"/>
</form>
<br><br>
4.请输入要查询的教师工号和姓名：<br><br>
<form name="form4" action="AmoTeaSelect4_servlet" method="post">
学号：&nbsp;
<input type="text" name="tno" style="height:30px" />&nbsp;&nbsp;&nbsp;
姓名：&nbsp;<input type="text" name="tname" style="height:30px" />&nbsp;&nbsp;&nbsp;
<input type="submit" value="查询" style="width:100px;height:30px" name="select4"/>
</form>
<br><br>
<button name="back" style="width:100px;height:30px" onclick="window.location.href='adminInfo.jsp'">返回</button>
</div>	
	
</body>
</html>