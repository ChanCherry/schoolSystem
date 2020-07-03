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
<form action="StuUpdate1_servlet" method="post">
	<table width="240" border="1" cellspacing="3" cellpadding="1">
	<%while(rs.next()){ %>
		<tr bgcolor="#BBFFFF"><td colspan="2"><center>学生信息表</center></td></tr>
		<tr>
		<td><center>学号</center></td>
		<td><%=rs.getString(1) %><input name="sno" type="hidden" value=<%=rs.getString(1) %>></td>
		</tr>
		<tr>
		<td><center>姓名</center></td>
		<td><center><input name="sname" type="text" value=<%=rs.getString(2) %>></center></td>
		</tr>
		<tr>
		<td><center>性别</center></td>
		<td><center><input name="sex" type="text" value=<%=rs.getString(3) %>></center></td>
		</tr>
		<tr>
		<td><center>出生年月</center></td>
		<td><center><input name="sage" type="text" value=<%=rs.getString(4) %>></center></td>
		</tr>
		<tr>
		<td><center>专业</center></td>
		<td><center><input name="special" type="text" value=<%=rs.getString(5) %>></center></td>
		</tr>
		<tr>
		<td><center>班级</center></td>
		<td><center><input name="sclass" type="text" value=<%=rs.getString(6) %>></center></td>
		</tr>
		<tr>
		<td><center>导师</center></td>
		<td><center><input name="steacher" type="text" value=<%=rs.getString(7) %>></center></td>
		</tr>
		<tr>
		<td><center>GPA</center></td>
		<td><input name="gpa" type="text" value=<%=rs.getString(8) %>></td>
		</tr>
		<tr><td><input name="submit" type="submit" value="提交"></td>
		<td><input name="reset" type="reset" value="重置"></td></tr>
	<% }%>
	</table>
</form>
</body>
</html>
 