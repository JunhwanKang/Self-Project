<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.board.model.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td colspan="4" align="right"><a href="BoardList.bbs">[�������]</a></td>
		</tr>
		<tr>
			<td>�� ����</td>
			<td colspan="3"><input type="text" name="subject" maxlength="50" size="50" value="${boardRead.subject}" disabled="disabled"></td>
		</tr>
		<tr>
			<td>�ۼ���</td>
			<td><input type="text" name="name" maxlength="20" size="20" value="${boardRead.name}" disabled="disabled"></td>
			<td>��ȸ��:${boardRead.readCnt},</td>
			<td>��ۼ�:${boardRead.childCnt}</td>
		</tr>
		<tr>
			<td>����</td>
			<td colspan="3"><textarea name="content" rows="8" cols="45" disabled="disabled">${boardRead.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<a href="boardUpdatePassword.bbs?num=${boardRead.num}">[����]</a>
				<a href="boardDeletePassword.bbs?num=${boardRead.num}">[����]</a>
				<a href="boardReplyForm.bbs?num=${boardRead.num}">[���]</a>
			</td>
		</tr>
	</table>
</body>
</html>