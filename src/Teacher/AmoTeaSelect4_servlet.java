package Teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.query;

public class AmoTeaSelect4_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String tno=req.getParameter("tno");//获取请求的参数
		String tname=req.getParameter("tname");
		query query=new query();
		
		String queryString="select * from Teacher where 工号='"+tno+"' and 姓名=N'"+tname+"'";
		ResultSet rs=query.executeQuery(queryString);
		int flag=0;
		out.println("<h2>查询工号为"+tno+"，姓名为“"+tname+"”的教师信息如下表：</h2>");
		out.print("<table width='600' border='1' cellspacing='0' border-collapse='collapse'><tr bgcolor='#BBFFFF'><td><center>工号</center></td><td><center>姓名</center></td>" +
				"<td><center>性别</center></td><td><center>年龄</center></td><td><center>得分</center></td>" +
				"<center><td><center>工资</center></td></tr>");
		try {
			while(rs.next()){
				flag=1;
				out.println("<tr><td><center>"+rs.getString(1)+"</center></td>");
				out.println("<td><center>"+rs.getString(2)+"</center></td>");
				out.println("<td><center>"+rs.getString(3)+"</center></td>");
				out.println("<td><center>"+rs.getString(4)+"</center></td>");
				out.println("<td><center>"+rs.getString(5)+"</center></td>");
				out.println("<td><center>"+rs.getString(6)+"</center></td>");
			}
			out.println("</table>");
			if(flag==1){
				out.print("<script>alert('查询成功！')</script>");
				out.println("<br><br><a href='adminTeaMh.jsp'>返回模糊查询</a>");
				out.println("&nbsp;&nbsp;&nbsp;<a href='adminInfo.jsp'>返回管理员中心</a>");
			}
			else{
				out.println("<script>alert('查询失败！列表里不存在工号为"+tno+"，姓名为“"+tname+"”的教师！')</script>");
				out.println("<script>window.location.href='adminTeaMh.jsp'</script>");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		query.close();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
