<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="review.ReviewDB"%>
<%@ page import="review.ReviewEntity"%>
<%@ page import="review.ReviewAction"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>천안 BHC 치킨 리뷰 커뮤니티</title>
<style>
html {
   padding: 0% 20%;
}
input { all: unset; border: 1px solid rgba(0, 0, 0, 0.5); font-size: 18px; margin-bottom: 10px; }
button { 
all: unset; 

border: 1px solid rgba(0, 0, 0, 0.5); 
margin-bottom: 10px; 
}
#inputsearch, #arr, #searchbtn{
   font-size: 20px;
}
#page{
 background-color: #fff0b8;
 padding: 10px 10px;
}
h2{
 text-align: center;}

header {
   padding: 20px 5px;
   background-color: #fff0b8;
}

header * {
   display: inline-block;
}

header h2 {
   font-weight: bold;
}

#sectionTitle {
   margin: 30px 0px;
}

.reviewModal, .writeReviewModal {
   display: none;
   width: 60%;
   padding: 20px 60px;
   background-color: #fefefe;
   border: 1px solid #fedd67;
   text-align: left;
}

.modal_close_btn {
   position: absolute;
   top: 10px;
   right: 10px;
}

.reviewSection {
   padding: 7px 7px;
   border: 2px solid #fedd67;
   box-shadow: 2px 2px 2px 2px #fff0b8;
      padding: 10px;
}

.reviewSection:hover {
   padding: 7px 7px;
   border: 2px solid #C4FDFF;
   box-shadow: 2px 2px 2px 2px #B2EBF4 ;
   box-sizing: content-box;
    height: 120px;
    padding: 20px;
   
}
</style>
<script> 
function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(255,240,184,0.6)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
 
};

function showPopup() { 
   window.open("usercheck.jsp", "a", "width=700, height=320, left=100, top=50,  scrollbars = yes"); 
   }
</script>
</head>
<body>
   <%
      int pageNumber = 0; 
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
      request.setCharacterEncoding("UTF-8");
      String arrangeType = "최신등록순";
      String search = "";
      if (request.getParameter("arrangeType") != null) {
         arrangeType = request.getParameter("arrangeType");
      }
      if (request.getParameter("search") != null) {
         search = request.getParameter("search");
      }
      if (request.getParameter("pageNumber") != null) {
         try{
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
         } catch(Exception e){
            System.out.println("검색페이지 오류");
         }
         
      }
   %>
   <header>
      <h2>🍗천안 BHC 치킨 리뷰 커뮤니티🍗</h2>
      <%
         if (userID == null) {
      %>
      <a href="login.jsp">로그인</a>
      <a href="new.jsp">회원가입</a>
      <%
         } else if(userID.equals("manager")){
      %>
      <a href="logout.jsp">로그아웃</a>
      <input type="button" value="회원관리" onclick="showPopup();" />
      <%
         } else {
      %>
      <a href="logout.jsp">로그아웃</a>
      <a onclick="return confirm('천안 bhc 리뷰 사이트를 탈퇴하시겠습니까?')" href="./outMember.jsp?userID=<%=userID%>">회원탈퇴</a>
      <%
         }
      %>
      <br>

   </header>
   <hr>

   <%
      if (userID != null && userID.equals("manager") == true) {
         ArrayList<ReviewEntity> reviewList = new ArrayList<ReviewEntity>();
         reviewList = new ReviewAction().getList();
         if (reviewList != null)
            for (int i = 0; i < reviewList.size(); i++) {
               ReviewEntity review = reviewList.get(i);
               if (i == 0) {
   %><span style="font-size: 20px; font-weight: bold;"><%=review.getReviewID()%>
   </span>
   <%
      } else {
                  ReviewEntity prereview = reviewList.get(i - 1);
                  if (review.getUserID().equals(prereview.getUserID()) == false) {
   %>
   <span style="font-size: 20px; font-weight: bold;"><%=review.getUserID()%>
   </span>
   <%
      }
               }
   %>

   <section  style="cursor:pointer" class="reviewSection" id="reviewSection<%=review.getReviewID()%>">
      <span style="font-weight: bold"><%=review.getReviewTitle()%></span>
      <%=review.getWhereOrder()%>
      <%=review.getMenuName()%>
      <span style="display: inline-block; float: right;">추천 수: <%=review.getLikeCount()%></span>
      <hr>
      맛:
      <%=review.getDelScore()%>
      배달:
      <%=review.getDeliveryScore()%>
      서비스:
      <%=review.getServiceScore()%>
      포장:
      <%=review.getPackingScore()%>
      <span style="display: inline-block; float: right;">총점: <%=review.getTotalScore()%></span>
      <br>
   </section>
   <section class="reviewModal" id="reviewModal<%=review.getReviewID()%>">
      <a class="modal_close_btn">닫기</a>
      <span style="font-weight: bold;"><%=review.getReviewTitle()%></span>
      <%=review.getWhereOrder()%>
      <%=review.getMenuName()%>
      <span style="display: inline-block; float: right;">추천 수: <%=review.getLikeCount()%>
         <a onclick="return confirm('추천하시겠습니까?')"
            href="./recommand.jsp?reviewID=<%=review.getReviewID()%>"
         >추천</a> <a onclick="return confirm('삭제하시겠습니까?')"
            href="./deleteAction.jsp?reviewID=<%=review.getReviewID()%>"
         >삭제</a></span>
      <hr>
      <img
         src="http://119.70.168.9:9928/team/uploadImage/<%=review.getChickenImage()%>"
         width=200 height=200
      /> 
      <img
         src='http://119.70.168.9:9928/team/uploadImage/<%=review.getBillImage()%>'
         width=200 height=200
      /><br>
      <%=review.getReviewContent()%>
      
      <hr>
      맛:
      <%=review.getDelScore()%>
      배달:
      <%=review.getDeliveryScore()%>
      서비스:
      <%=review.getServiceScore()%>
      포장:
      <%=review.getPackingScore()%>
      <span style="display: inline-block; float: right;">총점: <%=review.getTotalScore()%></span>
   </section>
   <br>
   <script>
   document.getElementById("reviewSection<%=review.getReviewID()%>").addEventListener('click', function() {
      // 모달창 띄우기
      modal("reviewModal<%=review.getReviewID()%>");
      });
   
   </script>
   <%
      }
      } else {
   %>
   <section id="sectionTitle">
      <form name="form1" action="./ReviewPage2.jsp" method="get">
         <select id ="arr" name="arrangeType"
            onchange="javascript:document.form1.submit();"
         >
            <option value="최신등록순"
               <%if (arrangeType.equals("최신등록순"))
               out.println("selected");%>
            >최신등록순</option>
            <option value="추천수순"
               <%if (arrangeType.equals("추천수순"))
               out.println("selected");%>
            >추천수순</option>
            <option value="랭킹순"
               <%if (arrangeType.equals("랭킹순"))
               out.println("selected");%>
            >랭킹순</option>
         </select>
         <input id="inputsearch" type="search" name="search" placeholder="내용을 입력하세요.">
         <button id="searchbtn" type="submit">검색</button>
      </form>
      <span style="display: block; float: right;">
         <button id="writeReview">리뷰남기기</button>
      </span>
   </section>
   <section class="writeReviewModal" id="writeReviewModal">
      <a class="modal_close_btn">닫기</a>
      <%@include file="./writeReview.jsp"%>
   </section>
   <script>
   document.getElementById('writeReview').addEventListener('click', function() {
   <%if (userID != null) {%>
            modal('writeReviewModal');<%} else {%>
            alert('리뷰를 작성하려면 로그인이 필요합니다.');
            location.href = 'login.jsp';
         <%}%>
   }
   );
   </script>
   <%
      ArrayList<ReviewEntity> reviewList = new ArrayList<ReviewEntity>();
         reviewList = new ReviewAction().getList(arrangeType, search, pageNumber);
         if (reviewList != null)
            for (int i = 0; i < reviewList.size(); i++) {
               if(i == 5)break;
               ReviewEntity review = reviewList.get(i);
   %>

   <section  style="cursor:pointer" class="reviewSection" id="reviewSection<%=review.getReviewID()%>">
      <span style="font-weight: bold; font-size:20px;"><%=review.getReviewTitle()%></span>
      <%=review.getWhereOrder()%>
      <%=review.getMenuName()%>
      <span style="display: inline-block; float: right;">추천 수: <%=review.getLikeCount()%></span>
      <hr>
      맛:
      <%=review.getDelScore()%>
      배달:
      <%=review.getDeliveryScore()%>
      서비스:
      <%=review.getServiceScore()%>
      포장:
      <%=review.getPackingScore()%>
      <span style="display: inline-block; float: right;">총점: <%=review.getTotalScore()%></span>
      <br>
   </section>
   <section class="reviewModal" id="reviewModal<%=review.getReviewID()%>">
      <a class="modal_close_btn">닫기</a>
      <span style="font-weight: bold;  font-size:30px;"><%=review.getReviewTitle()%></span>
      <%=review.getWhereOrder()%>
      <%=review.getMenuName()%>
      <span style="display: inline-block; float: right;">추천 수: <%=review.getLikeCount()%>
         <a onclick="return confirm('추천하시겠습니까?')"
            href="./recommand.jsp?reviewID=<%=review.getReviewID()%>"
         >추천</a> <a onclick="return confirm('삭제하시겠습니까?')"
            href="./deleteAction.jsp?reviewID=<%=review.getReviewID()%>"
         >삭제</a></span>
      <hr>
      <img
         src="http://119.70.168.9:9928/team/uploadImage/<%=review.getChickenImage()%>"
         width=200 height=200
      /> 
      <img
         src='http://119.70.168.9:9928/team/uploadImage/<%=review.getBillImage()%>'
         width=200 height=200
      />
      <br>
      <%=review.getReviewContent()%>
      <br>

      
      <hr>
      맛:
      <%=review.getDelScore()%>
      배달:
      <%=review.getDeliveryScore()%>
      서비스:
      <%=review.getServiceScore()%>
      포장:
      <%=review.getPackingScore()%>
      <span style="display: inline-block; float: right;">총점: <%=review.getTotalScore()%></span>
   </section>
   
   <br>
   <script>
   document.getElementById("reviewSection<%=review.getReviewID()%>").addEventListener('click', function() {
      // 모달창 띄우기
      modal("reviewModal<%=review.getReviewID()%>");
      });
   
   </script>
   
   <%
      } %>
      

      
      <%
         if(pageNumber <= 0){
      %>
         <a id="page" class = "page-link disabled">이전</a>
      <%
         }else {
      %>
         <a id="page" class = "page-link" href="./ReviewPage2.jsp?arrangeType=<%=URLEncoder.encode(arrangeType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>
			&pageNumber=<%=pageNumber - 1%>">이전</a>
      <%
         }

         if(reviewList.size() < 6){
      %>
         <a id="page" class = "page-link disabled">다음</a>
      <%
         }else {
      %>
         <a id="page" class = "page-link" href="./ReviewPage2.jsp?arrangeType=<%=URLEncoder.encode(arrangeType, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>
			&pageNumber=<%=pageNumber + 1%>">다음</a>
      <%
         }
      %>

   <% } %>   
   
   
   
</body>
</html>