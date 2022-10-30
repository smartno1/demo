<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>프로필</title>
    <style type="text/css">
        html,body {
            min-height: 100px;
            justify-content: center;
            align-items: center;
            background-color: mediumpurple;
            display: flex;
        }
        .container {
            width: 1200px;
            height: 1000px;
            /*border: 1px solid black;*/
            background-color: mediumpurple;
            display: flex;
        }

        .img1 {
            width: 80%;
            position: absolute;
            left: 46%;
            bottom: 500px;
            transform: translateX(-50%);
        }
        .img2 {
            width: 80%;
            position: absolute;
            left: 77%;
            bottom: 500px;
            transform: translateX(-50%);
        }
        .img3 {
            width: 80%;
            position: absolute;
            left: 110%;
            bottom: 500px;
            transform: translateX(-50%);
        }
        .img4 {
            width: 80%;
            position: absolute;
            left: 46%;
            bottom: 90px;
            transform: translateX(-50%);
        }
        .img5 {
            width: 55%;
            position: absolute;
            left: 65%;
            bottom: 90px;
            transform: translateX(-50%);
        }
        .img6 {
            width: 90%;
            position: absolute;
            left: 115%;
            bottom: 90px;
            transform: translateX(-50%);
        }
        .img7 {
            width: 90%;
            position: absolute;
            left: 83%;
            bottom: -300px;
            transform: translateX(-50%);
        }
        .mt {position:fixed;_position:absolute;top:10px;left:10px;width:100%;height:100%;display:none; margin: 10px;}
        .mt .bg {position:fixed;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
        .mt .fg {position:fixed;top:50%;left:50%;width:360px;height:160px;margin:-100px 0 0 -200px;padding:20px;border:3px solid #ccc;background:#fff;}
    </style>
</head>
<body>
    <div class="container">
        <div class="img1" width="400px" height="300px" onClick="document.getElementById('main_temp').style.display='block'">
            <img  src="../main/resources/static/img/진.jpg" alt="진" style=" background: center / center cover ;"></div>
                <div class="img2" width="300px" height="300px" onClick="document.getElementById('main_temp1').style.display='block'"><img src="/img/제이홉.jpg" alt="제이홉"></div>
                <div class="img3" width="300px" height="300px" onClick="document.getElementById('main_temp2').style.display='block'"><img src="/img/슈가.jpg" alt="슈가"></div>
                <div class="img4" width="300px" height="300px" onClick="document.getElementById('main_temp3').style.display='block'"><img src="/img/rm.jpg" alt="rm"></div>
                <div class="img5" width="300px" height="300px" onClick="document.getElementById('main_temp4').style.display='block'"><img src="/img/지민.jpg" alt="지민"></div>
                <div class="img6" width="300px" height="300px" onClick="document.getElementById('main_temp5').style.display='block'"><img src="/img/뷔.jpg" alt="뷔"></div>
                <div class="img7" width="300px" height="300px" onClick="document.getElementById('main_temp6').style.display='block'"><img src="/img/정국.jpg" alt="정국"></div>
</div>
<div id="main_temp" class="mt" role="dialog" aria-labelledby="title-dialog" aria-describedby="desc-txt" aria-modal="true">
    <div class="bg"></div>
    <div class="fg">
        <p> 이름 : 김석진<br>
            활동명 : 진<br>
            생일 : 12월 04일 <br>
            나이 : 31살<br>
            성별 : 남<br>
            소속사 : 빅히트 뮤직<br>
            <button onclick="document.getElementById('main_temp').style.display='none'" type="button">창닫기</button></p>
    </div>
</div>
<div id="main_temp1" class="mt">
    <div class="bg"></div>
    <div class="fg">
        <p> 이름 : 정호석<br>
            활동명 : J-HOPE<br>
            생일 : 02월 18일<br>
            나이 : 29살<br>
            성별 : 남<br>
            소속사 : 빅히트 뮤직<br><button onclick="document.getElementById('main_temp1').style.display='none'" type="button">창닫기</button></p>
    </div>
</div>
<div id="main_temp2" class="mt">
    <div class="bg"></div>
    <div class="fg">
        <p>이름 : 민윤기<br>
            활동명 : SUGA<br>
            생일 : 03월 09일<br>
            나이 : 30살<br>
            성별 : 남<br>
            소속사 : 빅히트 뮤직<br><button onclick="document.getElementById('main_temp2').style.display='none'" type="button">창닫기</button></p>
    </div>
</div>
<div id="main_temp3" class="mt">
    <div class="bg"></div>
    <div class="fg">
        <p>이름 : 김남준<br>
            활동명 : RM<br>
            생일 : 09월 12일<br>
            나이 : 29살<br>
            성별 : 남<br>
            소속사 : 빅히트 뮤직<br><button onclick="document.getElementById('main_temp3').style.display='none'" type="button">창닫기</button></p>
    </div>
</div>
<div id="main_temp4" class="mt">
    <div class="bg"></div>
    <div class="fg">
        <p>이름 : 박지민<br>
            활동명 : 지민<br>
            생일 : 10월 13일<br>
            나이 : 28살<br>
            성별 : 남<br>
            소속사 : 빅히트 뮤직<br><button onclick="document.getElementById('main_temp4').style.display='none'" type="button">창닫기</button></p>
    </div>
</div>
<div id="main_temp5" class="mt">
    <div class="bg"></div>
    <div class="fg">
        <p>이름 : 김태형<br>
            활동명 : V<br>
            생일 : 12월 30일<br>
            나이 : 28살<br>
            성별 : 남<br>
            소속사 : 빅히트 뮤직<br><button onclick="document.getElementById('main_temp5').style.display='none'" type="button">창닫기</button></p>
    </div>
</div>
<div id="main_temp6" class="mt">
    <div class="bg"></div>
    <div class="fg">
        <p>이름 : 전정국<br>
            활동명 : 정국<br>
            생일 : 09월 01일<br>
            나이 : 26살<br>
            성별 : 남<br>
            소속사 : 빅히트 뮤직<br><button onclick="document.getElementById('main_temp6').style.display='none'" type="button">창닫기</button></p>
    </div>
</div>
</body>
</html>