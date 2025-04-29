<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="usr.userDB"%>
<%@ page import="usr.userEntity"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword =null;
	String userEmail = null;
	String userAddress = null;
	if(request.getParameter("userID")!=null){
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPassword")!=null){
		userPassword = request.getParameter("userPassword");
	}
	if(request.getParameter("userEmail")!=null){
		userEmail = request.getParameter("userEmail");
	}
	if(request.getParameter("userAddress")!=null){
		userAddress = request.getParameter("userAddress");
	}
	if(userID == null || userPassword == null || userEmail == null|| userAddress == null
			||userID == "" || userPassword == "" || userEmail == ""|| userAddress == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('전부 입력해주십시오')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	userDB user = new userDB();
	int result =user.join(new userEntity(userID, userPassword,userEmail,userAddress));
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 되었습니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>