package User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.update;

//学生用户修改信息
public class UserUpdate_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String num=req.getParameter("sno");//获取请求的参数
		String tele=req.getParameter("stele");
		String pwd=req.getParameter("spwd");
		
		update userUpdate=new update();
		
		String update="update user1 set 电话='"+tele+"',密码='"+pwd+"' where 账号='"+num+"'";
		int flag=userUpdate.executeUpdate(update);
		if(flag>0){
			out.println("<script>alert('修改成功！即将返回首页！')</script>");
			out.println("<script>window.location.href='stuInfo.jsp?sno="+num+"'</script>");
		}
		else{
			out.println("<script>alert('修改失败！请重新修改！')</script>");
			out.println("<script>window.location.href='stu_center.jsp?sno="+num+"'</script>");

		}
		userUpdate.close();
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
