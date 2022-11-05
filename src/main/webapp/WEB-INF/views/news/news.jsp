<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-04
  Time: 오후 9:25
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <style>
        a {color: #fff; text-decoration: none; outline: none}
        a:hover, a:active {text-decoration: none; }
    </style>
    <!-- custom css -->
    <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="/css/main.css"/>
<%--    <link rel="stylesheet" type="text/css" href="/css/news.css"/>--%>
    <style>

        .news-wrap{
            margin-top: 20px;
            width: 100%;

        }
        .news-box{
            width: 1100px;
            margin: 0 auto;
        }
        .news-box .news-ul {
        
        }
        .news-box .news-ul .news-li{
            position: relative;
            height: 250px;
        }
        .news-box .news-ul .news-li .video {
            float: left;
            width: 300px;
            height: 200px;

            font-size: 40px;


        }

        .news-box .news-ul .news-li .txt {
            float: left;
            width: 800px;

            margin: auto 0;

        }
        .news-box .news-ul .news-li .txt .logo {
            margin-top: 10px;
            margin-bottom: 10px;
            font-size: 20px;

        }
        .news-box .news-ul .news-li .txt .news-title {
            font-size: 28px;
            margin-bottom: 20px;

        }
        .news-box .news-ul .news-li .txt .news-content p{
            width: 800px;
            word-break: break-all;
        }
    </style>
</head>
<body>

<div class="wrap">
    
    <%@include file="../include/header.jsp"%>
    
    <section class="news-wrap">
        <div class="news-box">
            <ul class="news-ul clear-fix">
                <c:forEach var="i" items="${arr}">

                    <li class="news-li">
                        <div class="video">
                            <div>
                                <a href="${i.videoUrl}" target="_blank">
                                    <c:if test="${!empty i.videoImg}">
                                        <img src="${i.videoImg}">
                                    </c:if>
                                    <c:if test="${empty i.videoImg}">
                                        No image
                                    </c:if>
                                </a>
                            </div>
                            <div></div>
                        </div>
                        <div class="txt">
                            <div class="logo">
                                <a href="${i.newsCompanyUrl}" target="_blank">
                                        <img src="${i.newsCompanyImg}" alt=""> ${i.newsTime}
                                </a>
                            </div>
                            <div class="news-title">
                                <a href="${i.titleUrl}" target="_blank">
                                        ${i.titleText}
                                </a>
                            </div>
                            <div class="news-content">
                                <p>
                                    <a href="${i.contentUrl}" target="_blank">
                                            ${i.contentText}
                                    </a>
                                </p>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>

        </div>
    </section>
    
    <%@include file="../include/footer.jsp"%>
</div>
</body>
</html>