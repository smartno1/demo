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

  <div class="bodywrap">
    <form id="regist" action="/shop/upload" method="POST" enctype="multipart/form-data">
      <div class="img">
        이미지 사진 <input type="file" name="file" id="file-input">
      </div>
      <div class="text">
        <div>
          <p>
            상품명 <input type="text" name="name">
          </p>
          <p>
            가격 <input type="text" name="price">
          </p>
        </div>
        <div class="info">
          원산지 <input type="text" name="origin">
          배송 방법 <input type="text" value="택배" readonly>
          배송비 <input type="text" value="2500원" readonly>
        </div>
        <div class="count">
          수량 <input type="number" name="stock">
        </div>
        <div class="detail-info">
          <div>상세설명</div>
          <textarea class="detail-text" type="text" name="content"></textarea>
        </div>
      </div>
    </form>
    <div> 등록 </div>
    <div> 취소 </div>
  </div>


  <%@ include file= "../include/footer.jsp" %>
</div>

<script>

</script>
</body>
</html>
