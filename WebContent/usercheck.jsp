<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%@ page import="usr.userDB"%>
<%@ page import="usr.userEntity"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>

<%
	ArrayList<userEntity> users = new ArrayList<userEntity>();
	users = new userDB().getMemberlist();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table {
	border: 2px solid #67c6ea;
	width: 100%;
	border-collapse: collapse;
}

th {
	border: 2px solid #67c6ea;
	text-align: center;
	padding: 5px;
	background-color: #67c6ea;
	color: #FFFFFF;
	font-size: 20px;
}

td {
	border: 2px solid #67c6ea;
	text-align: center;
	padding: 5px;
}
</style>
</head>
<body>
	<h2>회원관리</h2>
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>주소</th>
			<th>이메일</th>
			<th>회원삭제</th>
		</tr>
		<%
			for (int i = 0; i < users.size(); i++) {
				userEntity review = users.get(i);
		%>
		<tr>
			<td><%=review.getUserID()%></td>
			<td><%=review.getUserPassword()%></td>
			<td><%=review.getUserAddress()%></td>
			<td><%=review.getUserEmail()%></td>
			<td>
				<a onclick="return confirm('삭제하시겠습니까?')"
					href="./deleteid.jsp?userID=<%=review.getUserID()%>"
				>삭제</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>


</body>
</html>