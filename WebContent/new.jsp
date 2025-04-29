<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
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
<title>회원가입</title>
</head>
<body>
	<h2 style="text-align: center;">🍗천안 BHC 치킨 리뷰 커뮤니티🍗</h2>
	<hr>
	<section style="max-width: 560px; margin: 0 auto;">
		<form method="post" action="logininput.jsp">

			<h3 style="text-align: center;">회원가입</h3>
			<br> <label>아이디</label><br>
			<input type="text" class="from-control" name="userID">

			<br> <br> <label>비밀번호</label><br>
			<input type="password" class="from-control" name="userPassword">

			<br> <br> <label>이메일</label><br>
			<input type="email" class="from-control" name="userEmail">

			<br> <label>거주지역</label><br>
			<input type="text" class="from-control" placeholder="동으로 입력해주세요"
				name="userAddress"
			>

			<br>
			<input type="submit" id="btn" class="btn btn-primary form-control"
				value="회원가입"
			>
			<input type="button" id="btn" class="btn btn-primary form-control"
				value="메인화면으로 돌아가기" id="btn" onclick="location='ReviewPage2.jsp'"
			>
		</form>
	</section>
</body>
</html>