package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.Name;

import Deal.query;


public class UserLogin_servlet extends HttpServlet{//验证登录
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		//设置对客户端请求进行重新编码的编码
		resp.setCharacterEncoding("UTF-8");
		//用于定义网络文件的类型和网页的编码，决定浏览器将以什么形式、什么编码读取这个文件
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		
		String num=req.getParameter("num");//获取用户参数
		String tele=req.getParameter("tele");
		String pwd=req.getParameter("password");

		if(num.equals("admin")){
			if(pwd.equals("password")){
				out.print("<script>alert('登录成功！欢迎管理员进入系统！');</script>");
				out.print("<script>window.location.href='adminInfo.jsp'</script>");
			}
			else {
				out.print("<script>alert('密码错误！管理员登录失败！');</script>");
				out.print("<script>window.location.href='sysIn.jsp'</script>");
			}
		}

		String sql="select * from user1 where 账号='"+num+"'";
		
		query query=new query();
		ResultSet rs=query.executeQuery(sql);

		String t1="",p1="";//从数据库获取的电话和密码
		int flag=1;//标志变量
		try {
			while(rs.next()){
				t1=rs.getString("电话");
				p1=rs.getString("密码");
				flag=0;
				
				if(t1.equals(tele)){
					if(p1.equals(pwd)){//电话和密码同时匹配才登录成功
						out.print("<script>alert('登录成功！欢迎进入系统！');</script>");
						out.print("<script>window.location.href='sysIn.jsp'</script>");
						break;
					}
					else{//密码错误
						out.print("<script>alert('密码错误！登录失败！');</script>");
						out.print("<script>window.location.href='userLogin.jsp'</script>");
						break;
					}
				}
			}
			if(flag==1){
				out.print("<script>alert('该用户不存在，请先注册！');</script>");
				out.println("<script>window.location.href='userLogin.jsp'</script>");
			}

			query.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
