<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "com.myProject.pjt.*" %>
	<%
		memberDao dao = new memberDao();
	
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		out.print(id);
		out.print(pwd);
		if(dao.Check(id, pwd) == true){
			response.sendRedirect("logined.jsp");
		} else{
	%>
			<h2>아이디 비밀번호가 일치하지 않습니다.</h2>
			<h3>다시 로그인 해주세요</h3><hr/>
			<%@ include file = "login.jsp"%>
	<%	
		}
			
	
	%>
	