<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-10-27
  Time: 오전 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>upload-form</h1>

    <form action="/upload" method="POST" enctype="multipart/form-data">
        파일 : <input type="file" name="file" ><br>
        파일 설명 : <input type="text" name="fileText"><br>
        <button type="submit">업로드</button>

    </form>
</body>
</html>
