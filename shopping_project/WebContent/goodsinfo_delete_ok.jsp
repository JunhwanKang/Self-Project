<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
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
	
	ResultSet rs = null;
	Statement stmt = con.createStatement();
	
	String goodscd = multi.getParameter("goodscd");
	
	try{
		String strSQL = "select * from goodsinfo where goodscd = '"+goodscd+ "' ";
		rs = stmt.executeQuery(strSQL);
		
		if(rs.next()){
			String goodsimg1 = rs.getString("goodsimg1");
			String filePath = getServletContext().getRealPath(saveFolder) + File.separator + goodsimg1;
			out.print(filePath);
			File f1 = new File(filePath);
			
			if(f1.exists()) new File(filePath).delete();
		}
		
		strSQL = "delete from goodsinfo where goodscd = '" +goodscd+ "' ";
		
		stmt.executeUpdate(strSQL);
	} catch(SQLException e1){
		e1.printStackTrace();
	} catch(Exception e2){
		e2.printStackTrace();
	} finally{
	if(stmt != null) stmt.close();
	if(rs != null) rs.close();
	if(con != null) con.close();
	response.sendRedirect("goodlist.jsp");
	}
%>
