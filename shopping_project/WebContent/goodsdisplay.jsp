<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbinfo.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 진열</title>
<link href="all.css" rel="stylesheet">
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" valign="top">
			<table width="815" border="0" cellspacing="0" cellpadding="0">
			<%@include file="top.jsp" %>
		<tr>
			<td height="80" background="icons/sub_bg.jpg">&nbsp;</td>
		</tr>
		<tr>
	<%
		String strPageNum = request.getParameter("PageNum");
		if(strPageNum==null){
			strPageNum ="1";
		}
	int currentPage = Integer.parseInt(strPageNum);
	
	int pageSize=6;
	
	ResultSet rs = null, rs2 = null;
	
	Statement stmt = con.createStatement();
	
	String cat1cd = request.getParameter("pcat1");
	
	String sql = "select count(*) from goodsinfo a "+
				" inner join category2 b on a.cat1cd = b.cat1cd and "+
				" a.cat2cd = b.cat2cd inner join category1 c on b.cat1cd = c.cat1cd ";
	sql = sql+ " where a.cat1cd = '" +cat1cd+"'";
	rs2 = stmt.executeQuery(sql);
	
	int totalRecords = 0;
	if(rs2.next() == false){
	%>		
			<td colspan=7><center>등록된 상품이 없습니다.</center></td>
			</tr>
	<%
	}
	else{
	%>
			<td align="center" valign="top"><table width="800" border="0" cellspacing="0" cellpadding="0">
	<%
		totalRecords = rs2.getInt(1);
	
		sql="select "+pageSize +" cat1nm, cat2nm, goodscd, goodsnm, unitprice, best_yn, goodsimg1 "
			+" from goodsinfo a inner join category2 b " 
			+" inner join category1 c on b.cat1cd = c.cat1cd "
			+" where a.cat1cd = '"+cat1cd+"' "
			+" and goodscd not in(select * from ((select goodscd "
			+" from goodsinfo a inner join category2 b on a.cat1cd = b.cat1cd "
			+" and a.cat2cd = b.cat2cd "
			+" inner join category1 c on b.cat1cd = c.cat1cd order by goodscd  LIMIT "+((currentPage -1)*pageSize) + " ) as temp)) "
			+" order by goodscd LIMIT "+pageSize;
				
		rs = stmt.executeQuery(sql);
		
		int pageSize_temp = pageSize;
		
		int cnt=0;
		while(rs.next() && pageSize_temp > 0){
			cnt++;
			
			String cat1nm = rs.getString("cat1nm");
			String cat2nm = rs.getString("cat2nm");
			String goodscd = rs.getString("goodscd");
			String goodsnm = rs.getString("goodsnm");

			int unitprice = rs.getInt("unitprice");
			String best_yn = rs.getString("best_yn");
			String goodsimg1 = rs.getString("goodsimg1");
			
			if(cnt==1){
	%>	
		<tr>
			<td height="45" align="left" class="new_tit"><%=cat1nm %></td>
				<td height="45" colspan="3" align="right">HOME &lt; <%=cat1nm %></td>
		</tr>
		<tr>
	<%
		}						
	%>	
			<td>
				<table border="1" cellspacing="1" cellpadding="2" width="200">
		<tr>
			<td>
				<a href = "goodsdetail.jsp?pgoodscd=<%=goodscd %>">
				<img src="images/<%=goodsimg1%>" height="200" width="200">
				</a>					
			</td>
			</tr>
			<tr>
				<td align="center">
				<%=goodsnm %>
					</td>
				</tr>
			<tr>
				<td align="center">
	<%
		DecimalFormat df = new DecimalFormat("###,###,##0");
		out.print(df.format(unitprice));
	%>					
		</td>
		</tr>
		</table>
		</td>
	<%
		pageSize_temp = pageSize_temp - 1;
	
		if(cnt==3)
			out.print("</tr><tr>");
		}
	}	
	%>	
		</tr>
		</table></td>
	</tr>
	<tr><td height="30"></td>
	</tr>
	<tr><td colspan="4" align="center">
	<%
		int intTotPages = 0;
		int intR = totalRecords % pageSize;
		if(intR == 0){
			intTotPages = totalRecords / pageSize;
		}else
			intTotPages = totalRecords / pageSize +1;
		
		int intGrpSize=1;
		int currentGrp = 0;
		intR = currentPage % intGrpSize;
		if(intR == 0){
			currentGrp = currentPage / intGrpSize;
		}else{
			currentGrp = currentPage / intGrpSize +1;
		}
		
		int intGrpStartPage = (currentGrp -1)* intGrpSize +1;
		int intGrpEndPage = currentGrp * intGrpSize;
		if(intGrpEndPage > intTotPages){
			intGrpEndPage = intTotPages;
		}
		if(currentGrp  > 1){
	%>
		[<a href="goodsdisplay.jsp?pcat1=<%=cat1cd %>&PageNum=<%=intGrpStartPage -1%>">이전</</a>]
	<%
		}
		int intGrpPageCount = intGrpSize;
		int intIndex = intGrpStartPage;
		
		while(intGrpPageCount >0 && intIndex <= intGrpEndPage){
	%>
		[<a href="goodsdisplay.jsp?pcat1=<%=cat1cd %>PageNum=<%=intIndex %>"><%=intIndex %></a>]&nbsp;	
	<%
	
		intIndex = intIndex +1;
		intGrpPageCount = intGrpPageCount -1;
		}
		
		if(intIndex <= intTotPages){
	%>	
		[<a href="goodsdisplay.jsp?pcat1=<%=cat1cd %>PageNum=<%=intIndex %>">다음</a>]
	<%
		}
	%>	
	</td>
	</tr>
	</tr>
	<%@include file="bottom.jsp" %>
	
	</table></td>
	</tr>
	</table>
	<%
		if (stmt  != null) stmt.close();
		if (rs    != null) rs.close();
		if (rs2   != null) rs2.close();
		if (con   != null) con.close();
	%>
</body>
</html>