package com.bit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyOracle {

	private MyOracle() {
		
	}
	
	public static Connection getConnection() {
		String driver="oracle.jdbc.driver.OracleDriver";
		Connection conn=null;
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection("jdbc:oracle:thin:hr/hr@127.0.0.1:1521:xe");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}				
		return conn;
	} 
	
}
