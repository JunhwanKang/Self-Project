<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbinfo.jsp" %>    
<%
	String realFolder="";
	String saveFolder="images";
	String encType="UTF-8";
	
	int sizeLimit= 10*1024*1024;
	realFolder = application.getRealPath(saveFolder);
	MultipartRequest multi = new MultipartRequest(request, realFolder, sizeLimit, encType);
	
	Statement stmt = con.createStatement();
	
	String goodscd = multi.getParameter("goodscd");
	String goodsnm = multi.getParameter("goodsnm");
	String unitprice = multi.getParameter("unitprice");
	String best_yn = multi.getParameter("best_yn");
	if(best_yn != null && best_yn.equals("Y"))
		best_yn = "Y";
	else
		best_yn = "N";
	
	String fileName1 = multi.getFilesystemName("goodsimg1");
	
	try{
		String sql = "update goodsinfo set ";
		sql = sql + " goodsnm = '" +goodsnm + "' ";
		sql = sql + ", unitprice = '" +unitprice + "' ";
		sql = sql + ", best_yn = '" +best_yn+ "' ";
		if(fileName1 != null)
			sql = sql + ", goodsimg1 = '" +fileName1+ "' ";
		sql = sql + " where goodscd = '"+goodscd+ "' ";
		
		stmt.executeUpdate(sql);
	} catch(SQLException e1){
		e1.printStackTrace();
	} catch(Exception e2){
		e2.printStackTrace();
	} finally{
		if(stmt != null) stmt.close();
		if(con != null) con.close();
		response.sendRedirect("goodlist.jsp");
	}
%>
