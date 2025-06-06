package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static Connection conn;
	
	public static Connection  getConn() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
                // Original hardcoded connection is commented out
                Properties props = new Properties();
                InputStream input = DBConnect.class.getClassLoader().getResourceAsStream("config/config.properties");
                props.load(input);
                String url = props.getProperty("db.url");
                String user = props.getProperty("db.username");
                String pass = props.getProperty("db.password");
                conn = DriverManager.getConnection(url, user, pass);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

}
