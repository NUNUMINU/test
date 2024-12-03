<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setCharacterEncoding("utf-8"); %>
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
  <link rel="stylesheet" href="/test/css/login.css" type="text/css">
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

  <section class="login_wrap">
    <div class="login_form">
      <h1>로그인</h1>
      <form method='post' action="/test/LoginServlet" onsubmit="return validateForm()">

        <div class="input_area">
          <input type="text" name="id" id="id" autocomplete="off" placeholder="아이디">
          <label for="id"><i class="fa-solid fa-id-badge"></i></label>
        </div>

        <div class="input_area">
          <input type="password" name="pw" id="pw" autocomplete="off" placeholder="비밀번호">
          <label for="pw"><i class="fa-solid fa-lock"></i></label>
        </div>

        <div class="caption">
          <label><input type="checkbox"> 간편로그인 정보 저장  </label>
          <a href="https://ndrims.dongguk.edu/unis/index.do">비밀번호를 잊으셨나요?</a>
        </div>

        <div class="button_area">
          <button id="btn" type="submit">로그인</button>
        </div>

      </form>
    </div>
  </section>

  <footer>
    <ul class="footer_menu">
      <li><a href="https://www.dongguk.edu/page/534" target="_blank">개인정보처리방침</a></li>
      <li><a href="https://www.dongguk.edu/article/privacyNotice/list" target="_blank">개인정보내역</a></li>
      <li><a href="https://www.dongguk.edu/" target="_blank">동국대학교</a></li>
    </ul>
    <div>
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
  <script>
    function validateForm(){
    const username = document.getElementById("id").value.trim();
    const password = document.getElementById("pw").value.trim();
    if (!username || !password) {
        alert("로그인 정보를 입력해주세요!");
        return false;
      }
    return true;
    }

    const urlParams = new URLSearchParams(window.location.search);
    const wrong = urlParams.get('wrong');

    if (wrong === '1') {
        alert("로그인 정보가 유효하지 않습니다. 다시 시도해주세요.");
    }
  </script>
</body>
</html>