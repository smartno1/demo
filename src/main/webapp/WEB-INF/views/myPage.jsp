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
                #post_btns{
                    display:none;
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
                    <div class="post_btns" id="post_btns">
                        <div class='fl'>                                                                                       
                            <div class='check_box'>                                                                            
                                <div class='FormInputCheck check_all FormInputCheck--skin'><input id='chk_all' type='checkbox' 
                                        class='input_check'><label for='chk_all' class='label'>                                
                                        전체선택                                                                                  
                                    </label></div>                                                                             
                            </div>                                                                                             
                        </div>                                                                                                 
                        <div class='fr'>                                                                                       
                            <button role='button' id='delBtn' class='BaseButton BaseButton--skinGray size_default' type='button'>                                                        
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
       

        </body>

        </html>