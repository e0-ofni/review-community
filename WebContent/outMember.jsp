<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="usr.userDB"%>
<%@ page import="java.io.PrintWriter"%>
 
 <%
    request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(request.getParameter("userID")!=null){
		userID = request.getParameter("userID");
	}
	userDB user = new userDB();
	
	int result = new userDB().delete(userID);
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('탈퇴되었습니다.')");
		session.invalidate();
		script.println("location.href = 'ReviewPage2.jsp'");
		script.println("</script>");
		script.close();
		return;
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("window.open('','_self').close();");
		script.println("</script>");
		script.close();
		
	}
	
	
	
%>
<p><%=userID %></p>
