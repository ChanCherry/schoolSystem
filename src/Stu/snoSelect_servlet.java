package Stu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Deal.query;

public class snoSelect_servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{ 
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
			
		String sno=req.getParameter("sno");
		String sql = "select * from Stu where 学号='"+sno+"'";
		query query=new query();
		ResultSet rs=query.executeQuery(sql);
		try {
			while(rs.next()){
				out.write("<p>学号："+rs.getString(1)+"</p>");
				out.write("<p>姓名："+rs.getString(2)+"</p>");
				out.write("<p>性别："+rs.getString(3)+"</p>");
				out.write("<p>出生年月："+rs.getString(4)+"</p>");
				out.write("<p>专业："+rs.getString(5)+"</p>");
				out.write("<p>班级："+rs.getString(6)+"</p>");
				out.write("<p>导师："+rs.getString(7)+"</p>");
				out.write("<p>GPA："+rs.getString(8)+"</p>");
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