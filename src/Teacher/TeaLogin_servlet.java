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

public class TeaLogin_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String tno=req.getParameter("tno");//登录页面传过来的参数
		String tname=req.getParameter("tname");
		String pwd=req.getParameter("tpwd");
		
		String sql="select * from user1 where 账号='"+tno+"'";
		String sql1="select * from Teacher,user1 where Teacher.工号=user1.账号 and Teacher.工号='"+tno+"'";//查询两个表都存在的学生信息
		query query=new query();
		ResultSet rs=null,rs1=null;
		
		rs=query.executeQuery(sql);

		String num1="",num2="",name1="",pwd1="";//从数据库获取的工号，姓名，密码
		int flag=1,flag1=1;
		try {
			while(rs.next()){//有结果返回
				flag=0;
				num1=rs.getString("账号");
				pwd1=rs.getString("密码");
				
				if(num1.equals(tno)){//该用户存在user表中
					rs1=query.executeQuery(sql1);
					while(rs1.next()) {//该学生已存在
						flag1=0;
						num2=rs1.getString("工号");
						name1=rs1.getString("姓名");
						if(num2.equals(tno)&&name1.equals(tname)&&pwd1.equals(pwd)){//登录成功，进入教师个人中心
							out.print("<script>alert('登录成功!进入教师个人中心！');</script>");
							req.getRequestDispatcher("teaInfo.jsp?tno="+tno).forward(req,resp);//转发
							break;
						}
						else {//信息输入错误，登录失败
							out.print("<script>alert('姓名或密码错误！登录失败!');</script>");
							out.print("<script>window.location.href='teaLogin.jsp'</script>");//跳转回教师登录
							break;
						}
					}
					if(flag1==1){//该用户存在，但是学生不存在
						out.print("<script>alert('该教师信息不存在！请先去注册教师信息!');</script>");
						out.println("<script>window.location.href='teaReg.jsp'</script>");//跳转到教师注册
						break;
					}
					break;
				}
				
			}
			if(flag==1){
				out.print("<script>alert('工号错误！该账号用户不存在，请用户重新注册！');</script>");
				out.println("<script>window.location.href='teaLogin.jsp'</script>");
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