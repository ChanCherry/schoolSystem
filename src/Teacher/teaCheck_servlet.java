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

public class teaCheck_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();

		String tno=req.getParameter("tno");
		out.println("<h2>系统安全检查完毕。</h2>");
		
		String sql="select * from user1 where 账号='"+tno+"'";
		query query=new query();
		ResultSet rs=query.executeQuery(sql);
		
		try {
			while(rs.next()){
				String pwd=rs.getString(3);
				out.println("<h3>工号为"+tno+"的教师的密码为"+pwd+"，安全检查结果如下：</h3>");
				if(pwd.length()<6){
					out.println("<h3><font color=red>(ŎдŎ；)密码长度小于6，过短，不安全！建议立刻修改密码！</font></h3>");
				}else {
					if(pwd.matches(".*[a-zA-z].*")&&pwd.matches(".*[0-9].*"))//正则判断密码中是否同时有密码和数字
						out.println("<h3>(*^▽^*)密码长度合适，且密码中包含字母和数字，比较安全！</h3>");
					else
						out.println("<h3>((´-_-)-_-)-_-)密码长度合适，但密码中没有同时包含字母和数字，安全程度适中，建议修改为更安全的密码！</h3>");
				}
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
