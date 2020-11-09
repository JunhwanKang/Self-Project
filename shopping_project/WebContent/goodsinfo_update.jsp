<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbinfo.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="all.css" rel="stylesheet">
<title>상품정보변경</title>
</head>
	<%
		String id = (String)session.getAttribute("G_ADMIN_ID");
		if(id==null){
			out.print("<script>");
			out.print("alert('관리자 로그인을 하시기 바랍니다.');");
			out.print("location.href ='admin_index.jsp';");
			out.print("</script>");
		}
	%>
	<script>
		function valid_check(){
			if(document.frm1.goodsnm.value ==""){
				alert("상품명을 입력하여 주시기 바랍니다.");
				document.frm1.goodsnm.focus();
				return false;
			}
			document.frm1.action = "goodsinfo_update_ok.jsp";
			document.frm1.submit();
		}
		
		function KeyNumber(){
			var event_key = event.keyCode;
			
			if((event_key<48 || event_key>57) && (event_key != 8 && event_key != 46)){
				event.returnValue = false;
			}
		}
		function delete_check(){
			document.frm1.action = 
				"goodsinfo_delete_ok.jsp?pgoodscd = " + document.frm1.goodscd.value;
			document.frm1.submit();
		}
	</script>
	<%
		ResultSet rs = null, rs2=null, rs3=null;
		Statement stmt = con.createStatement();
		
		try{
			String pgoodscd = request.getParameter("pgoodscd");
			
			String strSQL = "select * from goodsinfo where goodscd = '" + pgoodscd + "'";
			rs = stmt.executeQuery(strSQL);
			
			if(rs.next()){
				String cat1cd = rs.getString("cat1cd");
				String cat2cd = rs.getString("cat2cd");
				String goodsnm = rs.getString("goodsnm");
				String best_yn = rs.getString("best_yn");
				String goodsimg1 = rs.getString("goodsimg1");
				String useflag = rs.getString("useflag");
				int unitprice = rs.getInt("unitprice");
	%>
<body>
	<form name="frm1" method="post" enctype=multipart.form-data">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" valign="top">
				<table width="815" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="547" height="45" align="left" class="new_tit">상품등록-정보변경</td>
				</tr>
				<tr>
					<td align="center">
						<table width="100%" border="0" cellspacing="1" cellpadding="7" bgcolor="#D7D7D7">
							<tr>
								<td width="24%" align="left" bgcolor="#EEEEEE">대분류</td>
								<td width="76%" align="left" bgcolor="#FFFFFF">
									<select name="cat1cd" disabled>
										<option value="">==대분류를 선택하세요==</option>
				<%
									strSQL = "select cat1cd, cat1nm from category1 order by cat1cd";
									rs2 = stmt.executeQuery(strSQL);
									
									while(rs2.next()){
										out.print("<option value=\"");
										out.print(rs2.getString("cat1cd"));
										out.print("\"");
										if(rs2.getString("cat1cd").equals(cat1cd))
											out.print("selected");
										out.print(">");
										out.print(rs2.getString("cat1nm"));
										out.println("</option>");
									}
				%>						
									</select>
								</td>
							</tr>
							<tr>
								<td width="24%" align="left" bgcolor="#EEEEEE">중분류</td>
								<td width="76%" align="left" bgcolor="#FFFFFF">
									<select name="cat2cd" disabled>
										<option value="">==중분류를 선택하세요==</option>
				<%
					if(cat1cd != null && cat1cd != ""){
						strSQL="select cat1cd, cat2cd,cat2nm from category2 where cat1cd= '" 
								+ cat1cd + "'order by cat2cd";
						rs3=stmt.executeQuery(strSQL);
				
						while(rs3.next()){
							out.print("<option value=\"");
							out.print(rs3.getString("cat2cd"));
							out.print("\"");
							if(rs3.getString("cat2cd").equals(cat2cd))
								out.print("selected");
							out.print(">");
							out.print(rs3.getString("cat2nm"));
							out.print("</option>");
						}
					}
				%>						
									</select>	
								</td>
							</tr>
							<tr>
								<td width="24%" align="left" bgcolor="#EEEEEE">상품코드</td>
								<td width="76%" align="left" bgcolor="#FFFFFF">
									<input type="text" size="10" maxlength="6" name="goodscd"
										value=<%=pgoodscd %> readonly>
								</td>
							</tr>			
							<tr>
								<td width="24%" align="left" bgcolor="#EEEEEE">상품명</td>
								<td width="76%" align="left" bgcolor="#FFFFFF">
									<input type="text" size="30" maxlength="50" name="goodsnm"
										value=<%=goodsnm %>>
								</td>
							</tr>	
							<tr>
								<td width="24%" align="left" bgcolor="#EEEEEE">판매단가</td>
								<td width="76%" align="left" bgcolor="#FFFFFF">
									<input type="text" size="10" maxlength="7" name="unitprice"
										value=<%=unitprice %> onKeyDown = "keyNumber()">
								</td>
							</tr>	
							<tr>
								<td width="24%" align="left" bgcolor="#EEEEEE">베스트상품여부</td>
								<td width="76%" align="left" bgcolor="#FFFFFF">
									<input type="checkbox" name="best_yn" 
							<%
								if(best_yn.equals("Y")) out.print("checked");	
							%>		
									value="Y">
								</td>
							</tr>	
							<tr>
								<td width="24%" align="left" bgcolor="#EEEEEE">변경전 이미지</td>
								<td width="76%" align="left" bgcolor="#FFFFFF">
									<img alt="이전 이미지" src="images/<%= goodsimg1 %>" height=200 width=200>
								</td>
							</tr>
							<tr>
								<td width="24%" align="left" bgcolor="#EEEEEE">변경후 이미지</td>
								<td width="76%" align="left" bgcolor="#FFFFFF">
									<input type="file" name="goodsimg1" size=50>
								</td>
							</tr>
							<tr>
								<td colspan=2 align="center" bgcolor="#FFFFFF">
									<input type="button" value="변경" onclick="valid_check()">
									<input type="button" value="삭제" onclick="delete_check()">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
<%
			}else
				out.print("등록된 상품정보가 없습니다.");
		}catch(SQLException e1){
			out.print(e1.getMessage());
		}catch(Exception e2){
			e2.printStackTrace();
		} finally{
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
			if(rs2 != null) rs2.close();
			if(rs3 != null) rs3.close();
			if(con != null) con.close();
		}
%>
</html>