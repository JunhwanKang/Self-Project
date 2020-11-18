<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbinfo.jsp" %>

<%
	String idx[] = request.getParameterValues("chkName");

	Statement stmt = con.createStatement();
	
	try{
		for (int ii=0; ii<idx.length; ii++){
			String sql = "delete from cart where idx =" + idx[ii];
			stmt.executeUpdate(sql);
			out.print(sql);
		}
		
		
	}catch(SQLException e1){
		e1.printStackTrace();
	}catch(Exception e2){
		e2.printStackTrace();
	}finally{
		if(stmt != null) stmt.close();
		if(con != null) con.close();
		response.sendRedirect("goodsCart.jsp");
	}
%>    
