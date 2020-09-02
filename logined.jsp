<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>환영합니다.</title>
</head>
<body>
	<h2><%=request.getParameter("id") %>님 로그인 되셨습니다.</h2><br/>
	<a href = "logout.jsp">로그아웃</a><br/>
	<a href = "board.jsp">게시판</a><br/>
</body>
</html>