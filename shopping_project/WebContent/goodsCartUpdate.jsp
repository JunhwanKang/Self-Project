<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = dbinfo.jsp %>
<%
	String idx[] = request.getParameterValues("idx");
	String chkName[] = request.getParameterValues("chkName");
	String qty[] = request.getParameterValues("qty");
	String userid = (String)session.getAttribute("G_ID");
	
	Statement stmt = con.createStatement();
	String sql = "";
	boolean fnd = false;
	
	try{
		for(int ii=0; ii<idx.length; ii++){
			sql = "update cart set ";
			sql = sql + "qty = " + qty[ii];
			
			fnd = false;
		for(int jj=0; jj<chkName.length; jj++){
			if(chkName[jj].equals(idx[ii])){
				fnd = true;
				break;
			}
		}
		if(fnd==true)
			sql = sql + " , chkYN = 'Y' ";
		else
			sql = sql + ", chkYN = 'N' ";
		
		sql = sql + "where idx = "+idx[ii];
		
		stmt.executeUpdate(sql);
		}
	}catch(SQLException e1){
		e1.printStackTrace();
	}catch(Exception e2){
		e2.printStackTrace();
	}finally{
		if(stmt != null) stmt.close();
		if(con != null) con.close();
		response.sendRedirect("goodsOrderPageA.jsp");
	}
%>    
