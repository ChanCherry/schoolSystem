package User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.update;

public class AUserUpdate_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String num=req.getParameter("num");//获取请求的参数
		String tele=req.getParameter("tele");
		String pwd=req.getParameter("pwd");
		
		update userUpdate=new update();
		
		String update="update user1 set 电话='"+tele+"',密码='"+pwd+"' where 账号='"+num+"'";
		int flag=userUpdate.executeUpdate(update);
		if(flag>0){
			out.println("<script>alert('修改成功！即将返回管理员中心首页！')</script>");
			out.println("<script>window.location.href='adminInfo.jsp'</script>");
		}
		else{
			out.println("<script>alert('修改失败！请重新修改！')</script>");
			out.println("<script>window.location.href='userUpdate.jsp?num="+num+"'</script>");

		}
		userUpdate.close();
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
