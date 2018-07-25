package com.ft.extraday.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBHelper {

	static String driver = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://127.0.0.1:3306/xingqiba";
	static String user = "root";
	static String password = "123456";

	static {

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static Connection getCon() {
		Connection con = null;

		try {
			con = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			// TODO: handle exception
		}

		return con;
	}

	public static void closeAll(ResultSet rs, PreparedStatement pstm, Connection con) {
		try {

			if (rs != null) {
				rs.close();
			}
			if (pstm!=null) {
				pstm.close();
			}
			if (con!=null) {
				con.close();
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception

		}

	}
}
