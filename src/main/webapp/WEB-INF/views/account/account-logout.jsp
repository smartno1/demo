<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-10-25
  Time: 오후 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
      session.invalidate();
    %>
    <c:redirect url="/account/inedx.jsp"></c:redirect>
</body>
</html>
