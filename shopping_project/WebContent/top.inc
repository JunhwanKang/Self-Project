<%@ page contextType="text/html; charset=UTF-8" language="java" %>
<tr>
	<td height="67"><table width="815" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="223" height="67" rowspan="2" align="center">
			<a href="index.jsp">
			<img src="icons/logo.gif" width="223" height="67" border="0"/>
			</a>
		</td>
		<td width="592" height="30" align="right">
		
<%
	String id = (String)session.getAttribute("G_ID");
	String nm = (String)session.getAttribute("G_NM");

	if(id==null){
%>
	<a href="#">ȸ������</a> | <a href="login.jsp">�α���</a>
<%
	}
	else {
%>
	<a href="#">ȸ�� ��������</a> | <%=nm%>�� ȯ���մϴ�. | <a href="logout.jsp">�α׾ƿ�</a>
<%
	}
%>
	| <a href="#">��ٱ���</a> | <a href="#">�ֹ������ȸ</a> | <a href="#">����������</a></td>
	</tr>
	<tr>
		<td>
			<ul class="ul">
				<li class="list"> | <a href="goodsdisplay.jsp?pcat1=B" class="navi">BOTTOM</a></li>
				<li class="list"> | <a href="goodsdisplay.jsp?pcat1=O" class="navi">OUTER</a></li>		
				<li class="list"> | <a href="goodsdisplay.jsp?pcat1=T" class="navi">TOP</a></li>
				<li class="list"> | <a href="goodsdisplay.jsp?pcat1=T" class="navi">������������</a></li>
		</td>
	</tr>
</table></td>
</tr>