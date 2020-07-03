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

public class tnoSelect_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
			
		 
		String tno=req.getParameter("tno");
		String sql = "select * from Teacher where 工号='"+tno+"'";
		//System.out.println(sql);
		query query=new query();
		ResultSet rs=query.executeQuery(sql);
		try {
			
			while(rs.next()){
				out.write("<p>工号："+rs.getString(1)+"</p>");
				out.write("<p>姓名："+rs.getString(2)+"</p>");
				out.write("<p>性别："+rs.getString(3)+"</p>");
				out.write("<p>年龄："+rs.getString(4)+"</p>");
				out.write("<p>得分："+rs.getString(5)+"</p>");
				out.write("<p>工资："+rs.getString(6)+"</p>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		query.close();
	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
