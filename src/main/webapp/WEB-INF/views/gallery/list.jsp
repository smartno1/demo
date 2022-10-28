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

       #wrapper .galleryBoard {
            margin: 0 auto;
            /*text-align: center;*/
            background-color: orange;
            width: 1500px;
        }
        #title{
            text-align: center;
        }
        #galleryUl {

            margin: 10px 0;
            padding-left: 50px;
            position: relative;
            box-sizing: border-box;
        }

        #galleryUl li {
            margin-left: 2%;
            margin-top: 20px;

            float: left;
            height: 300px;
            width: 200px;
            overflow: hidden;
            position: relative;
        }
        .userId {
            background-color: rgba(10,10,10,0.5);
            width: inherit;
            z-index: 1;
            position: absolute;
            bottom: 10%;
            color: aqua;
        }
        .text {
            background-color: rgba(10,10,10,0.5);
            width: inherit;
            z-index: 1;
            position: absolute;
            bottom: 1%;
            color: aliceblue;
        }

        #galleryUl li img.img {
            cursor: pointer;

            height: 300px;
        }

       #wrapper .closeUp {
           position: absolute;
           background-color: rgba(0,0,0,0.9);
           top: 0px;
           height:100%;
           width: 100%;
           z-index: -2;

       }
        #wrapper .closeUp.up {
          animation: up linear 0.2s forwards;
        }
        @keyframes up {
            0%{
                z-index: 2;
            }
            100%{
                z-index: 2;
            }
        }
        #wrapper .closeUp .upInBox{
            height: 700px;
            width: 1000px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        #wrapper .closeUp .upInBox .closeDiv {
            position: relative;
            height: 600px;
            width: inherit;
            padding-bottom: 20px;
            border-bottom: 3px solid skyblue;
            margin-bottom: 10px;
        }
        #wrapper .closeUp .upInBox .closeDiv img{
            height: inherit;
            width: inherit;
            object-fit: scale-down;
        }

        #wrapper .closeUp .upInBox .downDiv{
            display: flex;
            justify-content: right;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <div class="galleryBoard">
            <h1 id="title"> Gallery </h1>

            <a href="/upload-form"><button>upload</button></a>
            <div>
                <ul id="galleryUl">
                    <c:forEach var="i" items="${galleries}">
                        <li>
                            <img src="${i.src}"  class="img" data-id=${i.id} alt="">
                            <p class="userId">#${i.userId}</p>
                            <p class="text">${i.text}</p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="closeUp"></div>
    </div>
    <script>

        function upEvent(){
            document.getElementById('galleryUl').onclick = e => {

                if(!e.target.matches('#galleryUl li img')){
                    return;
                }
                console.log(e.target);
                e.target.parentElement
                closeUp(e.target);
            }
        }

        function closeUp(e){
            const $bodyDiv = document.getElementById('wrapper');
            const $div = document.querySelector('.closeUp');

            // 노드를 복사
            // const cloneE = e.cloneNode(true)
            // 타겟 이미지의 src 와 data-id 가져오기
            const src = ''+e.getAttribute('src');
            const id = e.dataset.id;

            $div.innerHTML = `<div class="upInBox">
                                <div class="closeDiv">
                                    <img src=`+src+`>
                                </div>
                                <div class="downDiv">
                                    <a href="/download?id=`+id+`">
                                        <button class="downBtn" style="display: inline-block">
                                            다운로드
                                        </button>
                                    </a>
                                </div>
                            </div>`;
            $div.classList.add('up');


        }

        function downEvent(){
            document.querySelector('.closeUp').onclick = e => {
                if(e.target.matches('.downBtn')){
                    return;
                }
                const $closeUp =  document.querySelector('.closeUp');
                $closeUp.classList.remove('up')
                $closeUp.innerHTML=``;
            }
        }




        (function (){
            upEvent();
            downEvent();

        })();
    </script>


</body>
</html>
