<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String username = (String)session.getAttribute("username");
String userid  = (String)session.getAttribute("userid");
%>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
  <meta name="theme-color" content="#ffffff">
  <title>동국대학교 청원</title>
  <link rel="icon" href="/test/icon/favicon.ico">
  <link rel="stylesheet" href="/test/css/information.css" type="text/css">
  <link rel="stylesheet" href="/test/css/navbar.css" type="text/css">
  <link rel="stylesheet" href="/test/css/footer.css" type="text/css">
  <script
          src="https://kit.fontawesome.com/6ffe1984d5.js"
          crossorigin="anonymous">
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

  <section class="guide">
    <div class="content">
      <div class="content_header">
        <h1>동국대 청원 사이트 이용 안내</h1>
      </div>

      <div class="content_menu_wrap">
        <ul class="content_menu_list">
          <li><a href="#introduce">동국대 청원 소개</a></li>
          <li><a href="#procedure">청원 처리 절차</a></li>
          <li><a href="#caution">그 밖의 안내 사항</a></li>
        </ul>
      </div>

      <div class="content_introduce">
        <section id="introduce">
          <h2>'동국대 청원'이 뭔가요?</h2>
          <ul class="ls1">
            <li>‘동국대 청원’은 우리대학의 발전을 위한 건설적 제안과 공론화의 장입니다. </li>
            <li>30일 이내에 구성원들의 댓글을 10건 이상 받은 청원에 대해 해당 부서에서 7일∼15일 이내로 답변을 드립니다.</li>
            <li>동국인 여러분의 참신한 아이디어를 기다리겠습니다.</li>
          </ul>
        </section>

        <section id="procedure">
          <h2>청원은 다음과 같은 절차로 처리 됩니다.</h2>
          <ul class="ls2">
            <li>  1. 청원 신청: 청원인이 청원신청 메뉴를 통해 청원을 작성하고 제출합니다.</li>
            <li>  2. 청원 공감/댓글: 제출된 청원은 청원목록 페이지에 공개되어 누구나 열람할 수 있으며, 동국대학교 구성원은 게시된 청원에 30일 간 댓글을 달 수 있습니다.</li>
            <li>  3. 청원 마감/답변: 10건 이상의 댓글을 받은 청원은 교내 관련 부서에서 7일~15일 이내에 답변을 드립니다. (답변이 작성된 청원은 답변된 청원 게시판으로 이전됩니다.)</li>
          </ul>
        </section>

        <section id="caution">
          <h2>청원 처리 예외 사항</h2>
          <h3>제출한 청원이 다음 사항 중 어느 하나에 해당하는 경우 청원을 처리하지 않을 수 있습니다.</h3>
          <ul class="ls2">
            <li>1. 욕설 및 비속어가 과도하게 포함된 경우</li>
            <li>2. 타인의 개인 정보가 노출되거나 거짓 정보로 작성된 경우</li>
            <li>3. 상업적 광고 또는 개인의 이익을 위한 홍보가 포함된 경우</li>
            <li>4. 법적으로 실행이 불가한 내용이 포함된 경우</li>
            <li>5. 외부 기관이 처리해야 할 사항인 경우</li>
            <li>6. 공공의 이익과 관련 없는 개인적인 요청인 경우</li>
            <li>7. 청원내용이 명확하지 않고 모호한 경우</li>
          </ul>
        </section>

        <section>
          <h2>반복 청원 처리</h2>
          <ul class="ls2">
            <li>동일인이 같은 내용의 청원을 2건 이상 제출한 경우 삭제 처리됩니다.</li>
            <li>서로 다른 청원인들이 유사한 내용의 청원을 제출한 경우 더 많은 댓글을 얻은 청원을 제외하고 반려 처리됩니다.</li>
          </ul>
        </section>
      </div>
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