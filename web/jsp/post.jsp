<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setCharacterEncoding("utf-8"); %>
<%
  String username = (String)session.getAttribute("username");
  String userid  = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
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
  <link rel="stylesheet" href="/test/css/post.css" type="text/css">
  <link rel="stylesheet" href="/test/css/navbar.css" type="text/css">
  <link rel="stylesheet" href="/test/css/footer.css" type="text/css">
  <script
          src="https://kit.fontawesome.com/6ffe1984d5.js"
          crossorigin="anonymous">
  </script>

  <script>
    <%
       String name = (String) session.getAttribute("username");
       boolean isLoggedIn = name != null;
    %>

    window.onload = function () {
      var isLoggedIn = <%= isLoggedIn %>;
      if (!isLoggedIn) {
        alert("청원 신청은 로그인 후 가능합니다.");
        window.location.href = "/test/jsp/login.jsp";
      }
    };
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
    <form class="petition_form" method="post" action="/test/AddPet">
      <h2 class="title_area">청원 신청</h2>
      <table class="write_area">
        <colgroup>
          <col width="20%">
          <col width="*">
        </colgroup>
        <tbody>
        <tr>
          <th>카테고리 선택</th>
          <td>
            <select id="category" name="category">
              <option value="학적">학적</option>
              <option value="시설운영">시설운영</option>
              <option value="입학/학사">입학/학사</option>
              <option value="장학/역량/봉사">장학/역량/봉사</option>
              <option value="교육">교육</option>
              <option value="연구">연구</option>
              <option value="기타">기타</option>
            </select>
          </td>
        </tr>

        <tr>
          <th>제목</th>
          <td>
            <input type="text" placeholder="제목을 입력해주세요" name="title" required>
          </td>
        </tr>

        <tr>
          <th>작성자</th>
          <td>
            ${username}
          </td>
        </tr>

        <tr>
          <th>문제현황</th>
          <td>
            <textarea name="problem" required></textarea>
          </td>
        </tr>

        <tr>
          <th>제안</th>
          <td>
            <textarea name="solution" required></textarea>
          </td>
        </tr>

        <tr>
          <th>기대효과</th>
          <td>
            <textarea name="effect" required></textarea>
          </td>
        </tr>
        </tbody>
      </table>
	  <input type=hidden name='writer' value='<%=username%>'>
	  <input type=hidden name='writerId' value='<%=userid%>'>
      <div class="btn_area">
        <button class="sub" type='submit'>등록</button>
        <a class="cancel" href="/test/IndexServlet">취소</a>
      </div>
    </form>
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

  <script src="../js/navbar.js"></script>
</div>
</body>
</html>