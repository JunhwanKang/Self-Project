package com.myProject.pjt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



public class memberDao {
	
	private String url = "jdbc:mysql://localhost:3306/jspbook?characterEncoding=UTF-8 & serverTimezone = UTC";
	private String user = "jspbook";
	private String password = "1234";
	
	public memberDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");  
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertMember(memberDto dto){

		Connection conn = null;	
		PreparedStatement pstmt = null; 
		String sql = "insert into joined values (?,?,?,?,?)"; //날짜 ? 삭제
		try {
			conn = DriverManager.getConnection(url, user, password);			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
//			pstmt.setTimestamp(7, dto.getjDate());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
