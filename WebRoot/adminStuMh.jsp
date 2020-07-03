<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


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
<form name="form1" action="AmoStuSelect1_servlet" method="post">
	<input type="text" name="xing" style="height:30px" />&nbsp;&nbsp;&nbsp;
	<input type="submit" value="查询" style="width:100px;height:30px" name="select1"/>
</form>
<br><br>

2.请输入要查询的学生姓名最后一个字（名字两个字的）：<br><br>
<form name="form2" action="AmoStuSelect2_servlet" method="post">
<input type="text" name="last2" style="height:30px" />&nbsp;&nbsp;&nbsp;
<input type="submit" value="查询" style="width:100px;height:30px" name="select2"/>
</form>
<br><br>
3.请输入要查询的学生姓名最后一个字（名字三个字的）：<br><br>
<form name="form3" action="AmoStuSelect3_servlet" method="post">
<input type="text" name="last3" style="height:30px" />&nbsp;&nbsp;&nbsp;
<input type="submit" value="查询" style="width:100px;height:30px" name="select3"/>
</form>
<br><br>
4.请输入要查询的学生学号和姓名：<br><br>
<form name="form4" action="AmoStuSelect4_servlet" method="post">
学号：&nbsp;
<input type="text" name="sno" style="height:30px" />&nbsp;&nbsp;&nbsp;
姓名：&nbsp;<input type="text" name="sname" style="height:30px" />&nbsp;&nbsp;&nbsp;
<input type="submit" value="查询" style="width:100px;height:30px" name="select4"/>
</form>
<br><br>
<button name="back" style="width:100px;height:30px" onclick="window.location.href='adminInfo.jsp'">返回</button>
</div>	
	
</body>
</html>