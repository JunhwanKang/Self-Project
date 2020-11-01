<%@include file = "dbinfo.jsp"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		
	PreparedStatement pstmt = null;
	ResultSet rs= null;

	String suserid = request.getParameter("userid");
	String spasswd = request.getParameter("passwd");
	
	String SQL = "select admin_name from admin_members" + "where admin_id = ? and admin_pw = ?";
	pstmt = con.prepareStatement(SQL);
	pstmt.setString(1, suserid);
	pstmt.setString(2, spasswd);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()==true){
		session.setAttribute("G_ADMIN_ID", suserid);
		session.setAttribute("G_ADMIN_NM", rs.getString(1));
		session.setMaxInactiveInterval(60*60);
		
		response.sendRedirect("admin_index.jsp");
		out.print("이거 실행됨.");
	}
	else
		out.print("로그인에 실패하였습니다.");
	
	pstmt.close();
	rs.close();
	con.close();
	
%>