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
   <link rel="stylesheet" type="text/css" href="/css/board-modif.css"/>
</head>
<!-- custom css -->
<body> <div class="wrap">
    <%@ include file="../include/header.jsp" %>

    <div class="write-container">

        <form id="write-form" action="/board/write" method="post" autocomplete="off" enctype="multipart/form-data">



            <div class="mb-3">
                <label for="writer-input" class="form-label">작성자</label>
                <input type="text" class="form-control" id="writer-input" placeholder="이름" name="writer"
                       maxlength="20" readonly value="${loginUser.name}">
            </div>
            <div class="mb-3">
                <label for="title-input" class="form-label">글제목</label>
                <input type="text" class="form-control" id="title-input" placeholder="제목" name="title">
            </div>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
            </div>

            <!-- 첨부파일 드래그 앤 드롭 영역 -->
            <div class="form-group">
                <div class="fileDrop">
                    <span>Drop Here!!</span>
                </div>
                <div class="uploadDiv">
                    <input type="file" name="files" id="ajax-file" style="display:none;">
                </div>
                <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->
                <div class="uploaded-list">

                </div>
            </div>


            <div class="d-grid gap-2">
                <button id="reg-btn" class="btn btn-dark" type="button">글 작성하기</button>
                <button id="to-list" class="btn btn-warning" type="button">목록으로</button>
            </div>

        </form>

    </div>

    <%@ include file="../include/footer.jsp" %>



</div>
</body>

</html>