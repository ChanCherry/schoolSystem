<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="teaQuery" class="Deal.query" scope="page"/>

<%
String tno=request.getParameter("tno");
String sql="select * from Teacher where 工号='"+tno+"'";
ResultSet rs=teaQuery.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<form action="TeaUpdate_servlet" method="post">
<div class="table-responsive">
	<table class="table"><!--  width="240" border="1" cellspacing="3" cellpadding="1" -->
	<%while(rs.next()){ %>
		<thead><tr bgcolor="#BBFFFF"><th colspan="2"><center><h4>教师信息表</h4></center></th></tr></thead>
		<tbody><tr bgcolor="#F0FFFF">
		<td><center>工号</center></td>
		<td><center><%=rs.getString(1) %><input name="tno" type="hidden" value=<%=rs.getString(1) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>姓名</center></td>
		<td><center><input name="tname" type="text" value=<%=rs.getString(2) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>性别</center></td>
		<td><center><input name="sex" type="text" value=<%=rs.getString(3) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>年龄</center></td>
		<td><center><input name="tage" type="text" value=<%=rs.getString(4) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>得分</center></td>
		<td><center><%=rs.getString(5) %><input name="tmark" type="text" value=<%=rs.getString(5) %> hidden></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>工资</center></td>
		<td><center><%=rs.getString(6) %><input name="twage" type="text" value=<%=rs.getString(6) %> hidden></center></td>
		</tr>
		<tr bgcolor="#F0FFFF"><td><center><input name="submit" type="submit" value="提交" style="width:100px;height:32px;"></center></td>
		<td><center><input name="reset" type="reset" value="重置" style="width:100px;height:32px;"></center></td></tr>
	<% }%>
	</tbody></table>
	
</form>
</body>
<%teaQuery.close(); %>
</html>