<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>

<jsp:useBean id="stuDeal" class="Deal.query" scope="page"/>

<% String tno=request.getParameter("tno");%>

<%
	//变量声明 
	ResultSet rs; //结果集对象 
	String strCon; //数据库连接字符串 
	int pageSize=5; //一页显示的记录数 
	int rowCount; //记录总数 
	int pageCount; //总页数 
	int intPage; //待显示页码 
	String strPage;
	int i;
	
	//获取待显示页码 
	strPage = request.getParameter("page");
	if (strPage == null || strPage.equals("")) {//表明在QueryString中没有page这一个参数，此时显示第一页数据 
		intPage = 1;
	} else {//将字符串转换成整型 
		intPage = Integer.parseInt(strPage);
		if (intPage < 1)
			intPage = 1;
	}

	//执行SQL语句并获取结果集 
	rs = stuDeal.executeQuery("select * from Stu");
	//获取记录总数 
	rs.last();//光标在最后一行 
	rowCount = rs.getRow();//获得当前行号 
	//计算总页数 
	pageCount = (rowCount + pageSize - 1) / pageSize;
	//调整待显示的页码 
	if (intPage > pageCount)
		intPage = pageCount;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>分页</title>
	</head>
	<body>
		<h2>查看所有学生信息</h2><br>
		<table width="700" border="1" cellspacing="0" cellpadding="1">
			<tr bgcolor="#BBFFFF">
				<td><center>学号</center></td>
				<td><center>姓名</center></td>
				<td><center>性别</center></td>
				<td><center>出生年月</center></td>
				<td><center>专业</center></td>
				<td><center>班级</center></td>
				<td><center>导师</center></td>
				<td><center>GPA</center></td>
			</tr>
			
			<%
				if (pageCount > 0) {
					//每次将记录指针定位到待显示页的第一条记录上 
					rs.absolute((intPage - 1) * pageSize + 1);
					//显示数据 
					i = 0;
					while (i < pageSize && !rs.isAfterLast()) {
			%>
			
			<tr>
				<% for(int j=1;j<=8;j++){%>
				<td><center><%=rs.getString(j)%></center></td>
				<%} %>
			<%String sno=rs.getString(1);
			String tpage=intPage+"";
			%>
			</tr>
			<%
				rs.next();
				i++;
					}
				}
			%>
		</table>

		<br>
		<form method="post" action="teaSelect.jsp" name="form1">
			当前第<%=intPage%>页 ，共<%=pageCount%>页&nbsp;&nbsp;&nbsp;&nbsp;

			<a href="teaSelect.jsp?page=1&tno=<%=tno%>">第一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
			
			<%
			if (intPage < pageCount) {
			%>
			<a href="teaSelect.jsp?page=<%=intPage + 1%>&tno=<%=tno%>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<%
				}
			%>
			<%
				if (intPage > 1) {
			%>
			<a href="teaSelect.jsp?page=<%=intPage - 1%>&tno=<%=tno%>">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<%
				}
			%>
			<%
				if (intPage != pageCount) {
			%>
			<a href="teaSelect.jsp?page=<%=pageCount%>&tno=<%=tno%>">最后一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<%
				}
			%>

			跳转到第
			<input type="text" name="page" size="2">&nbsp;页&nbsp;&nbsp;
			<input type="submit" value="GO" name="submit" style="width: 60px;">
			<input type="text" value=<%=tno %> name="tno" hidden/><!-- 便于返回传参 -->
		</form>
		<br><br><button name="back" style="width:100px;height:30px" onclick="window.location.href='teaInfo.jsp?tno=<%=tno%>'">返回</button>
	</body>
</html>
<%
	stuDeal.close();
%>