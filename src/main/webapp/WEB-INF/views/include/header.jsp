<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="header">
  <div class="header-wrraper">
    <div class="header-top clear-fix">
      <div class="header-top-link">
        <span>인스타</span>
        <span>페이스북</span>
        <span>유투브</span>
      </div>
      <div class="header-top-account">
        <c:if test="${loginUser == null}">
          <a href="/member/sign-in"><span id="login-btn">로그인</span></a>
        </c:if>
        <c:if test="${loginUser != null}">
          <a href="/member/sign-out"><span id="logout-btn">로그아웃</span></a>
        </c:if>
      </div>
    </div>
    <nav class="nav">
      <ul class="nav-ul clear-fix">
        <li>
          <a href="/">
          HOME
          </a>
        </li>
        <li>
        <a href="/profile">
          PROFILE
        </li>
        <li>
        <a href="/schedule">
          SCHEDULE
        </li>
        <li>
          NEWS
        </li>
        <li id="header-logo">
          <span>logo</span>
        </li>
        <li>
        <a href="/board/list">
          BOARD
        </li>
        <li>
          TOUR
        </li>
        <li>
          <a href="/gallery/list">
            GALLERY
          </a>
        </li>
        <li>
          SHOP
        </li>
      </ul>
    </nav>
  </div>
</header>