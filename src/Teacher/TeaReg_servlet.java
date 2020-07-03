package Teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.update;
import Deal.query;

public class TeaReg_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String tno=req.getParameter("tno");
		String tname=req.getParameter("tname");
		String sex=req.getParameter("sex");
		String tage=req.getParameter("tage");
		

		String sql="select * from user1 where 工号='"+tno+"'";
		String sql1="select * from Teacher where 工号='"+tno+"'";
		String insert="insert into Teacher(工号,姓名,性别,年龄,得分,工资) values('"+tno+"',N'"+tname+"',N'"+sex+"','"+tage+"','0','0')";
		query query=new query();
		ResultSet rs=null,rs1=null;
		rs=query.executeQuery(sql);
		String num1="";
		int flag=1;
		try {
			while(rs.next()){//验证用户是否已经注册，注册才执行学生表的验证，否则退出去注册
				num1=rs.getString("账号");
				if(!num1.equals(tno)){
					out.print("<script>alert('工号错误！该账号用户不存在，请用户重新注册！');</script>");
					out.println("<script>window.location.href='userReg.jsp'</script>");
					break;
				}
				else{
					rs1=query.executeQuery(sql1);
					update add=new update();
					String num="";//从数据库获取的工号，姓名
					
					while(rs1.next()){//验证教师工号是否已存在
						flag=0;
						num=rs1.getString("工号");
						if(num.equals(tno)){//学号已存在，重新注册
							out.print("<script>alert('该工号教师已存在，请重新注册！');</script>");
							out.println("<script>window.location.href='sysIn.jsp'</script>");
							break;
						}
					}
					if(flag==1){//该工号教师不存在，可以注册
						int n=add.executeUpdate(insert);//执行插入操作
						if(n>0){
							out.print("<script>alert('注册成功！即将返回首页！');</script>");
							out.println("<script>window.location.href='sysIn.jsp'</script>");
						}
						else {
							out.print("<script>alert('注册失败！即将返回首页！')</script>");
							out.println("<script>window.location.href='sysIn.jsp'</script>");
						}

					}

				}
				break;
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
