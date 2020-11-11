<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="dbinfo.jsp" %>
<%
	String goodscd = request.getParameter("goodscd");
	String qty = request.getParameter("qty");
	String colorcd = request.getParameter("colorcd");
	String unitprice = request.getParameter("unitprice");
	String sizecd = request.getParameter("sizecd");
	String userid = request.getParameter("G_ID");
	
	Statement stmt = con.createStatement();
	
	try{
		String sql = "insert into cart(userid, goodscd, color, size, unitprice, qty, chkYN) values ("
					+ userid+"', '"+goodscd+"', '"+colorcd+"', '"+sizecd+"', '"+unitprice+"', '"+qty+"', 'Y')";
		stmt.executeUpdate(sql);
	} catch(SQLException e1){
		e1.printStackTrace();
	} catch(Exception e2){
		e2.printStackTrace();
	} finally{
		if(stmt != null) stmt.close();
		if(con != null) con.close();
		
		response.sendRedirect("goodsCart.jsp");
	}
%>    
