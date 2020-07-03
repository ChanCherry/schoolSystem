package Stu;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.update;


public class StuUpdate_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String num=req.getParameter("sno");//获取请求的参数
		String name=req.getParameter("sname");
		String sex=req.getParameter("sex");
		String age=req.getParameter("sage");
		String special=req.getParameter("special");
		String sclass=req.getParameter("sclass");
		String teacher=req.getParameter("steacher");
		String gpa=req.getParameter("gpa");
		update StuUpdate=new update();
		
		String update="update Stu set 姓名=N'"+name+"',性别=N'"+sex+"',出生年月='"+age+"',专业=N'"+special+"',班级='"+sclass+"',导师=N'"+teacher+"',GPA='"+gpa+"' where 学号='"+num+"'";
		int flag=StuUpdate.executeUpdate(update);
		if(flag>0){
			out.println("<script>alert('修改成功！即将返回学生中心页面！')</script>");
			out.println("<script>window.location.href='stuInfo.jsp?sno="+num+"'</script>");
		}
		else{
			out.println("<script>alert('修改失败！请重新修改！')</script>");
			out.println("<script>window.location.href='stu_update.jsp?sno="+num+"'</script>");
		}
		StuUpdate.close();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
