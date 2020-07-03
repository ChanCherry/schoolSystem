package User;

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

public class AUserReg_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String num=req.getParameter("num");//获取参数
		String tele=req.getParameter("tele");
		String pwd=req.getParameter("password");
		
		String sql="select * from user1 where 账号='"+num+"'";
		String insert="insert into user1(账号,电话,密码) values('"+num+"','"+tele+"','"+pwd+"')";
		
		query userQuery=new query();//实例化用户查询和添加
		update userAdd=new update();
		ResultSet rs=userQuery.executeQuery(sql);//执行查询并返回结果集

		String n1="";//从数据库获取的账号
		int flag=1,tmp=0;
		try {
			while(rs.next()){
				n1=rs.getString("账号");
				flag=0;
				if(n1.equals(num)){//和数据库里的匹配，添加失败，返回添加页面
					out.print("<script>alert('添加失败！该用户已存在！请重新添加！');</script>");
					out.println("<script>window.location.href='adminAddUser.jsp'</script>");
					break;
				}
			}
			if(flag==1){
				tmp=userAdd.executeUpdate(insert);
				if(tmp>0){
					out.print("<script>alert('添加成功！即将返回管理员中心！');</script>");
					out.println("<script>window.location.href='adminInfo.jsp'</script>");
				}
				else {
					out.print("<script>alert('添加失败！即将返回管理员中心！');</script>");
					out.println("<script>window.location.href='adminInfo.jsp'</script>");
				}
			}

			userQuery.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
