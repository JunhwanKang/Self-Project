<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/jspbook?characterEncoding=UTF-8&serverTimezone=UTC",
"jspbook",
"1234"
);
	
%>