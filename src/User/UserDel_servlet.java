package User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.update;

public class UserDel_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String num=req.getParameter("num");
		String sql="delete from user1 where 账号='"+num+"'";
		String sql1="delete from Stu where 学号='"+num+"'";
		String sql2="delete from Teacher where 工号='"+num+"'";
		update update=new update();
		update update1=new update();
		update update2=new update();
		
		int n=update.executeUpdate(sql);//删除操作
		if(n>0){
			//out.print("<script>alert('删除用户信息成功！即将返回管理员首页！');</script>");
			int n1=update1.executeUpdate(sql1);
			if(n1>0){
				out.print("<script>alert('成功删除用户同时删除该用户的学生信息！即将返回管理员首页！');</script>");
				out.println("<script>window.location.href='adminInfo.jsp'</script>");
			}
			int n2=update2.executeUpdate(sql2);
			if(n2>0){
				out.print("<script>alert('成功删除用户同时删除该用户的教师信息！即将返回管理员首页！');</script>");
				out.println("<script>window.location.href='adminInfo.jsp'</script>");
			}
			out.print("<script>alert('删除用户信息成功！即将返回管理员首页！');</script>");
			out.println("<script>window.location.href='adminInfo.jsp'</script>");
		}
		else {
			out.print("<script>alert('删除用户信息失败！即将返回管理员首页！')</script>");
			out.println("<script>window.location.href='adminInfo.jsp'</script>");
		}
	
		update.close();
		//update1.close();
		//update2.close();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
}
