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

public class AStuReg_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String sno=req.getParameter("sno");
		String sname=req.getParameter("sname");
		String sex=req.getParameter("sex");
		String sage=req.getParameter("sage");
		String special=req.getParameter("special");
		String sclass=req.getParameter("sclass");
		String steacher=req.getParameter("steacher");
		String gpa=req.getParameter("gpa");
		
		String sql="select * from user1 where 账号='"+sno+"'";
		String sql1="select * from Stu where 学号='"+sno+"'";
		String insert="insert into Stu(学号,姓名,性别,出生年月,专业,班级,导师,GPA) values('"+sno+"','"+sname+"','"+sex+"','"+sage+"','"+special+"','"+sclass+"','"+steacher+"','"+gpa+"')";
		query query=new query();
		ResultSet rs=null,rs1=null;
		rs=query.executeQuery(sql);
		int flag1=1,flag=1;
		try {
			while(rs.next()){//验证用户是否已经注册，注册才执行学生表的验证，否则退出去注册
				flag1=0;

				rs1=query.executeQuery(sql1);
				update add=new update();
				String num="";//从数据库获取的学号
				
				while(rs1.next()){//验证学生学号是否已存在
					flag=0;
					num=rs1.getString("学号");
					if(num.equals(sno)){//学号已存在，重新添加
						out.print("<script>alert('该学号学生已存在，请重新添加！');</script>");
						out.println("<script>window.location.href='adminAddStu.jsp'</script>");
						break;
					}
				}
				if(flag==1){//该学号学生不存在，可以添加
					int n=add.executeUpdate(insert);//执行插入操作
					if(n>0){
						out.print("<script>alert('添加成功！即将返回管理员中心！');</script>");
						out.println("<script>window.location.href='adminInfo.jsp'</script>");
					}
					else {
						out.print("<script>alert('添加失败！即将返回管理员中心！')</script>");
						out.println("<script>window.location.href='adminInfo.jsp'</script>");
					}

				}

			}
			if(flag1==1){
				out.print("<script>alert('学号错误！该账号用户不存在，请先添加用户！');</script>");
				out.println("<script>window.location.href='adminInfo.jsp'</script>");
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
