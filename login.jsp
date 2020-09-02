<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
</head>
<body>
	<form action = "logined.jsp" method = "post">
		<table border = "1">
			<tr>
				<td align = "center">아이디</td>
				<td><input type = "text" name = "id"></td>
			</tr>
			<tr>
				<td align = "center">비밀번호</td>
				<td><input type = "password" name = "pw"></td>
			</tr>
			<tr>
				<td colspan = "2" align = "right"><input type = "submit" value = "로그인"></td>
			</tr>
		</table>
		<a href = "http://localhost:8090/MyPostProject/join.jsp">회원가입</a>
	</form>
</body>
</html>