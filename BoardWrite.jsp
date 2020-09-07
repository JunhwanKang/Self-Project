<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 새글 쓰기</title>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
</head>
<body>
	<form action = "BoardWrite.bbs" method = "post">
		<table border = "1">
			<tr>
				<td>글 제목</td>
				<td colspan="3"><input type="text" name="subject" maxlength="50" size="50"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" maxlength="20" size="20"></td>
				<td>비밀번호</td>
				<td><input type="password" name="password"	maxlength="20" size="12"></td>
			</tr>	
			<tr>
				<td>본문</td>
				<td colspan="3"><textarea name="content" rows="8" cols="45"></textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" value="글 올리기">
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>