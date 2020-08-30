<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<%
		if(request.getParameter("pwd").equals(request.getParameter("chkPwd")) == false){
	%>		
			패스워드가 일치 하지 않습니다.<br/>
			<%@ include file = "join.jsp"%>
	<% 		
		}else{
			response.sendRedirect("MemberComplete.html");
		}
		session.setAttribute("id", request.getParameter("id"));
		session.setAttribute("name", request.getParameter("name"));
		session.setAttribute("year", request.getParameter("year"));
		session.setAttribute("month", request.getParameter("month"));
		session.setAttribute("day", request.getParameter("day"));
		session.setAttribute("gender", request.getParameter("gender"));
		session.setAttribute("phone", request.getParameter("phone"));
		session.setAttribute("email", request.getParameter("email"));
	%>
	
</body>
</html>