 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.text.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file = "dbinfo.jsp" %>
<HTML>
<%
		String id = (String)session.getAttribute("G_ADMIN_ID");
		if (id == null)	
		{
			out.print("<script type=text/javascript>");
			out.print("alert('관리자 로그인을 하시기 바랍니다.!!!');");
			out.print("location.href = 'admin_index.jsp';");
			out.print("</script>");
		}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>관리자 상품리스트</title>
<link href="all.css" rel="stylesheet" type="text/css" />
</head>

<BODY>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top"><table width="815" border="0" cellspacing="0" cellpadding="0">
			<%@ include file = "admin_top.jsp" %>
      <tr>
        <td height="80" background="icons/sub_bg.jpg">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
				<table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="547" height="45" align="left" class="new_tit">상품리스트</td>
          </tr>
          <tr>
            <td colspan="2" align="left" valign="top">
						<table width="100%" border="0" cellspacing="1" cellpadding="7" bgcolor="#D7D7D7">
              <tr>
                <td width="09%" align="center" bgcolor="#EEEEEE">대분류</td>
                <td width="12%" align="center" bgcolor="#EEEEEE">중분류</td>
                <td width="10%" align="center" bgcolor="#EEEEEE">상품코드</td>
                <td width="20%" align="center" bgcolor="#EEEEEE">상품명</td>
                <td width="10%" align="center" bgcolor="#EEEEEE">단가</td>
                <td width="10%" align="center" bgcolor="#EEEEEE">베스트</td>
                <td width="10%" align="center" bgcolor="#EEEEEE">등록일</td>
              </tr> 
				<%
							String strPageNum = request.getParameter("PageNum"); // 선택된 페이지 번호 참조
							if (strPageNum == null) {
								strPageNum = "1";
							}

							int currentPage = Integer.parseInt(strPageNum);			// 현재 페이지
							int pageSize=5;

							ResultSet rs = null, rs2 = null;
								
							Statement stmt  = con.createStatement();

							String SQL = "select count(*) from goodsinfo a inner join category2 b on a.cat1cd = b.cat1cd and a.cat2cd = b.cat2cd inner join category1 c on b.cat1cd = c.cat1cd  ";
							rs2 = stmt.executeQuery(SQL);

							int totalRecords	= 0;			// ResultSet 객체 내의 레코드 수를 저장하기 위한 변수 
							if (rs2.next() == false){		// 만약 테이블에 아무것도 없다면
							%>
              <tr>
								<TD colspan=7><center>등록된 상품이 없습니다</center></TD>      
              </tr>
							<% 
							}
							else
							{	
								totalRecords = rs2.getInt(1); 

								SQL = "select cat1nm, cat2nm, goodscd, goodsnm, unitprice, best_yn, convert(regdtm, char(10)) as regdtm "
									+" from goodsinfo a inner join category2 b on a.cat1cd = b.cat1cd and a.cat2cd = b.cat2cd "
									+" inner join category1 c on b.cat1cd = c.cat1cd "
									+" where goodscd not in (select * from ((select goodscd from goodsinfo a inner join "
									+" category2 b on a.cat1cd = b.cat1cd and a.cat2cd = b.cat2cd inner join category1 c on b.cat1cd = c.cat1cd "
									+" order by goodscd LIMIT "+((currentPage -1)*pageSize) + " ) as temp)) order by goodscd LIMIT "+pageSize;

								
// 								SQL =  "select cat1nm, cat2nm, goodscd, goodsnm, unitprice, best_yn, convert(regdtm,char(10)) ";
// 								SQL = SQL  + " from goodsinfo a inner join category2 b on a.cat1cd = b.cat1cd and a.cat2cd = b.cat2cd "; 
// 								SQL = SQL  + " inner join category1 c on b.cat1cd = c.cat1cd limit "+ pageSize ; 
// 								SQL = SQL  + " where goodscd not in (select ";
// 								SQL = SQL  + " goodscd from goodsinfo a inner join category2 b on a.cat1cd = b.cat1cd and a.cat2cd = b.cat2cd ";
// 								SQL = SQL  + " inner join category1 c on b.cat1cd = c.cat1cd  order by goodscd limit " + (currentPage - 1) * pageSize + ") ";
// 								SQL = SQL  + " order by goodscd ";
								
								rs = stmt.executeQuery(SQL);			// 현재 페이지에 출력할 상품만 select

								int pageSize_temp = pageSize;			// 현재 표시될 라인을 하나씩 줄임

								while(rs.next() && pageSize_temp > 0){

									String cat1nm			= rs.getString("cat1nm");
									String cat2nm			= rs.getString("cat2nm");
									String goodscd		= rs.getString("goodscd");
									String goodsnm		= rs.getString("goodsnm");

									int unitprice			= rs.getInt("unitprice");
									String best_yn		= rs.getString("best_yn");
									String regdtm			= rs.getString("regdtm");

								%>
              <tr>
								<td align="center" bgcolor="#FFFFFF"><%= cat1nm		%></td>
								<td align="center" bgcolor="#FFFFFF"><%= cat2nm		%></td>
								<td align="center" bgcolor="#FFFFFF"><a href="goodsinfo_update.jsp?pgoodscd=<%= goodscd %>"><%= goodscd %></a></td>
								<td align="center" bgcolor="#FFFFFF"><%= goodsnm		%></td>
								<td align="center" bgcolor="#FFFFFF">
										<% 
												DecimalFormat df = new DecimalFormat("###,###,##0"); 
												out.println(df.format(unitprice));
										%>
								</td>
								<td align="center" bgcolor="#FFFFFF"><%= best_yn		%></td>
								<td align="center" bgcolor="#FFFFFF"><%= regdtm		%></td>
              </tr>
								<%		
									pageSize_temp = pageSize_temp - 1;      // 현재 표시될 라인을 하나씩 줄임
								}
							}
							%>
              <tr>
								<td colspan = 7 align="center" bgcolor="#EEEEEE">

							<%
								// 총 페이지 수 계산
								int intTotPages	= 0;
								int intR		= totalRecords % pageSize;
								if	(intR == 0) {
									intTotPages = totalRecords / pageSize;
								}
								else
								{
									intTotPages = totalRecords / pageSize + 1;          // 나머지가 0 보다 크면 총 페이지수는 몫 + 1
								}

								int intGrpSize  = 10;									// 그룹 당 페이지 수 설정                   
								int currentGrp  = 0;									// 현 그룹 No.

								intR						= currentPage % intGrpSize;
								if	(intR == 0) {
									currentGrp		= currentPage / intGrpSize;
								}
								else
								{
									currentGrp	= currentPage / intGrpSize + 1;
								}

								int intGrpStartPage	= (currentGrp   - 1) * intGrpSize + 1;	// 현 그룹 시작 페이지
								int intGrpEndPage		=  currentGrp * intGrpSize;							// 현 그룹   끝 페이지
								if (intGrpEndPage > intTotPages){
									intGrpEndPage			= intTotPages;
								}
								if (currentGrp > 1){
							%>
								 [<A href="goodslist.jsp?PageNum=<%= intGrpStartPage - 1 %>">이전</A>]
							<%
								}

								int	intGrpPageCount		= intGrpSize;								// 그룹 당 페이지 수    
								int intIndex					= intGrpStartPage;					// 현 그룹 시작 페이지

								while (intGrpPageCount > 0 && intIndex <= intGrpEndPage){
							%>
									[<A href="goodslist.jsp?PageNum=<%= intIndex %>"><%= intIndex %></A>] &nbsp; 
							<%
									intIndex = intIndex + 1;
									intGrpPageCount    = intGrpPageCount    - 1;
								}

								if (intIndex <= intTotPages){
							%>
									[<A href="goodslist.jsp?PageNum=<%= intIndex %>">다음</A>]
							<%
								}
							%>
								</td>
							</tr>
              <tr>
								<td colspan = 7 align="center" bgcolor="#FFFFFF"><a href="goodsinfo_insert1.jsp">신규등록</a></td>
							</tr>
						</table>
				</table>
        </td>
     </tr>
  </tr>
</table >
<%
if (stmt  != null) stmt.close();
if (rs    != null) rs.close();
if (rs2   != null) rs2.close();
if (con   != null) con.close();
%>
</BODY>
</html>