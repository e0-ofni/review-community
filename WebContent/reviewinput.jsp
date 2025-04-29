<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDB"%>
<%@ page import="review.ReviewEntity"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Date" %>  
<%@ page import="java.text.SimpleDateFormat" %>

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
		script.println("alert('먼저 로그인을 해주세요!')");
		script.println("location.href = 'login.jsp");
		script.println("</script>");
		script.close();
		return;
	}

	String menuName = null;
	String orderData = null;
	String whereOrder = null;
	String todayDate = null;
	String reviewTitle = null;
	String reviewContent = null;
	String totalScore = null;
	String delScore = null;
	String deliveryScore = null;
	String serviceScore = null;
	String packingScore = null;
	String chickenImage = null;
	String billImage = null;
	double totalf=0;
	String uploadDir ="C://Users/JINYOUNG/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team/uploadImage";

	//uploadDir = uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"team/WebContent/uploadImage";

	 System.out.println("절대경로 : " + uploadDir + "<br/>"); 
	 int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, encoding, new DefaultFileRenamePolicy());
		chickenImage = multipartRequest.getFilesystemName("chickenImage");
		billImage = multipartRequest.getFilesystemName("billImage");
		
	
	if(multipartRequest.getParameter("menuName")!=null){
		menuName = multipartRequest.getParameter("menuName");
	}
	if(multipartRequest.getParameter("orderData")!=null){
		orderData = multipartRequest.getParameter("orderData");
	}
	if(multipartRequest.getParameter("whereOrder")!=null){
		whereOrder = multipartRequest.getParameter("whereOrder");
	}
	
//	if(multipartRequest.getParameter("todayDate")!=null){
//		todayDate = multipartRequest.getParameter("todayDate");
//	}
	if(multipartRequest.getParameter("reviewTitle")!=null){
		reviewTitle = multipartRequest.getParameter("reviewTitle");
	}
	if(multipartRequest.getParameter("reviewContent")!=null){
		reviewContent = multipartRequest.getParameter("reviewContent");
	}

	if(multipartRequest.getParameter("delScore")!=null){
		delScore = multipartRequest.getParameter("delScore");
	}
	if(multipartRequest.getParameter("deliveryScore")!=null){
		deliveryScore = multipartRequest.getParameter("deliveryScore");
	}
	if(multipartRequest.getParameter("serviceScore")!=null){
		serviceScore = multipartRequest.getParameter("serviceScore");
	}
	if(multipartRequest.getParameter("packingScore")!=null){
		packingScore = multipartRequest.getParameter("packingScore");
	}
	if(multipartRequest.getParameter("totalScore")!=null){
		totalScore = multipartRequest.getParameter("totalScore");
	}
	if(multipartRequest.getParameter("chickenImage")!=null){
		chickenImage = multipartRequest.getParameter("chickenImage");
	}
	if(multipartRequest.getParameter("billImage")!=null){
		billImage = multipartRequest.getParameter("billImage");
	}
	
	totalf = (Double.parseDouble(delScore)+Double.parseDouble(deliveryScore)
	+Double.parseDouble(serviceScore)+Double.parseDouble(packingScore))/4;
	totalScore = String.format("%.2f",totalf);
	todayDate = sf.format(today);
	
	if(menuName == null || orderData == null || whereOrder == null
			|| reviewTitle==null || reviewContent==null
			|| delScore == null || deliveryScore==null || serviceScore==null
			|| packingScore==null || reviewTitle.equals("")||reviewContent.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('전부 입력해주십시오')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	ReviewDB reviewDB = new ReviewDB();
	int result =reviewDB.write(new ReviewEntity(0, userID, menuName,orderData
			,whereOrder,todayDate,reviewTitle,reviewContent,
			totalScore,delScore,deliveryScore,serviceScore,packingScore,chickenImage,billImage,0));
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('등록 실패')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('등록 성공')");
		script.println("location.href = 'ReviewPage2.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>