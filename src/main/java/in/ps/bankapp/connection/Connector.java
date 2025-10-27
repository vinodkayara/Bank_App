package in.ps.bankapp.connection;
//Factory class which returns Connection Interface ref Object

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
	public static Connection getCon() {
		Connection con = null;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_app","root","tiger");
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		return con;
	}
}
