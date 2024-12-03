<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.Petition" %>
<%@page import="java.util.List"%>

<%request.setCharacterEncoding("utf-8"); %>
<%response.setCharacterEncoding("utf-8"); %>
<%
  List<Petition> petList = (List<Petition>)request.getAttribute("petList");
  List<Petition> anspetList = (List<Petition>)request.getAttribute("anspetList");
  List<Petition> toppetList = (List<Petition>)request.getAttribute("toppetList");
  List<Petition> rejpetList = (List<Petition>)request.getAttribute("rejpetList");
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
  <link rel="stylesheet" href="/test/css/index.css" type="text/css">
  <link rel="stylesheet" href="/test/css/navbar.css" type="text/css">
  <link rel="stylesheet" href="/test/css/footer.css" type="text/css">
  <script
          src="https://kit.fontawesome.com/6ffe1984d5.js"
          crossorigin="anonymous">
  </script>

    <script type="text/javascript">
        window.onload = function() {
            var welcomeMessage = "<%= session.getAttribute("welcomeMessage") %>";
            if (welcomeMessage != 'null') {
                alert(welcomeMessage);
                <% session.removeAttribute("welcomeMessage"); %>
            }
        };
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

  <section class="guide">
    <section class="intro_bg">
      <div class="intro_text">
        <p class="p1">지금까지 총 ${petCount}개의 청원이 등록되었습니다.</p>
        <p class="p2">작은 목소리가 모여 큰 변화를 만듭니다.<br>
          동국대 청원에 참여하세요!</p>
        <a href="/test/jsp/post.jsp" class="post_btn">청원 신청하기</a>
      </div>
    </section>

    <section class="intro_caution">
      <div class="caution_inner1">
        <button class="caution_btn1">
          <span>이런 청원은 삭제 처리될 수 있습니다</span>
          <i class="fa-solid fa-chevron-down"></i>
        </button>
        <button class="caution_btn2">
          <span>이런 청원은 반려 처리될 수 있습니다</span>
          <i class="fa-solid fa-chevron-down"></i>
        </button>
      </div>

      <div class="caution_inner2">
        <div class="caution_box1">
          <ul class="caution_list">
            <li>욕설 및 비속어가 과도하게 포함된 경우 삭제 또는 일부 내용 숨김 처리될 수 있습니다.</li><hr>
            <li>타인의 개인 정보가 노출되거나 거짓 정보로 작성된 경우 삭제 처리될 수 있습니다.</li><hr>
            <li>같은 내용의 청원이 반복적으로 등록된 경우 최초 등록된 청원을 제외하고 삭제 처리될 수 있습니다.</li><hr>
            <li>상업적 광고 또는 개인의 이익을 위한 홍보가 포함된 경우 삭제 처리될 수 있습니다.</li><hr>
          </ul>
        </div>

        <div class="caution_box2">
          <ul class="caution_list">
            <li>법적으로 실행이 불가한 내용이 포함된 경우 반려 처리될 수 있습니다.</li><hr>
            <li>외부 기관이 처리해야 할 사항인 경우 반려 처리될 수 있습니다.</li><hr>
            <li>공공의 이익과 관련 없는 개인적인 요청인 경우 반려 처리될 수 있습니다. </li><hr>
            <li>청원내용이 명확하지 않고 모호한 경우 답변이 반려 처리될 있습니다.</li><hr>
            <li>예시를 보시려면 <a href="#companion">여기</a>를 눌러 주세요</li><hr>
          </ul>
        </div>
      </div>
    </section>

    <section class="content">
      <div class="petition_title">
        <span>실시간 인기 청원</span>
      </div>
      <div class="topPetArea">
        <ul>
        <c:forEach items="${toppetList }" var="pet" begin="0"  varStatus="status">
          <c:if test="${status.index < 13}">
            <li>
              <div class="t">
                <div class="t_name">${pet.getWriter()}</div>
                <p class="t_title"><a class = "bbb" href="/test/ReadPet?id=${pet.getId()}">${pet.getTitle()}</a></p>
                <p class="t_txt">${pet.getSolution()}</p>

                <div class="fav">
                  <p class="orange_txt"><i class="fa-regular fa-face-smile"> &nbsp;</i>댓글 (${pet.getAgree()}개)</p>
                  <div class="pro">
                    <p class="pro_bar" style="width: ${(pet.getAgree() / 10) * 100}%;"></p>
                  </div>
                </div>
              </div>

              <div class="reply">
                <p class="reply_c">${pet.getCategory()}</p>
                <p class="reply_d">${pet.getDate()}</p>
              </div>
            </li>
          </c:if>
        </c:forEach>
        </ul>
      </div>

      <div class="petition_title">
        <span>최근 등록된 청원</span>
        <a class="more" href="/test/PetitionBoardServlet?order=recent"><i class="fa-solid fa-plus"></i>&nbsp;더 보기</a>
      </div>
      <div class="topPetArea">
        <ul>
          <c:forEach items="${petList }" var="pet" begin="0"  varStatus="status">
            <c:if test="${status.index < 13}">
              <li>
                <div class="t">
                  <div class="t_name">${pet.getWriter()}</div>
                  <p class="t_title"><a class = "bbb" href="/test/ReadPet?id=${pet.getId()}">${pet.getTitle()}</a></p>
                  <p class="t_txt">${pet.getSolution()}</p>

                  <div class="fav">
                    <p class="orange_txt"><i class="fa-regular fa-face-smile"> &nbsp;</i>댓글 (${pet.getAgree()}개)</p>
                    <div class="pro">
                      <p class="pro_bar" style="width: ${(pet.getAgree() / 10) * 100}%;"></p>
                    </div>
                  </div>

                </div>

                <div class="reply">
                  <p class="reply_c">${pet.getCategory()}</p>
                  <p class="reply_d">${pet.getDate()}</p>
                </div>
              </li>
            </c:if>
          </c:forEach>
        </ul>
      </div>

      <div class="petition_title">
        <span>답변된 청원</span>
        <a class="more" href="/test/AnsBoard?order=recent"><i class="fa-solid fa-plus"></i>&nbsp;더 보기</a>
      </div>
      <div class="topPetArea">
        <ul>
          <c:forEach items="${anspetList }" var="pet" begin="0"  varStatus="status">
            <c:if test="${status.index < 13}">
              <li>
                <div class="t">
                  <div class="t_name">${pet.getWriter()}</div>
                  <p class="t_title"><a class = "bbb" href="/test/ReadPet?id=${pet.getId()}">${pet.getTitle()}</a></p>
                  <p class="t_txt">${pet.getSolution()}</p>

                  <div class="fav">
                    <p class="orange_txt"><i class="fa-regular fa-face-smile"> &nbsp;</i>댓글 (${pet.getAgree()}개)</p>
                    <div class="pro">
                      <p class="pro_bar" style="width: ${(pet.getAgree() / 10) * 100}%;"></p>
                    </div>
                  </div>

                </div>

                <div class="reply">
                  <p class="reply_c">${pet.getCategory()}</p>
                  <p class="reply_d">${pet.getDate()}</p>
                </div>
              </li>
            </c:if>
          </c:forEach>
        </ul>
      </div>

      <div class="petition_title" id="companion"><span>반려된 청원</span></div>
      <div class="topPetArea">
        <ul>
          <c:forEach items="${rejpetList }" var="pet" begin="0"  varStatus="status">
            <c:if test="${status.index < 13}">
              <li>
                <div class="t">
                  <div class="t_name">${pet.getWriter()}</div>
                  <p class="t_title"><a class = "bbb" href="/test/ReadPet?id=${pet.getId()}">${pet.getTitle()}</a></p>
                  <p class="t_txt">${pet.getSolution()}</p>

                  <div class="fav">
                    <p class="orange_txt"><i class="fa-regular fa-face-smile"> &nbsp;</i>댓글 (${pet.getAgree()}개)</p>
                    <div class="pro">
                      <p class="pro_bar" style="width: ${(pet.getAgree() / 10) * 100}%;"></p>
                    </div>
                  </div>

                </div>

                <div class="reply">
                  <p class="reply_c">${pet.getCategory()}</p>
                  <p class="reply_d">${pet.getDate()}</p>
                </div>
              </li>
            </c:if>
          </c:forEach>
        </ul>
      </div>








<%--      <div class="petition_title"><span>최근 등록된 청원</span></div>--%>
<%--      <div class="topPetArea">--%>
<%--        <ul>--%>
<%--          <c:forEach items="${petList }" var="pet" begin="0"  varStatus="status">--%>
<%--            <c:if test="${status.index < 13}">--%>
<%--              <li>--%>
<%--                <div class="t">--%>
<%--                  <div class="t_name">${pet.getWriter()}</div>--%>
<%--                  <p class="t_title"><a class = "bbb" href="/test/ReadPet?id=${pet.getId()}">${pet.getTitle()}</a></p>--%>
<%--                  <p class="t_txt">${pet.getSolution()}</p>--%>

<%--                  <div class="fav">--%>
<%--                    <p class="orange_txt"><i class="fa-regular fa-face-smile"> &nbsp;</i>댓글</p>--%>
<%--                    <div class="pro">--%>
<%--                      <p class="pro_bar" style="width: ${(pet.getAgree() / 10) * 100}%;"></p>--%>
<%--                    </div>--%>
<%--                  </div>--%>

<%--                </div>--%>

<%--                <div class="reply">--%>
<%--                  <p class="reply_c">${pet.getCategory()}</p>--%>
<%--                  <p class="reply_d">${pet.getDate()}</p>--%>
<%--                </div>--%>
<%--              </li>--%>
<%--            </c:if>--%>
<%--          </c:forEach>--%>
<%--        </ul>--%>
<%--      </div>--%>
<%--      <div class="petition_title"><span>최근 등록된 청원</span></div>--%>
<%--      <div class="petition_info">--%>
<%--        <div class="head_wrap">--%>
<%--          <div class="head_category">분류</div>--%>
<%--          <div class="head_subject">제목</div>--%>
<%--          <div class="head_date">청원 등록일</div>--%>
<%--          <div class="head_agreements">참여 인원</div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <ul class="petition_list">--%>
<%--        <!--          각각 청원이 아래처럼 생성되게 해주시면 될 것 같아요!!-->--%>
<%--        <c:forEach items="${petList }" var="pet" begin="0"  varStatus="status">--%>
<%--        <c:if test="${status.index < 5}">--%>
<%--	        <li>--%>
<%--	          <div class="category">${pet.getCategory()}</div>--%>
<%--	          <div class="subject"><a href="/test/ReadPet?id=${pet.getId()}">${pet.getTitle()}</a></div>--%>
<%--	          <div class="date">${pet.getDate()}</div>--%>
<%--	          <div class="agreements">${pet.getAgree()}</div>--%>
<%--	        </li>--%>
<%--        </c:if>--%>
<%--		</c:forEach>--%>
<%--      </ul>--%>

<%--      <div class="petition_title"><span>최근 답변된 청원</span></div>--%>
<%--      <div class="petition_info">--%>
<%--        <div class="head_wrap">--%>
<%--          <div class="head_category">분류</div>--%>
<%--          <div class="head_subject">제목</div>--%>
<%--          <div class="head_date">청원 등록일</div>--%>
<%--          <div class="head_agreements">참여 인원</div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <ul class="petition_list">--%>
<%--      	<c:forEach items="${anspetList }" var="pet" begin="0"  varStatus="status">--%>
<%--      	<c:if test="${status.index < 5}">--%>
<%--	        <li>--%>
<%--	          <div class="category">${pet.getCategory()}</div>--%>
<%--	          <div class="subject"><a href="/test/ReadPet?id=${pet.getId()}">${pet.getTitle()}</a></div>--%>
<%--	          <div class="date">${pet.getDate()}</div>--%>
<%--	          <div class="agreements">${pet.getAgree()}</div>--%>
<%--	        </li>--%>
<%--        </c:if>--%>
<%--		</c:forEach>--%>
<%--      </ul>--%>

<%--      <div id="companion" class="petition_title"><span>최근 반려된 청원</span></div>--%>
<%--      <div class="petition_info">--%>
<%--        <div class="head_wrap">--%>
<%--          <div class="head_category">분류</div>--%>
<%--          <div class="head_subject">제목</div>--%>
<%--          <div class="head_date">청원 등록일</div>--%>
<%--          <div class="head_agreements">참여 인원</div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <ul class="petition_list">--%>
<%--			<c:forEach items="${rejpetList }" var="pet" begin="0"  varStatus="status">--%>
<%--			<c:if test="${status.index < 5}">--%>
<%--		        <li>--%>
<%--		          <div class="category">${pet.getCategory()}</div>--%>
<%--		          <div class="subject"><a href="/test/ReadPet?id=${pet.getId()}">${pet.getTitle()}</a></div>--%>
<%--		          <div class="date">${pet.getDate()}</div>--%>
<%--		          <div class="agreements">${pet.getAgree()}</div>--%>
<%--		        </li>--%>
<%--	        </c:if>--%>
<%--			</c:forEach>--%>
<%--      </ul>--%>
    </section>
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


</div>
<script src="/test/js/navbar.js"></script>
<script src="/test/js/index.js"></script>
</body>
</html>
