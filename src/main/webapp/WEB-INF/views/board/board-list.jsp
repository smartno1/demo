<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- 부트스트랩-->
    <%@ include file="../include/static-head.jsp" %> 
    
            <!-- reset css -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

   <!-- 부트스트랩-->
   <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> -->
             
    <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="/css/header.css"/>
     <link rel="stylesheet" type="text/css" href="/css/board-list.css"/>
     <style>
        a {color: #fff; text-decoration: none; outline: none}
        a:hover, a:active {text-decoration: none; }
        .header-wrraper .nav .nav-ul{
                padding: 0; 
            }
        .header-wrraper .nav .nav-ul li{
                list-style: none;
            }
        .wrap{
                      padding-bottom: 150px;
                  }

  
      </style>

     <script src="/js/board-list.js" defer>

     </script>

</head>

<body>

    <div class="wrap">
        <%@ include file="../include/header.jsp" %>
        

        <div class="board-list">

            <div class="top-section">
                <!-- 검색창 영역 -->
                <div class="search">
                    <form action="/board/list" method="get">
                        
                        <select class="form-select" name="type" id="search-type">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                            <option value="writer">작성자</option>
                            <option value="tc">제목+내용</option>
                        </select>

                        <input type="text" class="form-control" name="keyword" value="${s.keyword}">

                        <button class="btn btn-primary" type="submit">
                            <i class="fas fa-search"></i>
                        </button>

                    </form>
                </div>

                <!-- 목록 개수별 보기 영역 -->
                <ul class="amount">
                    <li><a class="btn btn-danger" href="/board/list?amount=10">10</a></li>
                    <li><a class="btn btn-danger" href="/board/list?amount=20">20</a></li>
                    <li><a class="btn btn-danger" href="/board/list?amount=30">30</a></li>
                </ul>
            </div>

            <table class="table table-dark table-striped table-hover articles">
                <tr>
                    <th>번호</th>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>조회수</th>
                    <th>작성시간</th>
                </tr>

                <c:forEach var="b" items="${bList}">
                    <tr>
                        <td>${b.boardNo}</td>
                        <td>${b.writer}</td>
                        <td title="${b.title}">
                            ${b.shortTitle} [${b.replyCount}]
                            <c:if test="${b.newArticle}">
                                <span class="badge rounded-pill bg-danger">new</span>
                            </c:if>
                            <b>${b.likeCnt}(추천)</b>
                        </td>
                        <td>${b.viewCnt}</td>
                        <td>${b.prettierDate}</td>
                    </tr>
                </c:forEach>
            </table>

            <!-- 게시글 목록 하단 영역 -->
            <div class="bottom-section">

                <!-- 페이지 버튼 영역 -->
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination-lg pagination-custom">

                        <c:if test="${pm.prev}">
                            <li class="page-item"><a class="page-link"
                                    href="/board/list?pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">prev</a></li>
                        </c:if>

                        <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                            <li data-page-num="${n}" class="page-item">
                                <a class="page-link" href="/board/list?pageNum=${n}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">${n}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${pm.next}">
                            <li class="page-item"><a class="page-link"
                                    href="/board/list?pageNum=${pm.endPage + 1}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">next</a></li>
                        </c:if>

                    </ul>
                </nav>

                <!-- 글쓰기 버튼 영역 -->
                <div class="btn-write">
                    <a class="btn btn-outline-danger btn-lg" href="/board/write">글쓰기</a>
                </div>
            </div>
        </div>


        <%@ include file="../include/footer.jsp" %>
    </div>

    <script>

        var msg = "${msg}";
        var pageNum = "${pm.page.pageNum}";
        var amount = "${pm.page.amount}";
        var sType = "${s.type}";
        var sKeyword = "${s.keyword}";
        var newArticle=" ${b.newArticle}";

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


</body>

</html>