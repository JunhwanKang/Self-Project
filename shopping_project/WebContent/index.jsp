<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="dbinfo.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link href="all.css" rel="stylesheet">
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" valign="top">
				<table width="815" border="0" cellspacing="0" cellpadding="0">
				 <%@include file = "admin_top.jsp" %>
				 <tr> 
				 	<td height ="284"><img src="icons/main.jpg" width="815" height="284" alt="메인"/></td>
				 </tr>
		<%
			ResultSet rs = null;
			Statement stmt = con.createStatement();
			
			String sql = "select * from goodsinfo a where a.best_YN = 'Y'";
			rs = stmt.executeQuery(sql);
		%>		 	
				<tr>
					<td height="239" align="center" valign="top">
					 <table width="800" border="0" cellspacing="0" cellpadding="0">
					 	<tr>
					 		<td height="45" align="left" class="new_tit">추천상품</td>
					 		<td height="45" colspan="3" align="right" class="new_tit">
					 			<a href="#">more</a>
					 		</td>	
					 	</tr>
	 				</tr>
	 	<%
	 		int cnt=0;
	 	while(rs.next()){
	 		
	 		String goodscd = rs.getString("goodscd");
	 		String goodsnm = rs.getString("goodsnm");
	 		
	 		int unitprice = rs.getInt("unitprice");
	 		String goodsimg1 = rs.getString("goodsimg1");
	 	%>
	 					<td width="200" align="center" vailgn="top">
	 						<table width="190" border="0" cellspacing="0" cellpadding="0">
	 							<tr>
	 					<td align="center"><a href="goodsdetail.jsp?pgoodscd=<%=goodscd %>">
	 						<img src="images/<%=goodsimg1%>" width="170" height="170" border="0"/></a>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td height="50" align="center">
	 						<a href="goodsdetail.jsp?pgoodscd=<%=goodscd %>"><%=goodsnm %><br/>
	 	<%
	 		DecimalFormat df = new DecimalFormat("###,###,##0");
	 		out.println(df.format(unitprice));
	 	%>										
	 			원</a></td>
	 					</tr>
	 				</table>
	 			</td>
	 	<%
			cnt++;	 	
			if(cnt==3)
				out.print("</tr><tr>");
	 	}
		 	
		 	if(cnt != 3)
		 		out.print("</tr>");
		 	if(stmt != null) stmt.close();
		 	if(rs != null) rs.close();
		 	if(con != null) con.close();
	 	%>							 		
	</table></td>
	</tr>
	<%@include file = "bottom.jsp" %>
</body>
</html>