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
                <div class="count"> 개수</div>
                <div class="soldout">품절제외</div>
            </div>
            <div class="listbox">
                <ul class="list-ul clear-fix">
                    <li>
                        <div class="img">
                            <a href="/shop/detail">
                                <img src="/" art="">
                            </a>
                        </div>
                        <p class="title">
                            상품 제목
                        </p>
                        <div class="price">
                            가격
                        </div>
                    </li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
            <div class="paging">
                <ul>
                    <li>

                    </li>
                </ul>
            </div>
            
        </div>


        <%@ include file= "../include/footer.jsp" %>
    </div>
</body>
</html>
