<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta charset="utf-8">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
            <title>MyPage</title>
            <style>
                .wrap {
                    margin: 50px auto;
                }

                #post_btns {
                    display: none;
                }
            </style>


            <script src="/js/myPage.js" defer>
            </script>
            <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
            <link rel="stylesheet" type="text/css" href="/css/header.css"/>
            <style>
                a {color: #fff; text-decoration: none; outline: none}
                a:hover, a:active {text-decoration: none; }
              </style>


        </head>

        <body>




            <div class="wrapper">
                <%@ include file="include/header.jsp" %>

                    <div class="section body">
                        <nav id="myPageNav" class="nav flex-column nav-pills">

                        <a href="#" class="nav-link active myBoard" aria-current="page">작성글</a>

                        <a href="#" class="nav-link myReply">작성댓글</a>

                        <a href="#" class="nav-link myProfile">내 정보 수정</a>


                        </nav>



                        <section class="mypage_api">
                            <div class="member_profile layout_content" id="member_profile">


                            </div>
                            <div class="post_btns" id="post_btns">
                                <div class='fl'>
                                    <div class='check_box'>
                                        <div class='FormInputCheck check_all FormInputCheck--skin'><input id='chk_all'
                                                type='checkbox' class='input_check'><label for='chk_all' class='label'>
                                                전체선택
                                            </label></div>
                                    </div>
                                </div>
                                <div class='fr'>
                                    <button role='button' id='delBtn'
                                        class='BaseButton BaseButton--skinGray size_default' type='button'>
                                        삭제

                                    </button>
                                    <a href='/board/write' role='button'
                                        class='BaseButton BaseButton--skinGray size_default'>
                                        <span class='BaseButton__txt'>
                                            글쓰기
                                        </span>
                                    </a>
                                </div>


                            </div>
                            <div class="paginate_area">
                                <div class="pagination">

                                </div>
                            </div>
                        </section>

                    </div>


                    <%@ include file="include/footer.jsp" %>

            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        </body>

        </html>