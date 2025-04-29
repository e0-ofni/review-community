<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date" %>  
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv = "Content-Type" content="width=device-width">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
<%

Date today = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
request.setCharacterEncoding("UTF-8");
String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('리뷰를 작성하려면 로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}%>
	<h3 style="text-align: center;">리뷰작성하기</h3>

	<form method="post" action="reviewinput.jsp" enctype="multipart/form-data">
		<div class="form-row">

			<label>주문한 메뉴 : </label>
			<input type="text" name="menuName" class=from-control maxlength="20">
			<label>아이디</label>
			<%=userID%>
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
			<br> <label>오늘 날짜 </label>
			<%=sf.format(today)%>
			<br> <label>제목 : </label>
			<input type="text" name="reviewTitle" class=from-control maxlength="50">
			<br> <label>내용 : </label>
			<textarea name="reviewContent" class=from-control maxlength="2048"
				style="heigth: 300px; weight: 180px;"
			></textarea>
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

			<label>포장</label> <label>음식 사진</label>
			<input type="file" name="chickenImage">
			<br> <label>영수증 사진</label>
			<input type="file" name="billImage">
			<br>

			<button type="submit">등록하기</button>

		</div>

	</form>


</body>
</html>