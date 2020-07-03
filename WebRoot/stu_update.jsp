<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="stuQuery" class="Deal.query" scope="page"/>

<%
String sno=request.getParameter("sno");
String sql="select * from Stu where 学号='"+sno+"'";
ResultSet rs=stuQuery.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<form action="StuUpdate_servlet" method="post">
<div class="table-responsive">
	<table class="table" style="bgcolor:#F0FFFF;">
	<%while(rs.next()){ %>
		<thead><tr bgcolor="#BBFFFF"><th colspan="2"><center>学生信息表</center></th></tr></thead>
		<tr bgcolor="#F0FFFF">
		<td><center>学号</center></td>
		<td><center><%=rs.getString(1) %><input name="sno" type="hidden" value=<%=rs.getString(1) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>姓名</center></td>
		<td><center><input name="sname" type="text" value=<%=rs.getString(2) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>性别</center></td>
		<td><center><input name="sex" type="text" value=<%=rs.getString(3) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>出生年月</center></td>
		<td><center><input name="sage" type="text" value=<%=rs.getString(4) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>专业</center></td>
		<td><center><input name="special" type="text" value=<%=rs.getString(5) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>班级</center></td>
		<td><center><input name="sclass" type="text" value=<%=rs.getString(6) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>导师</center></td>
		<td><center><input name="steacher" type="text" value=<%=rs.getString(7) %>></center></td>
		</tr>
		<tr bgcolor="#F0FFFF">
		<td><center>GPA</center></td><!-- GPA学生自己不能改 -->
		<td><center><%=rs.getString(8) %><input name="gpa" type="text" value=<%=rs.getString(8) %> hidden></center></td>
		</tr>
		<tr bgcolor="#F0FFFF"><td><center><input name="submit" type="submit" style="width:100px;height:30px;" value="提交"></center></td>
		<td><center><input name="reset" type="reset" style="width:100px;height:30px;" value="重置"></center></td></tr>
	<% }%>
	</table>
</div>
</form>
</body>
</html>