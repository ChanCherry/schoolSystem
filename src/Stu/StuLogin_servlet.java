package Stu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.query;


public class StuLogin_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String sno=req.getParameter("sno");//登录页面传过来的参数
		String sname=req.getParameter("sname");
		String pwd=req.getParameter("spwd");
		
		String sql="select * from user1 where 账号='"+sno+"'";
		String sql1="select * from Stu,user1 where Stu.学号=user1.账号 and Stu.学号='"+sno+"'";//查询两个表都存在的学生信息
		query query=new query();
		ResultSet rs=null,rs1=null;
		
		rs=query.executeQuery(sql);

		String num1="",num2="",name1="",pwd1="";//从数据库获取的学号，姓名，密码
		int flag=1,flag1=1;
		try {
			while(rs.next()){//有结果返回
				flag=0;
				num1=rs.getString("账号");
				pwd1=rs.getString("密码");
				
				if(num1.equals(sno)){//该用户存在user表中
					rs1=query.executeQuery(sql1);
					while(rs1.next()) {//该学生已存在
						flag1=0;
						num2=rs1.getString("学号");
						name1=rs1.getString("姓名");
						if(num2.equals(sno)&&name1.equals(sname)&&pwd1.equals(pwd)){//登录成功，进入学生个人中心
							//req.getSession().setAttribute("sno", sno);
							out.print("<script>alert('登录成功!进入学生个人中心！');</script>");
							req.getRequestDispatcher("stuInfo.jsp?sno="+sno).forward(req,resp);//转发
							//out.println("<script>window.location.href='stuInfo.jsp?sno='"+sno+"''</script>");//要跳转，不然就停留在StuLogin_servlet空白页面
							break;
						}
						else {//信息输入错误，登录失败
							out.print("<script>alert('姓名或密码错误！登录失败!');</script>");
							out.print("<script>window.location.href='stuLogin.jsp'</script>");//跳转回学生登录
							break;
						}
					}
					if(flag1==1){//该用户存在，但是学生不存在
						out.print("<script>alert('该学生信息不存在！请先去注册学生信息!');</script>");
						out.println("<script>window.location.href='stuReg.jsp'</script>");//跳转到学生注册
						break;
					}
					break;
				}
				
			}
			if(flag==1){
				out.print("<script>alert('学号错误！该账号用户不存在，请用户重新注册！');</script>");
				out.println("<script>window.location.href='stuLogin.jsp'</script>");
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