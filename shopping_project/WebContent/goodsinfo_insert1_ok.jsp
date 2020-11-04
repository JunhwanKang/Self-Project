<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>    
<%@ include file="dbinfo.jsp"%>

<%
	String realFolder="";
	String saveFolder="images";
	String encType="utf-8";
	
	int sizeLimit=10*1024*1024;
	realFolder = application.getRealPath(saveFolder);
	MultipartRequest multi = new MultipartRequest(request, realFolder, sizeLimit, encType);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Statement stmt = con.createStatement();
	
	String catg1cd = multi.getParameter("catg1cd");
	String catg2cd = multi.getParameter("catg2cd");
	String goodsnm = multi.getParameter("goodsnm");
	String unitprice = multi.getParameter("unitprice");
	String best_yn = multi.getParameter("best_yn");
	
	if(best_yn != null && best_yn.equals("on"))
		best_yn = "Y";
	else
		best_yn = "N";
	String fileName1 = multi.getFilesystemName("goodsimg1");
	
	try{
		int seq = 0;
		String strSeq = "";
		String sql = "select max(goodscd) from goodsinfo where left(goodscd,2)='"+
				catg1cd+catg2cd+"'";
		rs = stmt.executeQuery(sql);
		
		rs.next();
		if(rs==null){
			seq=0;
		}else{
			String maxcode = rs.getString(1);
			if(maxcode == null)
				seq=0;
			else{
				strSeq = maxcode.substring(2);
				seq = Integer.parseInt(strSeq);
			}
		}
		seq++;
		String newSeq = "0000"+Integer.toString(seq);
		int newSeqleng = newSeq.length();
		String newgoodscd = catg1cd + catg2cd + newSeq.substring(newSeqleng -4, newSeqleng);
		
		sql = "insert into goodsinfo(catg1cd, catg2cd, goodscd, goodsnm, unitprice, "
			+"best_yn, goodsimg1, useflag) values(?,?,?,?,?,?,?'Y')";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1,catg1cd);
		pstmt.setString(2,catg2cd);
		pstmt.setString(3,newgoodscd);
		pstmt.setString(4,goodsnm);
		pstmt.setInt(5,Integer.parseInt(unitprice));
		pstmt.setString(6,best_yn);
		pstmt.setString(7,fileName1);
		
		pstmt.executeUpdate();
	} catch(SQLException e1){
		e1.printStackTrace();
	} catch(Exception e2){
		e2.printStackTrace();
	} finally{
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(rs != null) rs.close();
		if(con != null) con.close();
		response.sendRedirect("goodslist.jsp");
	}
%>