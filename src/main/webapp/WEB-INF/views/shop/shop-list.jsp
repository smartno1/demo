<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-11
  Time: 오후 4:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">

<head>
    <title>Title</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- custom css -->
    <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>

    <style>
        a {color: #fff; text-decoration: none; outline: none}
        a:hover, a:active {text-decoration: none; }

        .clear-fix{
            content: "";
            display: block;
            clear: both;
        }

        .shopwrap{
            width: 1200px;
            margin: 0 auto;
            position: relative;

        }
        .nav {
            position: relative;
        }
        .nav div {
            float: left;
            margin-left: 20px;
            color: white;
            font-size: 30px;
        }
        .shopwrap .shopheader {
            position: relative;
            margin-top: 20px;
            color: #fff;
        }
        .shopwrap .shopheader .count{
            float: left;
            margin-left: 20px;

        }
        .shopwrap .shopheader .soldout{
            float: right;
        }
        .shopwrap .listbox {
            width: 1200px;
        }
        .shopwrap .listbox .list-ul {
            width: 1000px;
            margin: 0 auto;
            position: relative;
            min-height: 579px;
        }
        .shopwrap .listbox .list-ul li{
            background: red;
            float: left;
            width: 200px;
            height: 300px;
            margin: 20px;
        }
        .shopwrap .listbox .list-ul li .img img{
            width: 200px;
            height: 240px;
        }
        .shopwrap .listbox .list-ul li .title {
            margin: 10px;
        }
        .shopwrap .listbox .list-ul li .price {
            margin-left: 10px;
        }
    /*    --------------------------------------------*/
    /*    paging ----------------------------*/
       .bottom-section nav{

            /* background-color: red; */
        }
        .bottom-section nav .bottom-ul {
            /* border: 4px solid #000; */
            /* background-color: yellowgreen; */
            width: fit-content;
            height: 50px;
            margin: 0 auto;
            position: relative;
            justify-content: center;

        }

        .bottom-section nav .bottom-ul li {
            float: left;
        }

        .bottom-section .bottom-ul li {
            text-align: center;

        }
        .bottom-section .bottom-ul li a{
            width: 50px;
            height: 40px;
            display: block;
            border-radius: 10px;
            line-height: 40px;
            font-size: 25px;
        }

        .bottom-section .bottom-ul li.active a,
        .bottom-section .bottom-ul li:hover a {
            background: #6965c3 !important;
            color: #fff !important;
        }

        .bottom-section .bottom-ul li .prev{
            margin-right: 10px;
        }
        .bottom-section .bottom-ul li .next {
            margin-left: 10px;
        }
        /*===========================================*/

    </style>

</head>
<body>
    <div class="wrap">
        <%@ include file= "../include/header.jsp" %>

        <div class="shopwrap">
            <nav class="nav clear-fix">
                <div>
                    최신순
                </div>
                <div>
                    인기순
                </div>
                <div>
                    별점순
                </div>
                <div>
                    <a href="/shop/regist">
                        상품등록
                    </a>
                </div>
                
            </nav>
            <div class="shopheader clear-fix">
                <div class="count">총 ${pm.totalCount}개</div>
                <div class="soldout">품절제외</div>
            </div>
            <div class="listbox">
                <ul class="list-ul clear-fix">
                    <c:forEach var="i" items="${goods}">
                    <li>
                        <a href="/shop/detail?id=${i.id}">
                            <div class="img">

                                    <img src="${i.src}" art="">

                            </div>
                            <p class="title">
                                ${i.shortName}
                            </p>
                            <div class="price">
                                ￦${i.decimalPrice}
                            </div>
                        </a>
                    </li>
                    </c:forEach>

                </ul>
            </div>
            <div class="bottom-section">
                          <!-- 페이지 버튼 영역 -->
                <nav class="Page navigation example">
                    <ul class="bottom-ul">
                        <%-- 이전 버튼 --%>
                        <c:if test="${pm.prev}">
                            <li><a href="/gallery/list?type=${search.type}&keyword=${search.keyword}&pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}" class="prev">prev</a></li>
                        </c:if>

                        <%-- 페이지 버튼 --%>
                        <c:forEach var="i" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                            <li>
                                <a href="/gallery/list?type=${search.type}&keyword=${search.keyword}&pageNum=${i}&amount=${pm.page.amount}">${i}</a>
                            </li>
                        </c:forEach>

                        <%--다음 버튼--%>
                        <c:if test="${pm.next}">
                            <li><a href="/gallery/list?type=${search.type}&keyword=${search.keyword}&pageNum=${pm.endPage + 1}&amount=${pm.page.amount}" class="next">next</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <%@ include file= "../include/footer.jsp" %>
    </div>



<script>
    // detail
    function detail(){
        document.querySelector('.list-ul').addEventListener("click", e => {

            if(!e.target.matches('.list-ul li img')) return;




        })
    }

    //현재 위치한 페이지에 active 스타일 부여하기
    function appendPageActive() {

        // 현재 내가 보고 있는 페이지 넘버
        const curPageNum =''+ ${pm.page.pageNum};
        console.log("현재페이지: ", curPageNum, typeof curPageNum);


        // 페이지 li태그들을 전부 확인해서
        // 현재 위치한 페이지 넘버와 텍스트컨텐츠가 일치하는
        // li를 찾아서 class active 부여
        const $ul = document.querySelector('.bottom-ul');

        for (let $li of [...$ul.children]) {
            if (curPageNum === $li.firstElementChild.textContent) {
                $li.classList.add('active');
                break;
            }
        }

    }

    (function (){
        detail();
        appendPageActive();
    })();
</script>

</body>
</html>
