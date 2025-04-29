<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="usr.userDB"%>
<%@ page import="review.ReviewAction"%>
<%@ page import="recommand.RecommandEntity"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String reviewID=null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('리뷰를 삭제하려면 로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		
	}
	if(request.getParameter("reviewID")!=null){
		reviewID = request.getParameter("reviewID");
	}
	ReviewAction review = new ReviewAction();
	if(userID.equals(review.getUserID(reviewID)) || userID.equals("manager")){
		int result = new ReviewAction().delete(reviewID);
		if(result==1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제가 완료되었습니다.')");
			script.println("location.href = 'ReviewPage2.jsp'");
			script.println("</script>");
			script.close();
			return;
		} else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");
			script.println("location.href = 'ReviewPage2.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
	}
	else{
		System.out.println("오류");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓴 사람만 삭제 가능')");
		script.println("location.href = 'ReviewPage2.jsp'");
		script.println("</script>");
		script.close();
	}
	
%>
