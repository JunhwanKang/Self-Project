<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ���� ����</title>
</head>
<body>
	<form action = "BoardWrite.bbs" method = "post">
		<table border = "1">
			<tr>
				<td>�� ����</td>
				<td colspan="3"><input type="text" name="subject" maxlength="50" size="50"></td>
			</tr>
			<tr>
				<td>�ۼ���</td>
				<td><input type="text" name="name" maxlength="20" size="20"></td>
				<td>��й�ȣ</td>
				<td><input type="password" name="password"	maxlength="20" size="12"></td>
			</tr>	
			<tr>
				<td>����</td>
				<td colspan="3"><textarea name="content" rows="8" cols="45"></textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
					<input type="submit" value="�� �ø���">
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>