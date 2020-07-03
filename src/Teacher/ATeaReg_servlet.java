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
import Deal.update;

public class ATeaReg_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String tno=req.getParameter("tno");
		String tname=req.getParameter("tname");
		String sex=req.getParameter("sex");
		String tage=req.getParameter("tage");
		String tmark=req.getParameter("tmark");
		String twage=req.getParameter("twage");

		String sql="select * from user1 where 账号='"+tno+"'";
		String sql1="select * from Teacher where 工号='"+tno+"'";
		String insert="insert into Teacher(工号,姓名,性别,年龄,得分,工资) values('"+tno+"',N'"+tname+"',N'"+sex+"','"+tage+"','"+tmark+"','"+twage+"')";
		query query=new query();
		ResultSet rs=null,rs1=null;
		rs=query.executeQuery(sql);
		int flag1=1,flag=1;
		try {
			while(rs.next()){//验证用户是否已经注册，注册才执行教师表的验证，否则退出去注册
				flag1=0;//教师用户已存在，可以添加教师
				
				rs1=query.executeQuery(sql1);
				update add=new update();
				String num="";//从数据库获取的工号
				
				while(rs1.next()){//验证教师工号是否已存在
					flag=0;
					num=rs1.getString("工号");
					if(num.equals(tno)){//工号已存在，重新添加
						out.print("<script>alert('该工号教师已存在，请重新添加！');</script>");
						out.println("<script>window.location.href='adminAddTea.jsp'</script>");
						break;
					}
				}
				if(flag==1){//该工号教师不存在，可以添加
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
				out.print("<script>alert('工号错误！该账号用户不存在，请先添加用户！');</script>");
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
