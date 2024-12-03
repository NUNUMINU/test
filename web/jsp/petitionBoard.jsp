<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.Petition" %>
<%@page import="java.util.List"%>

<%request.setCharacterEncoding("utf-8"); %>
<%response.setCharacterEncoding("utf-8"); %>
<%
  List<Petition> petList = (List<Petition>)request.getAttribute("petList");
  String username = (String)session.getAttribute("username");
  String userid  = (String)session.getAttribute("userid");
%>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
  <meta name="theme-color" content="#ffffff">
  <meta name="description" content="동국대학교 청원">
  <meta property="og:type" content="website">
  <meta property="og:title" content="동국대학교 청원">
  <title>동국대학교 청원</title>
  <link rel="icon" href="/test/icon/favicon.ico">
  <link rel="stylesheet" href="/test/css/petitionBoard.css" type="text/css">
  <link rel="stylesheet" href="/test/css/navbar.css" type="text/css">
  <link rel="stylesheet" href="/test/css/footer.css" type="text/css">
  <script
          src="https://kit.fontawesome.com/6ffe1984d5.js"
          crossorigin="anonymous">
  </script>
  <script>
  	window.onload = function(){
	  const params = new URLSearchParams(window.location.search);
	  const selectedCate = params.get("category"); // 파라미터 값 가져오기
	  const selectedOrder = params.get("order"); // 파라미터 값 가져오기
	  if (selectedCate!=null) {
	    const selectElement = document.getElementById("category");
	    selectElement.value = selectedCate; // 초기값 설정
	  }else if(selectedOrder!=null){
		const selectElement = document.getElementById("order");
		selectElement.value = selectedOrder; // 초기값 설정
	  }
  	}
  </script>
</head>

<body>
<div class="wrapper">
  <nav class="navbar">
    <div class="navbar__logo">
      <a href="/test/IndexServlet"><img src="/test/icon/homeicon.png"></a>
    </div>

    <ul class="navbar__menu">
      <li><a href="/test/jsp/information.jsp">이용안내</a></li>
      <li><a href="/test/jsp/post.jsp">청원신청</a></li>
      <li><a href="/test/PetitionBoardServlet">청원목록</a></li>
      <li><a href="/test/AnsBoard">답변된청원</a></li>
    </ul>

    <div class="navbar__icon">
      <c:if test="${ username!=null}">
        <a title="로그아웃" href="/test/LogoutServlet"><i class="fa-solid fa-right-from-bracket"></i></a>
      </c:if>
      <c:if test="${ username==null}">
        <a title="로그인" href="/test/jsp/login.jsp"><i class="fa-solid fa-arrow-right-to-bracket"></i></a>
      </c:if>
    </div>

    <a href="#" class="navbar__toggleBtn">
      <i class="fa-solid fa-bars"></i>
    </a>
  </nav>

  <section class="board">
    <div class="content">
      <div class="title_area">
        <div class="petition_title"><span>등록된 청원</span></div>
        <div class="selects">
          <div class="select_wrap" name="standard">
            <select id='order' onchange="window.location.href='/test/PetitionBoardServlet?order=' + this.value">
              <option value="recent">최신순</option>
              <option value="rank">서명순</option>
            </select>
          </div>

          <div class="select_wrap" name="field" >
            <select id='category' onchange="window.location.href='/test/PetitionBoardServlet?category=' + this.value">
              <option value="전체">전체</option>
              <option value="학적">학적</option>
              <option value="시설운영">시설운영</option>
              <option value="입학/학사">입학/학사</option>
              <option value="장학/역량/봉사">장학/역량/봉사</option>
              <option value="교육">교육</option>
              <option value="연구">연구</option>
              <option value="기타">기타</option>
            </select>
          </div>
        </div>
      </div>

      <div class="petition_info">
        <div class="head_wrap">
          <div class="head_category">분류</div>
          <div class="head_subject">제목</div>
          <div class="head_date">청원 등록일</div>
          <div class="head_agreements">참여 인원</div>
        </div>
      </div>
      <ul class="petition_list">
        <c:forEach items="${petList }" var="pet" begin="0">
          <li>
            <div class="category">${pet.getCategory()}</div>
            <div class="subject"><a href="/test/ReadPet?id=${pet.getId()}">${pet.getTitle()}</a></div>
            <div class="date">${pet.getDate()}</div>
            <div class="agreements">${pet.getAgree()}</div>
          </li>
        </c:forEach>
      </ul>
    </div>
  </section>

  <footer>
    <ul class="footer_menu">
      <li><a href="https://www.dongguk.edu/page/534" target="_blank">개인정보처리방침</a></li>
      <li><a href="https://www.dongguk.edu/article/privacyNotice/list" target="_blank">개인정보내역</a></li>
      <li><a href="https://www.dongguk.edu/" target="_blank">동국대학교</a></li>
    </ul>
    <div class="footer_info">
      <address>
        서울캠퍼스 04620 서울특별시 중구 필동로 1길 30 동국대학교 본관 3층 홍보실 &nbsp;&nbsp;&nbsp;TEL 02-2260-3114 FAX 02-2277-1274
      </address>
      <p class="copyright">
        Copyright(c) 2016 DONGGUK UNIVERSITY. ALL RIGHTS RESERVED.
      </p>
    </div>
  </footer>

  <script src="/test/js/navbar.js"></script>
</div>
</body>
</html>