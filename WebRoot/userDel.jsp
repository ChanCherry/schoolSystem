<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="stuDel" class="Deal.update" scope="page"/>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>删除用户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<body>
<form action="UserDel_servlet" method="post">
	请输入要删除的用户账号：<br><br>
	<input type="text" name="num" /><br>
	<br><input type="submit" name="submit" style="width: 70px;" value="删除"/>
	
</form>
	
</body>
</html>
