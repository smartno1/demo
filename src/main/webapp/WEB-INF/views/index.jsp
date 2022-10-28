<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-10-25
  Time: 오후 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <h1>${user.userId} 하이하이</h1>
    <div id="indexBtn">

        <c:if test="${empty user}">
            <a href="/account/join"><button type="button">가입</button></a>
            <a href="/account/login" ><button type="button">로그인</button></a>
        </c:if>
        <c:if test="${not empty user}">
            <a href="/account/logout"><button id='logout'>로그아웃</button></a>
        </c:if>
        <a href="/gallery/list"><button type="button">갤러리</button></a>

    </div>

    <script>




    </script>
</body>
</html>
