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
<form action="ATeaUpdate_servlet" method="post">
	<table width="280" border="1" cellspacing="3">
	<%while(rs.next()){ %>
		<thead><tr bgcolor="#BBFFFF"><th colspan="2"><center>教师信息表</center></th></tr></thead>
		<tbody<tr>
		<td><center>工号</center></td>
		<td><center><input name="tno" type="text" value=<%=rs.getString(1) %>></center></td>
		</tr>
		<tr>
		<td><center>姓名</center></td>
		<td><center><input name="tname" type="text" value=<%=rs.getString(2) %>></center></td>
		</tr>
		<tr>
		<td><center>性别</center></td>
		<td><center><input name="sex" type="text" value=<%=rs.getString(3) %>></center></td>
		</tr>
		<tr>
		<td><center>年龄</center></td>
		<td><center><input name="tage" type="text" value=<%=rs.getString(4) %>></center></td>
		</tr>
		<tr>
		<td><center>得分</center></td>
		<td><center><input name="tmark" type="text" value=<%=rs.getString(5) %> ></center></td>
		</tr>
		<tr>
		<td><center>工资</center></td>
		<td><center><input name="twage" type="text" value=<%=rs.getString(6) %> ></center></td>
		</tr>
		<tr><td colspan="2"><center><input type="submit" name="submit" style="width:80px" value="提交">
		<input type="reset" name="reset" style="width:80px" value="重置"></center></td></tr>
	<% }%>
	</tbody></table>
	
</form>
</body>
<%teaQuery.close(); %>
</html>