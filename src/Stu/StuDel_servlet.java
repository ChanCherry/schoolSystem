package Stu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.query;
import Deal.update;

public class StuDel_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String sno=req.getParameter("sno");
		String sql="delete from Stu where 学号='"+sno+"'";
		update update=new update();
		
		int n=update.executeUpdate(sql);//删除操作
		if(n>0){
			out.print("<script>alert('删除学生成功！即将返回首页！');</script>");
			out.println("<script>window.location.href='adminInfo.jsp'</script>");
		}
		else {
			out.print("<script>alert('删除学生失败！即将返回首页！')</script>");
			out.println("<script>window.location.href='adminInfo.jsp'</script>");
		}
	
		update.close();
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
}
