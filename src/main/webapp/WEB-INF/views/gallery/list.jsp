<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-10-27
  Time: 오전 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .clear-box {
            display: block;
            content: '';
            clear: both;
        }
        html, body {
            width: 100%;
            height: 100%;
        }

        #wrapper {
            position: relative;
            background-color: #ffffff;
            height: 100%;
            width: 100%;

        }

       #wrapper .gallery-board {
            margin: 0 auto;
            /*text-align: center;*/
            background-color: orange;
            width: 1500px;
        }
        #title{
            text-align: center;
        }
        #gallery-ul {

            margin: 10px 0;
            padding-left: 50px;
            position: relative;
            box-sizing: border-box;
        }

        #gallery-ul li {
            margin-left: 2%;
            margin-top: 20px;

            float: left;
            height: 300px;
            width: 200px;
            overflow: hidden;
            position: relative;
        }
        #gallery-ul li .user-id {
            background-color: rgba(10,10,10,0.5);
            width: inherit;
            z-index: 1;
            position: absolute;
            bottom: 10%;
            color: aqua;
        }
        #gallery-ul li .text {
            background-color: rgba(10,10,10,0.5);
            width: inherit;
            z-index: 1;
            position: absolute;
            bottom: 1%;
            color: aliceblue;
        }

        #gallery-ul li img.img {
            cursor: pointer;
            height: 300px;
        }

        .bottom-section {
            width: inherit;
            background-color: red;
            position: absolute;
            bottom: 10%;

        }
        .bottom-ul {
            background-color: yellowgreen;
            position: relative;
            margin: 0 auto;

        }
        
        .bottom-ul li {
            float: left;
        }

       #wrapper .close-up {
           position: absolute;
           background-color: rgba(0,0,0,0.9);
           top: 0px;
           height:inherit;
           width: inherit;
           z-index: -2;

       }
        #wrapper .close-up.up {
          z-index: 2;
        }
        @keyframes up {
            0%{
                z-index: 2;
            }
            100%{
                z-index: 2;
            }
        }
        #wrapper .close-up .up-in-box{
            height: 700px;
            width: 1000px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        #wrapper .close-up .up-in-box .close-div {
            position: relative;
            height: 600px;
            width: inherit;
            padding-bottom: 20px;
            border-bottom: 3px solid rgb(244, 245, 254);
            margin-bottom: 10px;
        }
        #wrapper .close-up .up-in-box .close-div img{
            height: inherit;
            width: inherit;
            object-fit: scale-down;
        }

        #wrapper .close-up .up-in-box .down-div{
            display: flex;

        }
        #wrapper .close-up .up-in-box .down-div .down-user{
            /*background-color: yellow;*/
            position: relative;
        }
        #wrapper .close-up .up-in-box .down-div .down-user p{
            font-size: 30px;
            color: aqua;
            /*background-color: blue;*/
            position: relative;
            top: -30%;

        }
        #wrapper .close-up .up-in-box .down-div .down-text{
            /*background-color: orange;*/
            position: relative;
            margin-left: 40px;
            margin-right: 20px;
        }
        #wrapper .close-up .up-in-box .down-div .down-text .in-text{
            width: 700px;
            height: 80px;
            position: relative;
            top: -20%;
            background-color: red;
            color: #ffffff;
            font-size: 20px;
        }
        #wrapper .close-up .up-in-box .down-div{

        }


    </style>
</head>
<body>
    <div id="wrapper">
        <div class="gallery-board">
            <h1 id="title"> Gallery </h1>

            <a href="/upload-form"><button>upload</button></a>
            <div>
                <ul id="gallery-ul" class="clear-box">
                    <c:forEach var="i" items="${galleries}">
                        <li>
                            <img src="${i.src}"  class="img" data-id=${i.id} alt="">
                            <p class="user-id">#${i.userId}</p>
                            <p class="text">${i.text}</p>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <%--갤러리 하단--%>
            <div class="bottom-section">
                <div>
                    <ul class="bottom-ul">
                        <%-- 이전 버튼 --%>
                        <c:if test="${pm.prev}">
                            <li><a href="/gallery/list?pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}">prev</a></li>
                        </c:if>

                        <%-- 페이지 버튼 --%>
                        <c:forEach var="i" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                            <li>
                                <a href="/gallery/list?pageNum=${i}&amount=${pm.page.amount}">${i}</a>
                            </li>
                        </c:forEach>

                        <%--다음 버튼--%>
                        <c:if test="${pm.next}">
                            <li><a href="/gallery/list?pageNum=${pm.beginPage + 1}&amount=${pm.page.amount}">next</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="close-up"></div>
    </div>
    <script>

        function upEvent(){
            document.getElementById('gallery-ul').onclick = e => {

                if(!e.target.matches('#gallery-ul li img')){
                    return;
                }
                console.log(e.target.parentElement);

                closeUp(e.target.parentElement);
            }
        }

        function closeUp(e){
            const $bodyDiv = document.getElementById('wrapper');
            const $div = document.querySelector('.close-up');

            // 노드를 복사
            // const cloneE = e.cloneNode(true)
            // 타겟 이미지의 src 와 data-id 가져오기
            const src = ''+e.firstElementChild.getAttribute('src');
            const id = e.firstElementChild.dataset.id;
            const text = e.lastElementChild.textContent;
            let userId = e.children[1].textContent;
            userId = userId.substring(1) ;

            $div.innerHTML = `<div class="up-in-box">
                                <div class="close-div">
                                    <img src=`+src+` alt="">
                                </div>
                                <div class="down-div">
                                    <div class="down-user">
                                        <p >`+userId+`</p>
                                    </div>
                                    <div class="down-text">
                                        <p class="in-text">`+text+`</P>
                                    </div>
                                    <div>
                                        <a href="">
                                            <button class="down-btn-mod" style="display: inline-block">
                                                코멘트수정
                                            </button>
                                        </a>
                                        <a>
                                            <button class="down-btn-del" style="display: inline-block">
                                                삭제
                                            </button>
                                        </a>
                                        <a>
                                            <button class="down-btn-back" style="display: inline-block">
                                                돌아가기
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>`;
            $div.classList.add('up');

            modEvent();

        }

        function downEvent(){
            document.querySelector('.close-up').onclick = e => {
                if(!e.target.matches('.down-btn-back') && !e.target.matches('.close-up')){
                    return;
                }
                closeUpDel();
            }
        }

        function closeUpDel (){
            const $closeUp =  document.querySelector('.close-up');
            $closeUp.classList.remove('up')
            $closeUp.innerHTML=``;
        }

        function modEvent(){
            const $mod = document.querySelector('.down-btn-mod').onclick = e => {
                if (!e.target.matches('.down-btn-mod')) return;
                mod();
            }

        }
        function mod(){
            const $text = document.querySelector('.down-text');
            const text = $text.firstElementChild.textContent;
            $text.innerHTML=`<form action="/upload/modify">
                                <input class="in-text" type="text" name="text" value=`+text+`>
                                <button type="submit">수정</button>
                              </form>
                                <button type="button">취소</button>`;
            document.$text.lastElementChild.onclick = e => {
            $text.innerHTML=`<p class="in-text">`+text+`</P>`;
            }
        }



        (function (){
            upEvent();
            downEvent();


        })();
    </script>


</body>
</html>
