<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="stuDeal" class="Deal.query" scope="page"/>

<%
String tno = request.getParameter("tno");
String special=request.getParameter("special");

String sql="select 学号,姓名,性别,专业,班级,导师,GPA from Stu where 专业=N'"+special+"' order by GPA";
String query="select * from Stu where 专业=N'"+special+"'";
ResultSet rs1=stuDeal.executeQuery(query);
int tmp=1;
while(rs1.next()){
	tmp=0;break;
}
if(tmp==0){
ResultSet rs=stuDeal.executeQuery(sql);
int flag=1;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>GPA升序排序</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  
<body>
<h2><%=special%>专业学生GPA升序排序</h2><br>
<table width="600" border="1">
<tr bgcolor="#BBFFFF"><td><center>学号</center></td>
<td><center>姓名</center></td><td><center>性别</center></td><td><center>专业</center></td>
<center><td><center>班级</center></td><td><center>导师</center></td><td><center>GPA</center></td></tr>
<%while(rs.next()){ flag=0;%>
<tr>
	<% for(int j=1;j<=7;j++){%>
	<td><center><%=rs.getString(j)%></center></td>
	<%} %>

</tr>
<%}%>
</table>
<%
if(flag==1){
	out.print("<script>alert('排序失败！学校暂时不存在"+special+"专业！')<script>");
}
%>
<br><br><button name="back" style="width:100px;height:30px" onclick="window.location.href='teaInfo.jsp?tno=<%=tno%>'">返回</button>
<%
}
else{
	out.print("<script>alert('排序失败！学校暂时不存在"+special+"专业！')</script>");
	out.println("<script>window.location.href='teaInfo.jsp?tno="+tno+"'</script>");
}
%>

</body>
<%stuDeal.close();%>
</html>