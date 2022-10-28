<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-10-25
  Time: 오후 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="" method="POST">
    id: <input type="text" name="userId" value="${input.userId}">
    password: <input type="password" name="password" value="${input.password}">
    <button type="submit">로그인</button>
    <a href="/"><button type="button">메인으로</button></a>
</form>
    <p>${msg}</p>
</body>
</html>
