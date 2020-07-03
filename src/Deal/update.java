package Deal;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class update {
	Connection con=null;
	Statement stmt=null;

	public int executeUpdate(String sql){
		int x=0;
		try {
			//装载JDBC驱动程序 
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//设置数据库连接字符串 
			con = java.sql.DriverManager.getConnection("jdbc:sqlserver://127.0.0.1;databaseName=User","cxm","cxm");
			stmt = con.createStatement();
			x=stmt.executeUpdate(sql);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return x;
	}


	public void close() {
		try {
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
