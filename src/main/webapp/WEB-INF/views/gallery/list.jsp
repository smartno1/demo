<%@ page import="com.spring.demo.member.domain.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-10-27
  Time: 오전 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"  pageEncoding="UTF-8" %>

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


    <!--    custom css -->
    <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="/css/header.css"/>

    <style>
        .clear-box:after {
            display: block;
            content: '';
            clear: both;
        }
        html, body {
            width: 100%;
            height: 100%;
        }

        #galleryWrap {
            position: relative;
            background: black;
            height: 100%;
            width: 100%;

        }

       #galleryWrap .gallery-board {
            margin: 0 auto;
            /*text-align: center;*/
            /*background-color: orange;*/
            width: 1200px;
            
        }
        #galleryWrap #title{
            text-align: center;
        }
        #galleryWrap #gallery-ul {

            /*background-color: green;*/

            height: 680px;
            margin: 10px 0;
            padding-left: 7%;
            position: relative;
            box-sizing: border-box;
        }

        #gallery-ul li {
            margin-right: 7%;
            margin-top: 10px;
            margin-bottom: 20px;
            /*border-radius: 10px;*/

            float: left;
            height: 300px;
            width: 200px;
            overflow: hidden;
            position: relative;
        }
        #gallery-ul li div {
            background-color: rgba(10,10,10,0.5);
            width: inherit;
            z-index: 1;
            position: absolute;
            bottom: 0;
            color: aqua;
            height: 20%;
            /*padding: 5px 10px;*/
        }
        #gallery-ul li div .user-id {
            /*background-color: rgba(10,10,10,0.5);*/
            /*width: inherit;*/
            /*z-index: 1;*/
            /*position: absolute;*/
            /*bottom: 10%;*/
            color: aqua;
            float: left;
            margin-left: 10px;
            margin-top: 10px
        }
        #gallery-ul li div .likeCnt {
            float: right;
            margin-right: 10px;
            margin-top: 10px;
            border: 1px solid yellow;
        }
        #gallery-ul li div .likeImg{
            width: 30px;
            height: 30px;
            object-fit: contain;
            float: right;
        }

        #gallery-ul li div .text {
            /*background-color: rgba(10,10,10,0.5);*/
            width: inherit;
            z-index: 1;
            position: absolute;
            bottom: 0;
            color: aliceblue;
            margin: 5px;
        }

        #gallery-ul li img.img {
            height: 300px;
            width: 200px;
            object-fit: cover;
            cursor: pointer;

        }

        #galleryWrap .bottom-section div{
           
            /* background-color: red; */


        }
        #galleryWrap .bottom-section div .bottom-ul {
            /* border: 4px solid #000; */
            /* background-color: yellowgreen; */
            width: fit-content;
            height: 50px;
            margin: 0 auto;
            position: relative;
            justify-content: center;

        }
        
        #galleryWrap .bottom-section div .bottom-ul li {
            float: left;
            margin:10px;

        }

       #galleryWrap .close-up {
           position: absolute;
           background-color: rgba(0,0,0,0.9);
           top: 0px;
           height:inherit;
           width: inherit;
           z-index: -2;

       }
        #galleryWrap .close-up.up {
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
        #galleryWrap .close-up .up-in-box{
            height: 700px;
            width: 1000px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        #galleryWrap .close-up .up-in-box .close-div {
            position: relative;
            height: 600px;
            width: inherit;
            padding-bottom: 20px;
            border-bottom: 3px solid rgb(244, 245, 254);
            margin-bottom: 10px;
        }
        #galleryWrap .close-up .up-in-box .close-div img{
            height: inherit;
            width: inherit;
            object-fit: scale-down;
        }

        #galleryWrap .close-up .up-in-box .down-div{
            display: flex;

        }
        #galleryWrap .close-up .up-in-box .down-div .down-user{
            /*background-color: yellow;*/
            position: relative;
        }
        #galleryWrap .close-up .up-in-box .down-div .down-user p{
            font-size: 30px;
            color: aqua;
            /*background-color: blue;*/
            position: relative;
            top: -30%;

        }
        #galleryWrap .close-up .up-in-box .down-div .down-text{
            /*background-color: orange;*/
            position: relative;
            margin-left: 40px;
            margin-right: 20px;
        }
        #galleryWrap .close-up .up-in-box .down-div .down-text .in-text{
            width: 700px;
            height: 80px;
            position: relative;
            top: -20%;
            background-color: red;
            color: #ffffff;
            font-size: 20px;
        }
        #galleryWrap .close-up .up-in-box .down-div{

        }


    </style>
</head>
<body>
<div class="wrap">
    <%@include file="../include/header.jsp"%>
    <div id="galleryWrap">
        <div class="gallery-board">
            <h1 id="title"> Gallery </h1>
            <div>
                <c:if test="${!empty loginUser}">
                    <a href="/upload-form"><button>upload</button></a>
                </c:if>
            </div>
            <div>
                <ul id="gallery-ul" class="clear-box">
                    <c:forEach var="i" items="${galleries}">
                        <li>
                            <img src="${i.src}"  class="img" data-id=${i.galleryNo} alt="">
                            <div >
                                <p class="user-id">#${i.nickname}</p>
                                <p><img class="likeImg" src="/img/like.jpg" alt=""></p>
                                <p class="likeCnt">${i.likeCnt}</p>

                                <p class="text">${i.text}</p>
                            </div>

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
                            <li><a href="/gallery/list?pageNum=${pm.endPage + 1}&amount=${pm.page.amount}">next</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="close-up">
            <div class="up-in-box">
                <div class="close-div">
                    <img alt="">
                </div>
                <div class="down-div">
                    <div class="down-user">
                        <p ></p>
                    </div>
                    <div class="down-text" >
                        <p class="in-text"></P>
                    </div>
                    <div class="down-btn">

                        <button class="go-list" style="display: inline-block">
                            목록으로
                        </button>
                        <button class="down-btn-download" style="display: inline-block">
                            다운로드
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../include/footer.jsp"%>
</div>



    <script>
        <%
          Member loginUser = (Member) request.getSession().getAttribute("loginUser");
          System.out.println(loginUser);
          String nick = loginUser.getNickname();
          %>
        const loginNick = "<%=nick%>"
        console.log(loginNick);
        // 모달창 띄우기 이벤트
        function upEvent(){
            document.getElementById('gallery-ul').onclick = e => {

                if(!e.target.matches('#gallery-ul li img')){
                    return;
                }
                console.log(e.target.parentElement);

                closeUp(e.target.parentElement);
                
            }
        }
        // 모달창에 값넣고 띄우기
        function closeUp(e){

            const $downBtn = document.querySelector('.down-btn');

            // 노드를 복사
            // const cloneE = e.cloneNode(true)
            // 타겟 이미지의 src 와 data-id 가져오기
            const src = ''+e.firstElementChild.getAttribute('src');
            const id = e.firstElementChild.dataset.id;
            const text = e.lastElementChild.lastElementChild.textContent;
            let nickName = e.lastElementChild.firstElementChild.textContent;
            let like = e.lastElementChild.children[2].textContent;
            nickName = nickName.substring(1) ;
            console.log(nickName);
            document.querySelector('.close-div').firstElementChild.setAttribute('src', src);
            document.querySelector('.down-user').firstElementChild.textContent = nickName;
            document.querySelector('.down-text').setAttribute('data-id',id);
            document.querySelector('.in-text').textContent = text;
            if(loginNick && loginNick === nickName) {
                $downBtn.innerHTML = `

                                    <button class="down-btn-mod" style="display: inline-block">
                                       코멘트수정
                                   </button>
                                    <button class="down-btn-del" style="display: inline-block">
                                          삭제
                                   </button>

                                    <button class="go-list" style="display: inline-block">
                                        목록으로
                                    </button>
                                    <button class="down-btn-download" style="display: inline-block">
                                        다운로드
                                    </button>`;
            }
            document.querySelector('.close-up').classList.add('up');

            // 바뀐 모달창에 수정버튼 이벤트걸기
            if(document.querySelector('.down-btn-mod')) {
                modEvent(e);
                delEvent();
            }
            goListEvent();
            downloadEvent();
        }
        // 모달창 없애는 이벤트걸기
        function downEvent(){
            document.querySelector('.close-up').onclick = e => {
                if(!e.target.matches('.go-list') && !e.target.matches('.close-up')){
                    return;
                }
                if(document.querySelector('.confirm-mod')) return;
                goList();
                closeUpDel();

            }
        }
        // 모달창 없애는 기능
        function closeUpDel (){
            const $closeUp =  document.querySelector('.close-up');
            $closeUp.classList.remove('up')
            document.querySelector('.close-div').firstElementChild.setAttribute('src', '');
            document.querySelector('.down-user').firstElementChild.textContent = '';
            document.querySelector('.down-text').setAttribute('data-id','');
            document.querySelector('.in-text').textContent = '';
        //     document.querySelector('.down-btn').innerHTML = `
        //                                             <button class="down-btn-mod" style="display: inline-block">
        //                                                 코멘트수정
        //                                             </button>
        //                                              <button class="down-btn-del" style="display: inline-block">
        //                                                 삭제
        //                                             </button>
        //                                              <button class="down-btn-back" style="display: inline-block">
        //                                                  돌아가기
        //                                              </button>`
        //
        }
        // 모달창 수정버튼 이벤트 걸기
        function modEvent(ee){

            const $mod = document.querySelector('.down-btn-mod').onclick = e => {

                if (!e.target.matches('.down-btn-mod')) return;
                mod(ee);

            }

        }
        // 모달창 수정버튼 기능
        function mod(ee){

            const $text = document.querySelector('.down-text');
            const id = $text.dataset.id
            const text = $text.firstElementChild.textContent;
            $text.innerHTML=`
                            <textarea class="in-text" name="text">`+text+`</textarea>
                            `;

            const $downBtn = document.querySelector('.down-btn');
            $downBtn.innerHTML=`<button type="button" class="confirm-mod" style="display: inline-block">
                                등록
                             </button>
                            <button class="back-mod" style="display: inline-block">
                                취소
                            </button>
                            <button class="go-list" style="display: inline-block">
                                목록으로
                            </button>
                            `;
            backModEvent(text);
            confirmModEvent(ee);
            goListEvent();

        }
        // 수정모드에 취소버튼 이벤트걸기
        function backModEvent(text) {
            document.querySelector('.back-mod').onclick = e => {
                
                if (!e.target.matches('.back-mod')) return;
                backMod(text);
            }
            
        }
        // 수정모드 취소버큰 기능
        function backMod(text){
            const $downBtn = document.querySelector('.down-btn');
            $downBtn.innerHTML=`<button class="down-btn-mod" style="display: inline-block">
                                        코멘트수정
                                    </button>
                                    <button class="down-btn-del" style="display: inline-block">
                                        삭제
                                    </button>
                                    <button class="go-list" style="display: inline-block">
                                            목록으로
                                    </button>
                                    <button class="down-btn-download" style="display: inline-block">
                                            다운로드
                                    </button>
                                `;
            const $text = document.querySelector('.down-text');
            $text.innerHTML=`
                            <p class="in-text">`+text+`</P>
                            `;
            // 취소 이후 버튼에 이벤트 다시걸기
            modEvent();
            delEvent();
            downloadEvent();

        }
        // 등록버튼에 이벤트 걸기
        function confirmModEvent(ee){
            document.querySelector('.confirm-mod').onclick = e => {
                
                if (!e.target.matches('.confirm-mod')) return;
                if(confirm("코멘트를 수정합니다.")) {
                    confirmMod(ee);
                }
            }
        }
        // 등록버튼 기능 - 비동기로 수정 보내기
        function confirmMod(ee){
            const newText = document.querySelector('.in-text').value;
            // console.log(newText)
            const $downText = document.querySelector('.down-text');
            const galleryNo = $downText.dataset.id
            const reqInfo = {
                method: 'PUT',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify({
                    text: newText,
                    galleryNo: galleryNo
                })
            };


            fetch('/api/gallery/mod/' + galleryNo, reqInfo)

                .then(res => res.text())
                .then(msg => {
                    if (msg === 'mod-success') {
                        alert('수정 성공!!');

                    } else {
                        alert('수정 실패!!');
                    }
                });
            backMod(newText);


        }
        // 목록으로 버튼 이벤트 및 기능
        function goListEvent(){
            document.querySelector('.go-list').onclick = e => {
                if(!e.target.matches('.go-list')) return;
                goList();
            }
        }
        function goList(){
            const galleryNo = document.querySelector('.down-text').dataset.id;

            closeUpDel();
            location.href = "/gallery/list?galleryNo=" + galleryNo +
                "&pageNum=" + ${pm.page.pageNum}+
                    "&amount=" + ${pm.page.amount};

        }
        function delEvent(){
            document.querySelector('.down-btn-del').onclick = e => {
                if(!e.target.matches('.down-btn-del')) return;
                console.log(e.target);
                if(confirm("갤러리를 삭제합니다.")) {

                    const url = location.href
                    const index = url.indexOf("pageNum");
                    const pageNumAmount = url.substring(index);

                    const galleryNo = document.querySelector('.down-text').dataset.id;
                    location.href = "/gallery/del?galleryNo=" + galleryNo +
                                    "&pageNum=" + ${pm.page.pageNum}+
                                    "&amount=" + ${pm.page.amount};
                }
            }
        }

        // 다운로드 이벤트걸기
        function downloadEvent() {
            document.querySelector('.down-btn-download').onclick = e => {
                if(!e.target.matches('.down-btn-download')) return;

                downLoad();
            }
        }
        // 다운로드 기능
        function downLoad() {
            const galleryNo = document.querySelector('.down-text').dataset.id;
            const ghref = '/gallery/api/loadFile?id='+galleryNo;
            location.href=ghref;
            console.log("location"- {}, location.href);
        }
        (function (){
            upEvent();
            downEvent();
        })();
    </script>


</body>
</html>
