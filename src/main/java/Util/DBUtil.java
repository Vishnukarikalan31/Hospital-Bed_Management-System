
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	private static final String DBURL = "jdbc:mysql://localhost:5550/management_system";
	private static final String DBUSER = "root";
	private static final String DBPASS = "Vishnu@3105";
	public static final String DBDRIVER = "com.mysql.cj.jdbc.Driver";

	static {
	    try {
	        Class.forName(DBDRIVER);
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	        
	    }
	}


	public static Connection getConnection() throws SQLException {
	    return DriverManager.getConnection(DBURL, DBUSER, DBPASS);
	}

}
