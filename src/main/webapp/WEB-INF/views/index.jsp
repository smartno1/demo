<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-02
  Time: 오전 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Title</title>
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
</head>

<body>
<div class="wrap">
<%@ include file= "include/header.jsp" %>

<div class="section-body">
  <div class="main-photo">
    <div id="photo">
      <div class="photo-slider">
        <input type="radio" name="slide1" id="slide1" checked>
        <input type="radio" name="slide1" id="slide2">
        <input type="radio" name="slide1" id="slide3">
        <input type="radio" name="slide1" id="slide4">
        <ul id="imgholder" class="imgs">
          <li><img src="./img/bbo1.jpg"></li>
          <li><img src="./img/bbo2.jpg"></li>
          <li><img src="./img/bbo3.jpg"></li>
          <li><img src="./img/bbo4.jpg"></li>
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
         <img src="./img/ci-b.png">
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
            <a href="https://ibighit.com/bts/kor/discography/detail/dynamite.html" target="_blank">
              <img src="./img/allbem01.jpg">
            </a>
          </li>
          <li>
            <a href="https://ibighit.com/bts/kor/discography/detail/butter-2.html" target="_blank">
              <img src="./img/album-butter-o.jpg">
            </a>
          </li>
          <li>
              <a href="https://ibighit.com/bts/kor/discography/detail/be.html" target="_blank">
              <img src="./img/album-be.jpg">
              </a>
          </li>
          <li>
              <a href="https://ibighit.com/bts/kor/discography/detail/butter.html" target="_blank">
                  <img src="./img/album-butter-Y.jpg">
              </a>
          </li>
          <li>
            <a href="https://ibighit.com/bts/kor/discography/detail/proof/index.html" target="_blank">
              <img src="./img/album-proof.jpg">
            </a>
          </li>
          <li>
            <a href="https://ibighit.com/bts/kor/discography/detail/map_of_the_soul-7.html" target="_blank">
              <img src="./img/album-7.jpg">
            </a>
          </li>
          <li>
              <a href="https://ibighit.com/bts/kor/discography/detail/map_of_the_soul-persona.html" target="_blank">
                <img src="./img/album-persona.jpg">
              </a>
            </li>
        </ul>

        <div class="slide-control">
          <div class="control01">
            <label for="slide04" class="left"></label>
            <label for="slide02" class="right"></label>
          </div>
          <div class="control02">
            <label for="slide01" class="left"></label>
            <label for="slide03" class="right"></label>
          </div>
          <div class="control03">
            <label for="slide02" class="left"></label>
            <label for="slide04" class="right"></label>
          </div>
            <div class="control04">
                <label for="slide03" class="left"></label>
                <label for="slide01" class="right"></label>
            </div>
        </div>
      </div>
    </div>

  </div>
  <div class="main-menu">
    <div class="menuwrap">
      <div class="menubox clear-fix">
        <div>
             <a>
             <img src="./img/01.jpeg">
             </a>
        </div>
        <div>
            <a>
                <img src="./img/04.jpg">
            </a>
        </div>
        <div>
                    <a>
                        <img src="./img/05.jpg">
                    </a>
                </div>
        <div>
                    <a>
                        <img src="./img/06.jpg">
                    </a>
                </div>
        <div>
                    <a>
                        <img src="./img/07.jpg">
                    </a>
                </div>
      <div>
                  <a>
                      <img src="./img/08.jpg">
                  </a>
              </div>
        <div>
                    <a>
                        <img src="./img/09.jpg">
                    </a>
                </div>
       <div>
                   <a>
                       <img src="./img/03.jpg">
                   </a>
               </div>
      </div>

    </div>
  </div>

</div>

<%@ include file= "include/footer.jsp" %>
</div>
</body>
</html>
