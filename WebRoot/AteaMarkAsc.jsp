<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="teaDeal" class="Deal.query" scope="page"/>

<%
String sql="select * from Teacher order by 得分";

ResultSet rs=teaDeal.executeQuery(sql);
int flag=1;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教师得分升序排序</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<body>
<h2>教师得分升序排序</h2><br>
<div class="table-responsive">
<table  class="table">
<thead><tr bgcolor="#BBFFFF"><th><center>工号</center></th>
<th><center>姓名</center></th><th><center>性别</center></th><th><center>年龄</center></th>
<center><th><center>得分</center></th><th><center>工资</center></th></tr></thead>
<%while(rs.next()){ flag=0;%>
<tbody><tr>
	<% for(int j=1;j<=6;j++){%>
	<td><center><%=rs.getString(j)%></center></td>
	<%} %>
</tr>
<%}%>
</tbody></table>
<%
if(flag==1){
	out.print("<script>alert('排序失败！')<script>");
}
%>
<br><br><button name="back" style="width:60px;height:24px" onclick="window.location.href='adminInfo.jsp'">返回</button>
</div>
</body>
<%teaDeal.close();%>

</html>