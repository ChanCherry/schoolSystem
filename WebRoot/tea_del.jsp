<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>删除教师</title>
  </head>
  
<body>
<form action="TeaDel_servlet" method="post">
	请输入要删除的教师工号：<br><br>
	<input type="text" name="tno" /><br>
	<br><input type="submit" name="submit" style="width: 70px;" value="删除"/>	
</form>	
</body>
</html>