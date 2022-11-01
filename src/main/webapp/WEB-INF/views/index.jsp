<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-02
  Time: 오전 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <!-- reset css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <style>
    a {color: #fff; text-decoration: none; outline: none}
    a:hover, a:active {text-decoration: none; color:#fff; background-color:#f59000;}
  </style>
  <!-- custom css -->
  <link rel="stylesheet" type="text/css" href="css/footer.css"/>
  <link rel="stylesheet" type="text/css" href="css/header.css"/>
  <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>
<div class="section-body">
  <div class="main-photo">
    <div id="photo">
      <div class="photo-slider">
        <input type="radio" name="slide1" id="slide1" checked>
        <input type="radio" name="slide1" id="slide2">
        <input type="radio" name="slide1" id="slide3">
        <input type="radio" name="slide1" id="slide4">
        <ul id="imgholder" class="imgs">
          <li><img src="./img/slide1.jpg"></li>
          <li><img src="./img/slide1.jpg"></li>
          <li><img src="./img/slide01.jpg"></li>
          <li><img src="./img/slide03.jpg"></li>
        </ul>
        <div class="bullets">
          <label for="slide1">&nbsp;</label>
          <label for="slide2">&nbsp;</label>
          <label for="slide3">&nbsp;</label>
          <label for="slide4">&nbsp;</label>
        </div>
      </div>
    </div>
    <div id="photo-bottom">
    </div>
  </div>
  <div class="main-album">
    <div class="album-slide">
      <input type="radio" name="slide" id="slide01" checked>
      <input type="radio" name="slide" id="slide02">
      <input type="radio" name="slide" id="slide03">
      <input type="radio" name="slide" id="slide04">
      <input type="radio" name="slide" id="slide05">
      <input type="radio" name="slide" id="slide06">
      <div class="slidewrap">
        <ul class="slidelist">
          <li>
            <a>
              <img src="./img/slide01.jpg">
            </a>
          </li>
          <li>
            <a>
              <img src="./img/slide02.jpg">
            </a>
          </li>
          <li>
            <a>
              <img src="./img/slide03.jpg">
            </a>
          </li>
          <li>
            <a>
              <img src="./img/slide04.jpg">
            </a>
          </li>
          <li>
            <a>
              <img src="./img/slide05.jpg">
            </a>
          </li>
          <li>
            <a>
              <img src="./img/slide06.jpg">
            </a>
          </li>
        </ul>

        <div class="slide-control">
          <div class="control01">
            <label for="slide03" class="left"></label>
            <label for="slide02" class="right"></label>
          </div>
          <div class="control02">
            <label for="slide01" class="left"></label>
            <label for="slide03" class="right"></label>
          </div>
          <div class="control03">
            <label for="slide02" class="left"></label>
            <label for="slide01" class="right"></label>
          </div>
        </div>
      </div>
    </div>

  </div>
  <div class="main-menu">
    <div class="menuwrap">
      <div class="menubox clear-fix">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
      </div>

    </div>
  </div>

</div>
</body>
</html>
