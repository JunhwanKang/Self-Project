<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link href="all.css" rel="stylesheet">
</head>
	<%
		String id=(String)session.getAttribute("G_ADMIN_ID");
		if(id != null)
			response.sendRedirect("admin_index.jsp");

	%>
	<script>
		function valid_check(){
			if(document.frm1.userid.value ==""){
				alert("아이디를 입력하여 주세요.");
				document.frm1.userid.focus();
				return false;
			}
			if(document.frm1.passwd.value ==""){
				alert("비밀번호를 입력하여 주세요.");
				document.frm1.passwd.focus();
				return false;
			}
			document.frm1.submit();
		}
	</script>
<body>
	<form name="frm1" action="admin_login.jsp" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center" valign="top">
				<table width="815" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="80" background="icons/sub_bg.jpg">&nbsp;</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="800" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="574" height="45"	align="center" class="new_tit">관리자 로그인</td>
								</tr>
								<tr>
									<td align="center">
										<table width="100%" border="0" cellspacing="1" cellpadding="7" bgcolor="#D7D7D7">
											<tr>
												<td width="24%" align="left" bgcolor="#EEEEEE">아이디</td>
												<td width="76%" align="left" bgcolor="#FFFFFF">
													<input type="text" size="15" maxlength="10" name="userid">
												</td>
											</tr>
											<tr>		
												<td width="24%" align="left" bgcolor="#EEEEEE">비밀번호</td>
												<td width="76%" align="left" bgcolor="#FFFFFF">
													<input type="password" size="15" maxlength="10" name="passwd">
												</td>
											</tr>	
											<tr>
												<td colspan=2 align="center" bgcolor="#FFFFFF">
													<input type="button" value="로그인" onclick="valid_check()">
												</td>
											</tr>	
										</table>
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
</html>