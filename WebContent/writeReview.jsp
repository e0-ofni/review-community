<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<style>
h3 {
	margin-bottom: 15px;
}

textarea {
	width: 400px;
	height: 300px;
	resize: none; /* 크기고정 */
	margin-top: 5px;
	/*   resize: horizontal; // 가로크기만 조절가능 
	resize: vertical;  세로크기만 조절가능  */
}
</style>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<%
		Date today = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
		request.setCharacterEncoding("UTF-8");
		String userID2 = null;
		if (session.getAttribute("userID") != null) {
			userID2 = (String) session.getAttribute("userID");
		}
	%>
	<h3 style="text-align: center;">리뷰작성하기</h3>

	<form method="post" action="reviewinput.jsp" enctype="multipart/form-data">
		<div class="form-row">

			<label>주문한 메뉴 : </label>
			<input type="text" name="menuName" class=from-control maxlength="20">
			<label>아이디 : </label>
			<%=userID2%>
			<br> <label>주문한 날짜 : </label>
			<input type="text" name="orderData" class=from-control maxlength="20">
			<label>주문한 지점 : </label>
			<select name="whereOrder">
				<option value="청수점" selected>청수점</option>
				<option value="불당점" selected>불당점</option>
				<option value="두정점" selected>두정점</option>
				<option value="안서점" selected>안서점</option>
				<option value="신방행복점" selected>신방행복점</option>
				<option value="청수점" selected>아산점</option>
				<option value="불당점" selected>성환점</option>
			</select>
			<br> <label>오늘 날짜 : </label>
			<%=sf.format(today)%>
			<br> <label>제목 : </label>
			<input type="text" name="reviewTitle" class=from-control maxlength="50">
			<br> <label>내용</label>
			<textarea name="reviewContent" class=from-control maxlength="2048"></textarea>
			<br> <label>맛</label>

			<select name="delScore">
				<option value="5" selected>5점</option>
				<option value="4" selected>4점</option>
				<option value="3" selected>3점</option>
				<option value="2" selected>2점</option>
				<option value="1" selected>1점</option>
			</select>
			<label>배달</label>

			<select name="deliveryScore">
				<option value="5" selected>5점</option>
				<option value="4" selected>4점</option>
				<option value="3" selected>3점</option>
				<option value="2" selected>2점</option>
				<option value="1" selected>1점</option>
			</select>
			<label>서비스</label>

			<select name="serviceScore">
				<option value="5" selected>5점</option>
				<option value="4" selected>4점</option>
				<option value="3" selected>3점</option>
				<option value="2" selected>2점</option>
				<option value="1" selected>1점</option>
			</select>
			<label>포장</label>

			<select name="packingScore">
				<option value="5" selected>5점</option>
				<option value="4" selected>4점</option>
				<option value="3" selected>3점</option>
				<option value="2" selected>2점</option>
				<option value="1" selected>1점</option>
			</select>

			<br>
			<label>음식 사진</label><br>
			<input type="file" name="chickenImage">
			<br> <label>영수증 사진</label><br>
			<input type="file" name="billImage">
			<br>

			<button type="submit">등록하기</button>

		</div>

	</form>


</body>
</html>