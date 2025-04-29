<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인</title>
<style>
input {
	all: unset;
	border: 1px solid #67c6ea;
	font-size: 18px;
	margin-bottom: 10px;
}

#btn {
	text-align: center;
	width: 550px;
	background-color: #a8e7ff;
	color: black;
}
</style>
</head>
<body>
	<hr>
	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 하였습니다.')");
			script.println("location.href = 'setReivew.jsp");
			script.println("</script>");
			script.close();
			return;
		}
	%>
	<section style="max-width: 560px; margin: 0 auto;">
		<form method="post" action="logincheck.jsp">
			<h2 style="text-align: center;">🍗천안 BHC 치킨 리뷰 커뮤니티🍗</h2>
			<hr>
			<h3 style="text-align: center;">로그인</h3>
			<div class="form-group">
				<label>아이디</label><br>
				<input type="text" class="from-control" placeholder="아이디" name="userID"
					maxlength="20"
				>
			</div>
			<div class="form-group">
				<label>비밀번호</label><br>
				<input type="password" class="from-control" placeholder="비밀번호"
					name="userPassword" maxlength="20"
				>

			</div>
			<input type="submit" id="btn" class="btn btn-primary form-control"
				value="로그인"
			>
			<br>
			<input type="button" id="btn" onclick="location='new.jsp'"
				class="btn btn-primary form-control" value="회원가입"
			>
			<br>
			<input type="button" id="btn" class="btn btn-primary form-control"
				value="메인화면으로 돌아가기" onclick="location='ReviewPage2.jsp'"
			>
			<br>
		</form>
	</section>

</body>
</html>