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
  <link rel="stylesheet" type="text/css" href="/css/profile-po.css"/>
</head>
<body>
    <div class="wrap">
       <%@ include file= "../include/header.jsp"%>
        <div class="porfile-all">
            <div class="photo-zone">
                <img src="../img/bts-pc.jpg" class="topphoto" alt="BTS사진">
            </div>
          
        </div>
        <div class="ttbox-line">
            <div class="cent">
            <section class="intro valign">
                <h2>
                    ABOUT BTS
                </h2>
    
                <p>
                    2013년 데뷔해 국내외 신인상을 휩쓴 방탄소년단은 명실상부 한국을 대표하는 최정상 보이 그룹으로 성장했다. 전 세계적으로 방탄소년단
                    열풍을 일으키며 ‘21세기 팝 아이콘’으로 불린다.<br>미국 빌보드, 영국 오피셜 차트, 일본 오리콘을 비롯해 아이튠즈, 스포티파이, 애플뮤직 등 세계 유수의 차트 정상에
                    올랐고, 음반 판매량과 뮤직비디오 조회수, SNS 지수 등에서도 독보적인 기록을 써 내려가고 있다. 특히, 방탄소년단은 한 주에 빌보드 ‘핫 100’ 차트와 ‘빌보드
                    200’ 차트 정상을 동시 정복한 최초의 그룹이며, 통산 ‘빌보드 200’ 5차례, ‘핫 100’ 4차례 1위를 차지했다.<br>또한, ‘제63회 그래미 어워드’에서 한국
                    가수 최초로 단독 무대를 펼쳐 ‘빌보드 뮤직 어워드’와 ‘아메리칸 뮤직 어워드’, ‘그래미 어워드’까지 미국 3대 음악 시상식 무대에서 공연하는 기록을 세웠다. 방탄소년단은
                    스타디움 투어를 개최하며 전 세계 콘서트 시장에서도 글로벌 아티스트로서의 입지를 다져 왔으며, UN 연설과 LOVE MYSELF 캠페인 등을 통해 선한 영향력을 실천하고
                    있다
                </p>
            </section>
           </div>
        </div>
             <div class="all-box">
                <div class="bil-boxall">
                    <div class="bar1 billin">
                        <div ><h3>MEMBER</h3></div>
                        <div onClick="document.getElementById('main_temp').style.display='block'"><img src="/img/tapo1.jpg"></div>
                        <div ></div>
                        <div onClick="document.getElementById('main_temp1').style.display='block'"><img src="/img/tapo2.jpg"></div>
                    </div>
                    <div class="bar2 billin">
                        <div onClick="document.getElementById('main_temp2').style.display='block'"><img src="img/tapo3.jpg"></div>
                        <div></div>
                        <div onClick="document.getElementById('main_temp3').style.display='block'"><img src="/img/tapo4.jpg"></div>
                        <div onClick="document.getElementById('main_temp4').style.display='block'"><img src="/img/tapo5.jpg"></div>
                    </div>
                    <div class="bar3 billin">
                        <div></div>
                        <div onClick="document.getElementById('main_temp5').style.display='block'"><img src="/img/tapo6.jpg"></div>
                        <div onClick="document.getElementById('main_temp6').style.display='block'"><img src="/img/tapo7.jpg"></div>
                        <div></div>
                    </div>
                </div>
            </div>
                <%@ include file= "../include/footer.jsp" %>
    </div>
       <div id="main_temp" class="mt">
                        <div class="fg">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;이름 : 김남준<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;활동명 : RM<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;생일 : 09월 12일<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;나이 : 29살<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;성별 : 남<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;소속사 : 빅히트 뮤직<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.getElementById('main_temp').style.display='none'" type="button">창닫기</button></p>
                        </div>
                    </div>

                    <div id="main_temp1" class="mt">

                        <div class="fg">
                            <p> &nbsp;&nbsp;&nbsp;&nbsp;이름 : 김석진<br>
                            <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;활동명 : 진<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;생일 : 12월 04일 <br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;나이 : 31살<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;성별 : 남<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;소속사 : 빅히트 뮤직<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.getElementById('main_temp1').style.display='none'" type="button">창닫기</button></p>
                        </div>
                    </div>
                    <div id="main_temp2" class="mt">

                        <div class="fg">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;이름 : 민윤기<br>
                            <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;활동명 : SUGA<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;생일 : 03월 09일<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;나이 : 30살<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;성별 : 남<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;소속사 : 빅히트 뮤직<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.getElementById('main_temp2').style.display='none'" type="button">창닫기</button></p>
                        </div>
                    </div>
                    <div id="main_temp3" class="mt">

                        <div class="fg">
                            <p> &nbsp;&nbsp;&nbsp;&nbsp;이름 : 정호석<br>
                            <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;활동명 : J-HOPE<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;생일 : 02월 18일<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;나이 : 29살<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;성별 : 남<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;소속사 : 빅히트 뮤직<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.getElementById('main_temp3').style.display='none'" type="button">창닫기</button></p>
                        </div>
                    </div>
                    <div id="main_temp4" class="mt">

                        <div class="fg">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;이름 : 박지민<br>
                            <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;활동명 : 지민<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;생일 : 10월 13일<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;나이 : 28살<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;성별 : 남<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;소속사 : 빅히트 뮤직<br>
                                <hr>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.getElementById('main_temp4').style.display='none'" type="button">창닫기</button></p>
                        </div>
                    </div>
                    <div id="main_temp5" class="mt">
                        <div class="bg"></div>
                        <div class="fg">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;이름 : 김태형<br>
                            <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;활동명 : V<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;생일 : 12월 30일<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;나이 : 28살<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;성별 : 남<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;소속사 : 빅히트 뮤직<br>
                                <hr>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.getElementById('main_temp5').style.display='none'" type="button">창닫기</button></p>
                        </div>
                    </div>
                    <div id="main_temp6" class="mt">

                        <div class="fg">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;이름 : 전정국<br>
                            <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;활동명 : 정국<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;생일 : 09월 01일<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;나이 : 26살<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;성별 : 남<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;소속사 : 빅히트 뮤직<br>
                                <hr>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="document.getElementById('main_temp6').style.display='none'" type="button">창닫기</button></p>
                        </div>
                    </div>
</body>

</html>