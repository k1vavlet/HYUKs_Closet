package com.spring.DBSet;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbSet {
	public static Connection getConnection() throws Exception {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url, "hr", "hr");
		
		return conn;
	}
}
