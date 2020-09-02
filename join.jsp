 <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#days{
	width: 20%;
}
#gen{
	width: 100%;
}

tr{
	height: 35px;
}

</style>
<title>회원가입</title>
</head>
<body>
	
	<%
	
		Object id = session.getAttribute("id");
		Object name = session.getAttribute("name");
		Object year = session.getAttribute("year");
		Object phone = session.getAttribute("phone");
		Object email = session.getAttribute("email");
	%>
	
	<h2>회원가입을 해주세요.</h2>
	<form action = "joinChk.jsp" method = "post">
		<table>
			<tr>
				<td align = "center">아이디</td>
				<td><input type = "text" name  = "id" value = <%=id %> required></td>
			</tr>
			<tr>
				<td align = "center">비밀번호</td>
				<td><input type = "password" name  = "pwd" required></td>
			</tr>
			<tr>
				<td align = "center">비밀번호 재확인</td>
				<td><input type = "password" name  = "chkPwd" required></td>
			</tr>			
			<tr>
				<td align = "center">이름</td>
				<td><input type = "text" name  = "name"  value = <%=name %> required></td>
			</tr>
			<tr>
				<td align = "center">생년월일</td>
				<td><input type = "text" name  = "year" placeholder = "년(4자)"  value = <%=year %> required id = "years"></td>
				<td><select name = "month">
						<option>월</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select></td>	
				<td><input type = "text" name  = "day" placeholder = "일" required id = "days"></td>
			</tr>	
			<tr>
				<td align = "center">성별</td>
				<td><select name = "gender" id = "gen">
					<option>성별</option>
					<option>남</option>
					<option>여</option>
				</select></td>
			</tr>
			<tr>
				<td align = "center">휴대전화</td>
				<td><input type = "text" name = "phone" value = <%=phone %> required></td>
			</tr>
			<tr>
				<td align = "center">E-Mail</td>
				<td><input type = "text" name = "email" value = <%=email %> required></td>
			</tr>	
			<tr>
				<td colspan = "2" align = "center"><input type = "submit" value = "가입하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>