<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>

<jsp:useBean id="stuDeal" class="Deal.query" scope="page"/>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String sno=request.getParameter("sno");
	int tpage=Integer.parseInt(request.getParameter("page"));

	ResultSet rs=null;
	rs = stuDeal.executeQuery("select * from Stu where 学号='"+sno+"'");
	
	
%>

<html>
  <head>
    <title>修改学生</title>
  </head>
  
<body>
  <form name="form1" action="AStuUpdate_servlet" method="post">
	<table width="280" border="1" cellspacing="3"><!--  -->
	<%while(rs.next()){ %>
		<thead><tr bgcolor="#BBFFFF"><th colspan="2"><center>学生信息表</center></th></tr></thead>
		<tbody><tr>
		<td><center>学号</center></td>
		<td><center><input name="sno" type="text" value=<%=rs.getString(1) %> ></center></td>
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
		<td><center><input name="gpa" type="text" value=<%=rs.getString(8) %>></center></td>
		</tr>
		<tr>
		<td colspan="2"><center><input type="submit" name="submit" style="width:80px" value="提交">
		<input type="reset" name="reset" style="width:80px" value="重置"></center></td>
		</tr>
	<% }%>
	</tbody></table><br>
	
	<script language="JavaScript">
	for(var i=1; i<= 20; i++)
	{
		document.write("&nbsp;");
	}
	</script>
	<input type="submit" style="width:80px" formaction="adminUpdStu.jsp?page=<%=tpage %>" value="返回">
	
  </form>
  </body>
</html>
