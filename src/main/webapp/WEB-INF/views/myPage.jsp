<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta charset="utf-8">
            <title>MyPage</title>




            <!-- reset css -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

            <!-- 부트스트랩-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
                crossorigin="anonymous">
            <link rel="stylesheet" type="text/css" href="/css/footer.css" />
            <link rel="stylesheet" type="text/css" href="/css/header.css" />
            <script src="/js/myPage.js" defer></script>
            <style>
                a {
                    color: #fff;
                    text-decoration: none;
                    outline: none
                }

                a:hover,
                a:active {
                    text-decoration: none;
                }

                .header-wrraper .nav .nav-ul {
                    padding: 0;
                }

                .header-wrraper .nav .nav-ul li {
                    list-style: none;
                }

                .wrap {}
            </style>



            <style>
                a:hover,
                a:active {
                    text-decoration: underline;
                }


                #content-container {

                    background: #f1f3f5;
                    height: 100%;

                }

                .section_body {
                    position: relative;
                    height: 100%;
                }


                .nav_section {
                    height: 100%;
                    width: 20%;
                    background: #f1f3f5;
                    height: 100%;
                    float: left;


                }

                .nav_section a {

                    text-align: center;
                    margin: 40px 40px 40px 80px;

                }



                #content-container section.mypage_api {

                    float: left;
                    background: white;
                    width: 70%;



                    padding: 60px 150px 30px 80px;



                }

                .member_profile {}


                col {
                    width: 200px;
                }

                .member_profile th {
                    text-align: center;
                    font-weight: bold;
                    font-size: 18px;
                }

                .member_profile tr {
                    border-bottom: 1px solid lightgray;



                }


                .member_profile tr td {

                    height: 40px;

                    line-height: 40px;
                    font-size: 14px;

                }

                .member_profile tr td.td_article {
                    width: 65%;

                }

                .member_profile tr td.td_article div {
                    display: inline-block;
                    font-size: 14px;



                }

                .member_profile tr td.td_article div.check_box {
                    margin-left: 15px;
                    width: 5%;
                }

                .member_profile tr td.td_article div.board-number {
                    color: gray;
                    width: 10%;
                    text-align: center;
                    margin-right: 20px;

                }

                .member_profile tr td.td_article div.board-list {

                    margin-left: 10px;

                }

                .member_profile tr td.td_article div.board-list .inner_list a.article {
                    font-weight: bold;
                    font-size: 18px;
                    color: black;


                }


                .member_profile tr td.td_article div.board-list .inner_list a.cmt {

                    color: red;
                }


                .member_profile tr td.td_date {
                    text-align: center;
                    width: 10%;

                }

                .member_profile tr td.td_view {
                    text-align: center;

                }

                .member_profile tr td.td_like {
                    text-align: center;

                }



                .member_profile .article_reply {

                    margin-bottom: 10px;


                }



                .member_profile .article_reply tr {}

                .member_profile .article_reply tr td {

                    height: 90px;

                }


                .member_profile .article_reply tr a {
                    display: inline-block;

                    color: black;


                }

                .member_profile .article_reply tr .member_profile .article_reply tr a {



                    margin-left: 20px;


                }

                .member_profile .article_reply tr li {

                    list-style: none;




                }


                .member_profile .article_reply tr a .inner_list {
                    margin-right: 50px;
                    font-size: 18px;

                }

                .member_profile .article_reply tr a .reply_date {
                    color: gray;
                    font-size: 14px;

                }

                .member_profile .article_reply tr a .reply_title {
                    color: gray;
                    font-size: 16px;

                }



                .member_profile .article_reply tr .td_article .check_box {

                    margin-right: 50px;


                }

                .member_profile .article_reply tr .td_article .check_box .FormInputCheck {
                    position: relative;
                    top: -70px;



                }

                .member_profile .article_reply tr .td_article .check_box .FromInputCheck input {}

                .member_profile .article_reply tr .td_article .td_like {

                    font-size: 16px;
                    font-weight: bold;
                }

                #post_btns{
                    display: none;
                }


                .mypage_api .post_btns {}

                .mypage_api .post_btns div {

                    display: inline-block;
                    margin-bottom: 10px;

                }

                .mypage_api .post_btns div.fl {
                    margin-left: 15px;
                }

                .mypage_api .post_btns div.fl label {
                    margin-left: 10px;
                }

                .mypage_api .post_btns div.fr {
                    margin-right: 20px;
                    float: right;

                }

                .paginate_area {}

                .paginate_area .pagination {
                    margin: 0 auto;
                    width: fit-content;

                }

                #checkPassword{
                    width: 60%;
                    height: 500px;  

                    margin-top: 20px;

                    border-radius: 25px;
                    border: 1px solid #000;
                    background: white;

                   padding-top: 150px;

                    margin: 0 auto;
                    display: none;  
                }

                #validatePasswordForm{

                    
                    width: 60%;
                    height: 100px;
                    margin: 0 auto;
                    
                    
                }



                .blind {
                    display: none;
                }
            </style>

        </head>

        <body>




            <div class="wrap">
                <%@ include file="include/header.jsp" %>
                    <div id="content-container" class="content-container">
                        <div class="section_body clear-fix">
                            <section class="nav_section">
                                <nav id="myPageNav" class="nav flex-column nav-pills">

                                    <a href="#" class="nav-link active board" aria-current="page">작성글</a>

                                    <a href="#" class="nav-link reply">작성댓글</a>

                                    <a href="#" class="nav-link profile">내 정보 수정</a>


                                </nav>
                            </section>

                            <section id="checkPassword">
                                <form action="/member/modify" name="validatePasswordForm"
                                    id="validatePasswordForm" method="post">

                                    <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                                        <tr>
                                            <td style="text-align: left">
                                                <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
                                                        id="pwChk"></span></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="password" size="17" maxlength="20" id="password"
                                                    name="password" class="form-control tooltipstered" maxlength="20"
                                                    required="required" aria-required="true"
                                                    style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: center; colspan: 2;">
                                                <input type="button" value="확인" class="btn form-control tooltipstered"
                                                    id="checkPw-btn"
                                                    style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
                                            </td>
                                        </tr>
                                    </table>

                                </form>

                            </section>



                            <section class="mypage_api">
                                <div class="member_profile layout_content" id="member_profile">


                                </div>
                                <div class="post_btns clear-fix" id="post_btns">
                                    <div class='fl'>
                                        <div class='check_box'>
                                            <div class='FormInputCheck check_all FormInputCheck--skin'><input
                                                    id='chk_all' type='checkbox' class='input_check'><label
                                                    for='chk_all' class='label'>
                                                    전체선택
                                                </label></div>
                                        </div>
                                    </div>
                                    <div class='fr'>
                                        <button role='button' id='delBtn' class='btn btn-primary' type='button'>
                                            삭제

                                        </button>
                                        <a href='/board/write' role='button' class='btn btn-primary'>
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

                    </div>


            </div>
            <%@ include file="include/footer.jsp" %>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
                    crossorigin="anonymous"></script>
        </body>

        </html>