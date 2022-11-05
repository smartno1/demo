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

              <!-- 부트스트랩-->
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
              <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
              <link rel="stylesheet" type="text/css" href="/css/header.css"/>

              <style>
                  a {color: #fff; text-decoration: none; outline: none}
                  a:hover, a:active {text-decoration: none; }
                  .header-wrraper .nav .nav-ul{
                          padding: 0; 
                      }
                  .header-wrraper .nav .nav-ul li{
                          list-style: none;
                      }
                  .wrap{
                      padding-bottom: 150px;
                  }
                  
  
  
                </style>


                <style>
                    div.content-container{
                        padding: 5% 25% 0%;

                    }

                </style>
</head>
<!-- custom css -->
<body>
<div class="wrap">
    <%@ include file="../include/header.jsp" %>

    <div class="content-container">

        <form action="/board/modify" id="modify_orm" method="post">

            <input type="hidden" name="boardNo" value="${board.boardNo}">

            <h1 class="main-title">${board.boardNo}번 게시물</h1>

            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">작성자</label>
                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름" name="writer"
                       value="${board.writer}">
            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput2" class="form-label">글제목</label>
                <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="제목" name="title"
                       value="${board.title}">
            </div>

            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                <textarea name="content" class="form-control" id="exampleFormControlTextarea1"
                          rows="10">${board.content}</textarea>
            </div>


            <div class="btn-group btn-group-lg custom-btn-group" role="group">
                <button id="mod-btn" type="submit" class="btn btn-warning">완료</button>
                <button type="button" id="listBtn"  class="btn btn-dark">목록</button>
            </div>

        </form>

    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>

    (function(){

        $listBtn = document.getElementById("listBtn");
        
        $listBtn.onclick = e =>{
            
            history.go(-2);

        }


    })();


</script>
<%@ include file="../include/footer.jsp" %>
</body>

</html>