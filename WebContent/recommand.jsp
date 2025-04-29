<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="usr.userDB"%>
<%@ page import="review.ReviewAction"%>
<%@ page import="recommand.RecommandEntity"%>
<%@ page import="recommand.RecommandDB"%>
<%@ page import="java.io.PrintWriter"%>
<%!
	public static String getCilentIP(HttpServletRequest request){
	String ip = request.getHeader("X-FORWARDED-FOR");
	if(ip==null || ip.length()==0){
		ip = request.getHeader("Proxy-Client-IP");
	}
	if(ip==null || ip.length()==0){
		ip = request.getHeader("WL-Proxy-Client-IP");
	}
	if(ip==null || ip.length()==0){
		ip = request.getRemoteAddr();
	}
	return ip;
}
%>
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
		script.println("alert('리뷰를 추천하려면 로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	if(request.getParameter("reviewID")!=null){
		reviewID = request.getParameter("reviewID");
	}
	ReviewAction review = new ReviewAction();
	RecommandDB recommand = new RecommandDB();
	int result = recommand.like(userID, reviewID,getCilentIP(request));
	if(result==1){
			result = review.like(reviewID);
			if(result==1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이 게시글을 추천하였습니다.')");
				script.println("location.href = 'ReviewPage2.jsp'");
				script.println("</script>");
				script.close();
				return;
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류')");
				script.println("location.href = 'ReviewPage2.jsp'");
				script.println("</script>");
				script.close();
				return;
			}
			
		} else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 추천하셨습니다')");
			script.println("location.href = 'ReviewPage2.jsp'");
			script.println("</script>");
			script.close();

		}
		
	%>
