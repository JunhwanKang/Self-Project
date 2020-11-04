<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록(1)</title>
<link href="all.css" rel="stylesheet">
</head>
<%
	String id = (String)session.getAttribute("G_ADMIN_ID");
	if(id==null){
		out.print("<script>");
		out.print("alert('관리자 로그인을 하시기 바랍니다.')");
		out.print("location.href='admin_index.jsp';");
		out.print("</script>");
	}
%>
<script>
	function valid_check(){
		if(document.frm1.catg1cd.value==""){
			alert("대분류를 선택하여 주시기 바랍니다.");
			document.frm1.catg1cd.focus();
			return false;
		}
		if(document.frm1.catg2cd.value==""){
			alert("중분류를 선택하여 주시기 바랍니다.");
			document.frm1.catg2cd.focus();
			return false;
		}
		document.frm1.submit();
	}
	
	function KeyNumber(){
		var event_key = event.keyCode;
		
		if((event_key<48 || event_key>57)&&(event_key !=8 && event_key !=46)){
			event.returnValue=false;
		}
	}
	
	function catg1cd_Change(){
		var x = document.frm1.catg1cd.options.selectedIndex;
		var catg1size = document.frm1.catg1cd.options.length;
		var catg2G = new Array(catg1size);
		
		for(i=0; i<catg1size; i++)
			catg2G[i] = new Array();
		
		catg2G[0][0] = new Option("대분류를 먼저 선택하세요.","");
		catg2G[1][0] = new Option("==중분류를 선택하세요==","");
		catg2G[1][1] = new Option("하프팬츠",     "H");
		catg2G[1][2] = new Option("팬츠",        "P");
		
		catg2G[2][0] = new Option("==중분류를 선택하세요==","");
		catg2G[2][1] = new Option("코트",        "C");
		catg2G[2][2] = new Option("가디건",       "G");
		catg2G[2][3] = new Option("점퍼",        "J");
		catg2G[2][4] = new Option("자켓",        "K");
		
		catg2G[3][0] = new Option("==중분류를 선택하세요==","");
		catg2G[3][1] = new Option("반팔",        "B");
		catg2G[3][2] = new Option("후드/터틀",    "H");
		catg2G[3][3] = new Option("니트",        "N");
		catg2G[3][4] = new Option("브이넥",       "V");
		temp = document.frm1.catg2cd;
		for(m=temp.options.length-1; m>0; m--){
			temp.options[m]=null;
		}
		for(i=0; i<catg2G[x].length; i++){
			temp.options[i] = new Option(catg2G[x][i].text, catg2G[x][i].value);
		}
		temp.options[0].selected = true;
	}
</script>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" valign="top">
			<table width="815" border="0" cellspacing="0" cellpadding="0">
				<%@include file= "admin_top.jsp" %>
				<tr>
					<td height="80" background="icons/sub_bg.jpg">&nbsp;</td>
				</tr>
				<tr>
					<td align="center" valign="top">
					<table width="800" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="547" height="45" align="left" class="new_tit">상품등록</td>
						</tr>
						<tr>
						<form name="frm1" action="goodsinfo_insert1_ok.jsp" method="post" entype="multipart/form-data">
							<td align="center">
								<table width="100%" border="0" cellspacing="1" cellpadding="7" bgcolor="#D7D7D7">
									<tr>
										<td width="24%" align="left" bgcolor="#EEEEEE">대분류</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											<select name="catg1cd" onChange="catg1cd_Change();">
												<option value="">==대분류를 선택하세요==</option>
												<option value="B">BOTTOM</option>
												<option value="O">OUTER</option>
												<option value="T">TOP</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width="24%" align="left" bgcolor="#EEEEEE">중분류</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											<select name="catg2cd">
											</select>
										</td>
									</tr>
									<tr>
										<td width="24%" align="left" bgcolor="#EEEEEE">상품명</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">	
											<input type="text" size="30" maxlength="50" name="goodsnm">
										</td>
									</tr>
									<tr>
										<td width="24%" align="left" bgcolor="#EEEEEE">판매단가</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">		
											<input type="text" size="10" maxlength="7" name="unitprice" onKeyDown="KeyNumber()">
										</td>
									</tr>
									<tr>
										<td width="24%" align="left" bgcolor="#EEEEEE">베스트상품여부</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">	
											<input type="checkbox" name="best_yn">
										</td>
									</tr>
									<tr>
										<td width="24%" align="left" bgcolor="#EEEEEE">이미지</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">		
											<input type="file" name="goodsimg1" size="50">
										</td>
									<tr>
										<td colspan="2" align="center" bgcolor="#FFFFFF">
											<input type="button" value="등록" onclick="valid_check()">
										</td>
									</tr>
								</table>
							</td>
						</form>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
		</tr>
	</table>
</body>
</html>