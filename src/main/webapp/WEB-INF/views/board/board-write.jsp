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
   <link rel="stylesheet" type="text/css" href="/css/board-write.css"/>
   <%@ include file="../include/static-head.jsp" %>
</head>
<!-- custom css -->
<body>

    <div class="wrap">
        <%@ include file="../include/header.jsp" %>

        <div class="content-container">

            <form action="/board/modify" method="post">

                <input type="hidden" name="boardNo" value="${board.boardNo}">

                <h1 class="main-title">${board.boardNo}번 게시물</h1>

                <div class="mb-3 box-ttj ">
                    <label for="exampleFormControlInput1" class="form-label ">작성자</label>
                    <input type="text" class="form-control" id="writer-input" placeholder="이름" name="writer"
                        value="${board.writer}">
                </div>
                <div class="mb-3 box-ttj mb-4">
                    <label for="exampleFormControlInput2" class="form-label ">글제목</label>
                    <input type="text" class="form-control" id="title-input" placeholder="제목" name="title"
                        value="${board.title}">
                </div>

                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label box-tt">내용</label>
                    <textarea name="content" class="form-control" id="exampleFormControlTextarea1"
                        rows="10">${board.content}</textarea>
                </div>


                 <div class="d-grid gap-2">
                  <button id="reg-btn" class="btn btn-dark" type="button">글 작성하기</button>
                  <button id="to-list" class="btn btn-warning" type="button">목록으로</button>
                 </div>

            </form>

        </div>
     <%@ include file="../include/footer.jsp" %>
    </div>
     </div>


        <script>
            // 게시물 등록 입력값 검증 함수
            function validateFormValue() {
                // 이름입력태그, 제목 입력태그
                const $writerInput = document.getElementById('writer-input');
                const $titleInput = document.getElementById('title-input');
                let flag = false; // 입력 제대로하면 true로 변경



                if ($writerInput.value.trim() === '') {
                    alert('작성자는 필수값입니다~');
                } else if ($titleInput.value.trim() === '') {
                    alert('제목은 필수값입니다~');
                } else {
                    flag = true;
                }

                console.log('flag:', flag);

                return flag;
            }

            // 게시물 입력값 검증
            const $regBtn = document.getElementById('reg-btn');

            $regBtn.onclick = e => {
                // 입력값을 제대로 채우지 않았는지 확인
                if (!validateFormValue()) {
                    return;
                }

                // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
                const $form = document.getElementById('write-form');
                $form.submit();
            };


            //목록버튼 이벤트
            const $toList = document.getElementById('to-list');
            $toList.onclick = e => {
                location.href = '/board/list';
            };
        </script>
</body>

</html>