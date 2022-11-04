<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <%@ include file="./include/static-head.jsp" %>


            <title>MyPage</title>
            <style>
                .wrap {
                    margin: 50px auto;
                }
            </style>

            
            <script src="/js/myPage.js" defer>
            </script>
        

        </head>

        <body>




            <div class="wrapper">

                <nav id="myPageNav">

                    <a href="#" class="link_sort myBoard">작성글</a>

                    <a href="#" class="link_sort myReply">작성댓글</a>

                    <a href="#" class="link_sort myProfile">내 정보 수정</a>


                </nav>



                <section class="mypage_api">
                    <div class="member_profile layout_content" id="member_profile">
                       

                    </div>
                    <div class="paginate_area">
                        <div class="pagination">
                            
                        </div>
                    </div>
                </section>






            </div>
      

        </body>

        </html>