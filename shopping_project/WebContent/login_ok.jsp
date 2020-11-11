<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "dbinfo.jsp" %>    
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String suserid = request.getParameter("userid");
	String spasswd = request.getParameter("passwd");
	
	String sql = "select usernm from members where userid = ? and passwd = ?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, suserid);
	pstmt.setString(2, spasswd);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()==true){
		session.setAttribute("G_ID", suserid);
		session.setAttribute("G_NM", rs.getString(1));
		session.setMaxInactiveInterval(60*60);
		
		response.sendRedirect("index.jsp");
	}
	else
		out.print("로그인을 실패하였습니다.");
	
	pstmt.close();
	rs.close();
	con.close();
%>
