<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../dbinfo.jsp"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%
		
	PreparedStatement pstmt = null;
	ResultSet rs= null;

	String suserid = request.getParameter("userid");
	String spasswd = request.getParameter("passwd");
	
	String SQL = "select admin_name from admin_members " + "where admin_id=? and admin_pw=?";
	pstmt = con.prepareStatement(SQL);
	pstmt.setString(1, suserid);
	pstmt.setString(2, spasswd);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()==true){
		session.setAttribute("G_ADMIN_ID", suserid);
		session.setAttribute("G_ADMIN_NM", rs.getString(1));
		session.setMaxInactiveInterval(60*60);
		
		response.sendRedirect("admin_index.jsp");
	}
	else{
		out.print("로그인에 실패하였습니다.<br>"+ "다시 로그인 해주세요.");
	%>
	<form action="admin_login.jsp" method="post">
	<input type=submit value="로그인 페이지로">
	</form>
	<%
	}
	
	pstmt.close();
	rs.close();
	con.close();
	
%>