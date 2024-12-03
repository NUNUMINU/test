<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.Petition" %>
<%@page import="dto.Reply" %>
<%@page import="java.util.List"%>

<%request.setCharacterEncoding("utf-8"); %>
<%response.setCharacterEncoding("utf-8"); %>
<%
  String username = (String)session.getAttribute("username");
  String userid  = (String)session.getAttribute("userid");
  int petid = (int)(request.getAttribute("petid"));
  Petition pet = (Petition)request.getAttribute("pet");
  List<Reply> petList = (List<Reply>)request.getAttribute("reply");
  String name = (String) session.getAttribute("username");
  boolean isLoggedIn = name != null;
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
  <link rel="stylesheet" href="/test/css/view.css" type="text/css">
  <link rel="stylesheet" href="/test/css/navbar.css" type="text/css">
  <link rel="stylesheet" href="/test/css/footer.css" type="text/css">
  <script
          src="https://kit.fontawesome.com/6ffe1984d5.js"
          crossorigin="anonymous">
  </script>

  <script>
    function showPopup() {
      var isLoggedIn = <%= isLoggedIn %>;
      if (!isLoggedIn) {
        alert("의견 작성은 로그인 후 가능합니다.");
        window.location.href = "/test/jsp/login.jsp";
      }
    }
  </script>

  <style>
    .pro:before{
      content: "";
      border-right: 1px solid #e2e2e2;
      display: block;
      position: absolute;
      top: 2px;
      left: 0;
      width: 151px;
      height: 100%;
      padding: 1px 5px 0 0;
      box-sizing: border-box;
      color: #777;
      text-align: right;
      font-size: 13px;
    }
  </style>
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
    <div class="board_view">
      <div class="view_title">
        <div class="category"> <%=pet.getCategory() %></div>
        <div class="title"> <%=pet.getTitle() %></div>
        <div class="a">
          <div class="writer"> <%=pet.getWriter() %></div>
          <span>|</span>
          <div class="date"> <%=pet.getDate() %></div>
        </div>
      </div>

      <div class="view_content">
        <hr>
        <span>청원 내용</span>
        <br>
        <div class="content">
          <span class="b">문제현황</span>
          <textarea name="problem" readonly ><%=pet.getProblem()%></textarea>
          <span class="b">제안</span>
          <textarea name="solution" readonly ><%=pet.getSolution()%></textarea>
          <span class="b">기대효과</span>
          <textarea name="effect" readonly ><%=pet.getEffect()%></textarea>
          <div class="btn_area">
            <c:if test="${userid != null && (userid == writerID || userid == '2020')}">
              <a href="/test/DeletePet?petitionId=${petid}" class="del_btn">삭제</a>
            </c:if>
            <c:if test="${userid != null && userid == '2020' && isAns != '2'}">
              <a href="/test/RejPet?petitionId=${petid}" class="rej_btn">반려</a>
            </c:if>
          </div>
        </div>
        <hr>

        <span class="b">청원 진행 상황</span>
        <div class="pro">
          <p class="pro_bar" style="width: ${(pet.getAgree() / 10) * 100}%;"></p>
        </div>
        <hr>
      </div>

      <span class="b">댓글 작성 <i class="fa-solid fa-comment"></i></span>
      <div class="discussion">
        <form class="dc_input" method='post' action='/test/addReply'>
          <textarea class="dc" name="dc" required onclick="showPopup()"></textarea>
          <input type='hidden' name=ref value='<%=petid%>'>
          <input type='hidden' name=writer value='<%=username%>'>
          <input type='hidden' name=writerId value='<%=userid%>'>
          <button type='submit'>등록</button>
        </form>
      </div>
      
      <div class="comment_list">
        <ul>
          <c:forEach items="${reply }" var="re" begin="0">
          <!-- 댓글 하나 !-->
          <li>
            <div class="comment">
              <div class="comment_info">
                <div>${re.getWriter()}</div>
                <div>${re.getDate()}</div>
              </div>
              <div class="comment_content">${re.getContent()}</div>
            </div>
          </li>
          </c:forEach>
          <!-- 여기까지 !-->
        </ul>
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
