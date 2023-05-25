package com.tuespot.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class JdbcConn {
	
	public static Connection conn;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tuespot","root","root");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
		
	}

}
