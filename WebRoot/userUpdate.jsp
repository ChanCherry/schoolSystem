<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="userQuery" class="Deal.query" scope="page"/>

<%
String num=request.getParameter("num");
String sql="select * from user1 where 账号='"+num+"'";
ResultSet rs=userQuery.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<form action="AUserUpdate_servlet" method="post">
	<table width="280" border="1" cellspacing="3">
	<%while(rs.next()){ %>
		<thead><tr bgcolor="#BBFFFF"><th colspan="2"><center>用户信息表</center></th></tr></thead>
		<tbody<tr>
		<td><center>工号</center></td>
		<td><center><input name="num" type="text" value=<%=rs.getString(1) %>></center></td>
		</tr>
		<tr>
		<td><center>电话</center></td>
		<td><center><input name="tele" type="text" value=<%=rs.getString(2) %>></center></td>
		</tr>
		<tr>
		<td><center>密码</center></td>
		<td><center><input name="pwd" type="text" value=<%=rs.getString(3) %>></center></td>
		</tr>
		<tr><td colspan="2"><center><input type="submit" name="submit" style="width:80px" value="提交">
		<input type="reset" name="reset" style="width:80px" value="重置"></center></td></tr>
	<% }%>
	</tbody></table>
	
</form>
</body>
<%userQuery.close(); %>
</html>