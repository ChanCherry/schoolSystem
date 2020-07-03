package Teacher;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.update;

//管理员修改教师信息
public class ATeaUpdate_servlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String num=req.getParameter("tno");//获取请求的参数
		String name=req.getParameter("tname");
		String sex=req.getParameter("sex");
		String age=req.getParameter("tage");
		String mark=req.getParameter("tmark");
		String wage=req.getParameter("twage");
		
		update TeaUpdate=new update();
		
		String update="update Teacher set 姓名=N'"+name+"',性别=N'"+sex+"',年龄='"+age+"',得分='"+mark+"',工资='"+wage+"' where 工号='"+num+"'";
		int flag=TeaUpdate.executeUpdate(update);
		if(flag>0){
			out.println("<script>alert('修改成功！即将返回管理员中心首页！')</script>");
			out.println("<script>window.location.href='adminInfo.jsp'</script>");
		}
		else{
			out.println("<script>alert('修改失败！请重新修改！')</script>");
			out.println("<script>window.location.href='teaUpdate.jsp?tno="+num+"'</script>");
		}
		TeaUpdate.close();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
