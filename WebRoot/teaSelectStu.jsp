<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="teaQuery" class="Deal.query" scope="page"/>

<%
String tno = request.getParameter("tno");
String sql="",sql1="";
sql="select 姓名 from Teacher where 工号='"+tno+"'";
ResultSet rs1=null,rs=null;
rs1=teaQuery.executeQuery(sql);
int flag=0;
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title></title>
  </head>
  
<body>
<div class="table-responsive">
<table class="table">
	<thead>
	<tr bgcolor="#BBFFFF">
		<td><center>学号</center></td>
		<td><center>姓名</center></td>
		<td><center>性别</center></td>
		<td><center>出生年月</center></td>
		<td><center>专业</center></td>
		<td><center>班级</center></td>
		<td><center>导师</center></td>
		<td><center>GPA</center></td>
		<td><center>是否修改</center></td>
	</tr>
	</thead>
	<tbody>
	<tr>
	<% 
	while(rs1.next()){
		String tname=rs1.getString("姓名");
		sql1="select * from Stu where 导师='"+tname+"'";
		rs=teaQuery.executeQuery(sql1);
		while(rs.next()){//查询到教师带的学生信息，并打印出来
		flag=1;
		for(int j=1;j<=8;j++){%>
		<td><center><%=rs.getString(j)%></center></td><%} %>
		<%String sno1=rs.getString(1);%>
		<td><center><a href="teaStu_update.jsp?sno=<%=sno1 %>" >修改</a></center></td>
		</tr>
		<%}//内层循环结束
		if(flag==0){//没有查询到教师带的学生信息
			out.println("该教师还没有带学生！");
			out.print("<script>alert('该教师还没有带学生！')</script>");
		}
		break;
	}
	
	%>
</tbody>
</table>

<%teaQuery.close(); %>    
</body>
</html>