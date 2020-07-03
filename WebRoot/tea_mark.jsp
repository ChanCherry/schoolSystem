<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="stuQuery" class="Deal.query" scope="page"/>

<%
String tno=request.getParameter("tno");
String sql="select * from Teacher where 工号='"+tno+"'";
ResultSet rs=stuQuery.executeQuery(sql);
int flag=1;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
  </head>
  
<body>
<h2><center>评教得分</center></h2><br>
<div class="table-responsive">
<table class="table"><!--  width="600" border="1"  bgcolor="#BBFFFF"-->
<thead><tr bgcolor="#BBFFFF"><th><center>工号</center></th>
<th><center>姓名</center></th>
<th><center>性别</center></th>
<th><center>年龄</center></th>
<th><center>得分</center></th></tr></thead>
<%while(rs.next()){ %>
<tbody><tr bgcolor="#F0FFFF">
	<% for(int j=1;j<=5;j++){%>
	<td><center><%=rs.getString(j)%></center></td>
	<%} 
	if(!rs.getString(5).equals("0")){
		flag=0;
	}
	%>

</tr>
<%}%>
</tbody>
</table><br><br>
<%
if(flag==1){
	out.print("<h4>暂时学生评教还没有开始，耐心等待下哦(*╹▽╹*)</h4>");
}
%>
</div>
</body>
<%stuQuery.close(); %>
</html>