<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>   
<%@ page import = "com.myProject.pjt.*" %>
<jsp:useBean id = "dto" class = "com.myProject.pjt.memberDto"/>
<jsp:setProperty name="dto" property="*"/>    

	<%
		memberDao dao = new memberDao();
		if(request.getParameter("pwd").equals(request.getParameter("chkPwd")) == false){
	%>		
			패스워드가 일치 하지 않습니다.<br/>
			<%@ include file = "join.jsp"%>
	<% 		
		}else{
// 			dto.setjDate(new Timestamp(System.currentTimeMillis()));
			dao.insertMember(dto);
	%> 
			<h3>회원가입이 완료되었습니다.</h3><br/>
			다시 로그인해주세요.<br/>
			<a href = "http://localhost:8090/MyPostProject/login.jsp">로그인 화면으로</a>
	
	<%
			
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
	