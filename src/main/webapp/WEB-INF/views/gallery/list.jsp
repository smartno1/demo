<%@ page import="com.spring.demo.member.domain.Member" %>
<%@ page import="com.spring.demo.gallery.domain.Gallery" %>
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
            padding-left: 0;
            position: relative;
            box-sizing: border-box;
        }

        #gallery-ul li {
            margin-right: 0;
            margin-top: 0;
            margin-bottom: 0x;
            /*border-radius: 10px;*/

            float: left;
            height: 300px;
            width: 400px;
            overflow: hidden;
            position: relative;
        }
        #gallery-ul li img:hover {
            animation: select  0.2s linear forwards
        }
        #gallery-ul li img:active{
            animation: selected 2ms linear forwards;
        }
        @keyframes select {

            0%{ z-index: 20;}
            100%{
                scale: 1.1;

                z-index:20;
            }
        }
        .album-slide .slidelist > li:active {
            animation: selected 2ms linear forwards;
        }
        @keyframes selected {
            100% { scale: 0.95;}
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
        #gallery-ul li div .writer {
            /*background-color: rgba(10,10,10,0.5);*/
            /*width: inherit;*/
            /*z-index: 1;*/
            /*position: absolute;*/
            /*bottom: 10%;*/
            color: aqua;
            float: left;
            margin-left: 10px;
            margin-top: 5px
        }
        #gallery-ul li div .likeCnt {
            float: right;
            margin-right: 5px;
            margin-top: 5px;
            font-size: 20px;

            color: yellow;
            /*border: 1px solid yellow;*/
        }
        #gallery-ul li div .likeImg{
            margin-top: 2px;
            width: 30px;
            height: 30px;
            object-fit: contain;
            float: right;
        }

        #gallery-ul li div .text {
            /*background-color: red;*/
            width: 190px;
            height: 20px;
            z-index: 1;
            position: absolute;
            bottom: 5px;
            color: aliceblue;
            margin: 0 5px;
            word-break: break-all;
            overflow: hidden;
            line-height: 20px;
        }

        #gallery-ul li img.img {
            height: 300px;
            width: 400px;
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
           background-color: rgba(0,0,0,0.8);
           top: 0;
           height:inherit;
           width: inherit;
           z-index: -2;

       }
        #galleryWrap .close-up.up, .upLoad.up {
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
            /*background: red;*/
            height: 760px;
            width: 1000px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        #galleryWrap .close-up .up-in-box .close-div {
            /*position: relative;*/
            height: 560px;
            width: inherit;
            padding-bottom: 10px;
            border-bottom: 3px solid rgb(244, 245, 254);
            margin-bottom: 15px;
        }
        #galleryWrap .close-up .up-in-box .close-div img{
            height: inherit;
            width: inherit;
            object-fit: scale-down;
        }

        #galleryWrap .close-up .up-in-box .down-div{
            display: flex;
            /*border: 1px solid blue;*/
            height: 120px;
            width: 96%;
            margin: 0 auto;

        }
        #galleryWrap .close-up .up-in-box .down-div .down-user{
            /*background-color: yellow;*/
            position: relative;
            height: 100px;
        }
        #galleryWrap .close-up .up-in-box .down-div .down-user p{
            font-size: 30px;
            color: aqua;
            /*background-color: blue;*/
            width: 200px;
            /*height: 100px;*/
            position: relative;
            /*top: -10%;*/

            text-align: center;
        }
        #galleryWrap .close-up .up-in-box .down-div .down-text{
            /*background-color: orange;*/
            width: 500px;
            position: relative;
            margin-left: 40px;
            margin-right: 20px;
        }
        #galleryWrap .close-up .up-in-box .down-div .down-text .in-text{
            width: 490px;
            height: 110px;
            position: relative;
            /*top: -20%;*/
            background-color: rgba(0,0,0,0);
            color: #ffffff;
            font-size: 20px;
            font-weight: bold;
            word-break: break-all;

            resize: none;
            border: none;
            border-radius: 10px;
        }
        #galleryWrap .close-up .up-in-box .down-div .down-text .in-text.border{
            border: 2px solid white;
        }
        #galleryWrap .close-up .up-in-box .down-div .down-btn{
            width: 100px;
        }
        #galleryWrap .close-up .up-in-box .down-div .up-like{
            width: 100px;
            height: 100px;
        }
        #galleryWrap .close-up .up-in-box .down-div .up-likeCnt {
            /*background: yellow;*/
            height: 30px;
            width: 100px;

            text-align: center;
            font-size: 30px;
            color: yellow;

        }
        #galleryWrap .close-up .up-in-box .down-div .up-likeCnt img {
            width: 30px;
            height: 30px;
        }
        #galleryWrap .close-up .up-in-box .down-div .likeBtn button{
            width: 100px;
            height: 50px;
            font-size: 35px;
            margin-top: 10px;
        }
        #galleryWrap .close-up #pre-btn {
            position: absolute;
            top: 35%;
            left: 15%;
            transform: translate(-50%,-50%);

        }
        #galleryWrap .close-up #next-btn {
            position: absolute;
            top: 35%;
            right: 2%;
            transform: translate(-50%,-50%);
        }
        #galleryWrap .close-up #pre-btn:hover{
            top:32%;
        }
        #galleryWrap .close-up #pre-btn:active{
            top:35%
        }
        #galleryWrap .close-up #next-btn:hover{
            top:32%;
        }
        #galleryWrap .close-up #next-btn:active{
            top:35%
        }
        /* ================ 업로드 ===========*/
        .upLoad {
            width: 500px;
            height: 300px;
            border: 2px solid black;
            font-size: 30px;
            text-align: center;
            background: blueviolet;

            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%,-50%);
            z-index: -1;
        }
        #upload-form{
            width: 400px;
            height: 260px;
            /*border: 2px solid red;*/
            margin: 0 auto;

        }
        #upload-form #file-input {
            width: 350px;
            height: 30px;
            display: block;
            margin: 10px;
            /*border: 2px solid green;*/
        }
        #upload-form #checkLog {
            /*border: 2px solid blue;*/
            display: block;
            font-size: 20px;
            width: 400px;
            height: 50px;
        }
        #upload-form:nth-child(2){
            display: inline-block;
            font-size: 30px;

            line-height: 40px;
            /*background: red;*/
        }
        #upload-form #text-input{
            width: 350px;
            height: 70px;
            word-break: break-all;
            resize: none;
        }
        #upload-form #upload-btn {
            display: block;
            width: 350px;
            margin: 0 auto;
        }
        #upload-form #upload-btn #upload-submit {
            width: 150px;
        }
        /*===========================================*/
        /*===== 페이징 =============================*/
        .bottom-section .bottom-ul li {
            width:30px;
            height:25px;

        .bottom-section .bottom-ul li.currentPage{
            background: #fff;
        }


        /*===========================================*/
        .blackout{
            background-color: #000000;
        }

    </style>
</head>
<body>
<div class="wrap">
    <%@include file="../include/header.jsp"%>
    <div id="galleryWrap">
        <div class="upLoad">

        </div>
        <div class="gallery-board">
            <h1 id="title"> Gallery </h1>
            <div class="top-btn">
                <c:if test="${loginUser != null}">
                    <button onclick="uploadEvent()" id="upload-button">upload</button>
                    <a href="/gallery/list?type=like&keyword=${sessionScope.loginUser.account}"><button id="liking-btn">Liking</button></a>
                    <a href="/gallery/list?type=account&keyword=${sessionScope.loginUser.account}"><button id="mine-btn">mine</button></a>
                </c:if>
                    <a href="/gallery/list?type=best&keyword=n"><button id="best-btn">best</button></a>
                    <a href="/gallery/list"><button id="all-btn">all</button></a>
            </div>
            <div>
                <ul id="gallery-ul" class="clear-box">
                    <% int i = 0; %>
                    <c:forEach var="i" items="${galleries}">
                        <li data-no="<%=i%>">
                            <img src="${i.src}"  class="img" data-galleryno=${i.galleryNo} alt="">
                            <div >
                                <p class="writer" data-account="">#${i.nickname}</p>
                                <p><img class="likeImg" src="/img/like.png" alt=""></p>
                                <p class="likeCnt">${i.likeCnt}</p>
                                <input type="hidden" name="account" value="${i.account}">

                                <p class="text">${i.text}</p>
                            </div>
                        </li>
                        <% i += 1;%>
                    </c:forEach>
                </ul>
            </div>

            <%--갤러리 하단--%>
            <div class="bottom-section">
                <div>
                    <ul class="bottom-ul">
                        <%-- 이전 버튼 --%>
                        <c:if test="${pm.prev}">
                            <li><a href="/gallery/list?type=${search.type}&keyword=${search.keyword}&pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}">prev</a></li>
                        </c:if>

                        <%-- 페이지 버튼 --%>
                        <c:forEach var="i" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                            <li>
                                <a href="/gallery/list?type=${search.type}&keyword=${search.keyword}&pageNum=${i}&amount=${pm.page.amount}">${i}</a>
                            </li>
                        </c:forEach>

                        <%--다음 버튼--%>
                        <c:if test="${pm.next}">
                            <li><a href="/gallery/list?type=${search.type}&keyword=${search.keyword}&pageNum=${pm.endPage + 1}&amount=${pm.page.amount}">next</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="close-up">
            <div class="up-in-box">
                <div class="close-div">
                    <img id="close-picture" alt="">
                </div>
                <div class="down-div">
                    <div class="down-user">
                        <p ></p>
                        <input type="hidden" name="account" value="">
                    </div>
                    <div class="down-text" >
                        <textarea class="in-text" onkeypress="Check()" maxlength="50" readonly="readonly"></textarea>
                    </div>
                    <div class="down-btn">

                        <button class="go-list" style="display: inline-block">
                            목록으로
                        </button>
                        <button class="down-btn-download" style="display: inline-block">
                            다운로드
                        </button>
                    </div>
                    <div class="up-like">
                        <div class="up-likeCnt">
                            <span></span> <img src="/img/like.jpg">
                        </div>
                        <div class ="likeBtn">
                            <button >Like!!</button>
                        </div>
                    </div>

                </div>
            </div>
            <div>
                <div ><img id="pre-btn" src="/img/left.png" ></div>
                <div ><img id="next-btn" src="/img/right.png" ></div>
            </div>
        </div>
    </div>
    <%@include file="../include/footer.jsp"%>
</div>



<script>
<%
   // WAS session에 있는 값 가져오기
  Member loginUser = (Member) request.getSession().getAttribute("loginUser");
  System.out.println(loginUser);
  String nick ="";
  String account="";
  if(loginUser != null){ // null얼 배제해줘야 ErrorMvcAutoConfiguration$StaticView 에러가 안남.
    nick = loginUser.getNickname();
    account = loginUser.getAccount();
  }
%>
const loginNick = "<%=nick%>";
const loginAccount = "<%=account%>";
console.log(loginNick);

// like체크
function lickCheck(){
        const $ul = document.getElementById('gallery-ul').firstElementChild;

        for(let i=0; i<6;i++){
            let gno = $ul.firstElementChild.dataset.galleryno;
            
            
            $ul = $ul.nextElementSibling;
            fetch("/like/check?account=${loginUser.account}&type=galleryNo&no="+gno)
                .then(res => res.json())
                .then(flag =>{
                    console.log(typeof flag);
                    if(flag){

                    }
                })
        }
}

//클로즈 갤러리 버튼으로 옆으로 넘기기
function nextEvent(pe){
    document.getElementById('next-btn').onclick = e => {
        if(!e.target.matches("#next-btn")) return;
        console.log(e.target);
        if( pe.nextElementSibling) {
            closeUp(pe.nextElementSibling);
        }else{
        closeUp(pe.parentElement.firstElementChild);

        <%-- else (${pm.page.pageNum != pm.endPage}{ --%>
        <%--    --%>
        <%--    &lt;%&ndash;let i = pe.dataset.no;&ndash;%&gt;--%>
        <%--    --%>
        <%--    &lt;%&ndash;fetch("/gallery/list?type=${search.type}&keyword=${search.keyword}&pageNum=${i}&amount=${pm.page.amount}")&ndash;%&gt;--%>
        <%--    &lt;%&ndash;closeUp(pe.parentElement.firstElementChild);&ndash;%&gt;--%>
        <%--}--%>
    }
}
}
function prevEvent(pe){
    document.getElementById('pre-btn').onclick = e => {
        if(!e.target.matches("#pre-btn")) return;
        console.log(e.target);
        if( pe.previousElementSibling){
            closeUp(pe.previousElementSibling);
        }else{
            fetch("/gallery/list?type=${search.type}&keyword=${search.keyword}&pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}")

            closeUp(pe.parentElement.lastElementChild);
        }
    }
}



// 이미지 전체화면 띄우기
function fullSizeEvent(){
    document.getElementById('close-picture').onclick = e => {
        if(!e.target.matches("#close-picture")) return;
        if (e.target.requestFullscreen) {
            e.target.requestFullscreen();
        } else if (e.target.mozRequestFullScreen) { /* Firefox */
            e.target.mozRequestFullScreen();
        } else if (e.target.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
            e.target.webkitRequestFullscreen();
        } else if (e.target.msRequestFullscreen) { /* IE/Edge */
            e.target.msRequestFullscreen();
        }
    }
}

// like 이벤트 - gallery-li

function likeEvent2(){
    document.querySelector('.likeImg').onclick = e => {
        
        console.log(e.target);
        if(!e.target.matches('.likeImg')) return;
        console.log(e.target);
        likeUpdate2();
    }
}

function likeUpdate2(e){
    console.log(e.parentElement.parentElement.previousElementSibling);
    const galleryNo = e.parentElement.parentElement.previousElementSibling.dataset.galleryno;
    console.log("gallerno = {}");
    console.log(galleryNo);

    if(${empty loginUser}){
        if(confirm("로그인이 필요합니다 로그인하시겠습나까?")){
            location.href="/member/sign-in";
        }
    }else {
        fetch("/like/update?galleryNo=" + galleryNo)
            .then(res => res.text())
            .then(cnt => {

                let likeCnt = parseInt(cnt);
                console.log(likeCnt);
                console.log(cnt);
                console.log(cnt <= likeCnt);
                if (cnt !== "match-account") {
                    const $like = e.parentElement.nextElementSibling;
                    const preLikeCnt = $like.textContent;
                    $like.textContent = likeCnt;

                } else {
                    alert("본인의 갤러리엔 좋아요가 안되요");
                }
            });
    }
}



// like 이벤트 - closeUp 창

function likeEvent(){
    const $likeBtn = document.querySelector('.likeBtn');
    $likeBtn.onclick = e => {
        
        if(!e.target.matches('.likeBtn button')) return;

        likeUpdate();
    }
}
function likeUpdate(){

    const galleryNo = document.querySelector('.down-text').dataset.galleryno;

    if(${empty loginUser}){
        if(confirm("로그인이 필요합니다 로그인하시겠습나까?")){
            location.href="/member/sign-in";
        }
    }else {
        fetch("/like/update?galleryNo=" + galleryNo)
            .then(res => res.text())
            .then(cnt => {

                let likeCnt = parseInt(cnt);
                console.log(likeCnt);
                console.log(cnt);
                console.log(cnt <= likeCnt);
                if (cnt !== "match-account") {
                    const $like = document.querySelector('.likeBtn').firstElementChild;
                    const preLikeCnt = document.querySelector('.up-likeCnt').firstElementChild.textContent;
                    document.querySelector('.up-likeCnt').firstElementChild.textContent = likeCnt;
                    if (preLikeCnt > likeCnt) {
                        $like.textContent = "likeIt!";
                    } else {
                        $like.textContent = "liking";
                    }
                } else {
                    alert("본인의 갤러리엔 좋아요가 안되요");
                }
            });
    }
}

// 모달창 닫기 - esc
function escSearch() {
    document.addEventListener('keydown', function(){
        if(window.event.keyCode == 27) {
             goList();
        }
    }) 
}



// 모달창 띄우기 이벤트
function upEvent(){
    document.getElementById('gallery-ul').onclick = e => {
        
        if(e.target.matches('.likeImg')){
            
            likeUpdate2(e.target);
        }

        if(e.target.matches('#gallery-ul li .img')){
            console.log(e.target.parentElement);
            closeUp(e.target.parentElement);    
        }
        
        

    }
}
// 모달창에 값넣고 띄우기
function closeUp(e){
    // 노드를 복사
    // const cloneE = e.cloneNode(true)
    // 타겟 이미지의 src 와 data-id 가져오기
    // const e = document.querySelector('.img').parentElement;
    let index = e.dataset.no;
    index *= 1; //인트로 변환

    const src = ''+e.firstElementChild.getAttribute('src');
    const galleryNo = e.firstElementChild.dataset.galleryno;
    const text = e.lastElementChild.lastElementChild.textContent;
    const writer = e.lastElementChild.children[3].value;
    let like = e.lastElementChild.children[2].textContent;
    let nickName = e.lastElementChild.firstElementChild.textContent;
    nickName = nickName.substring(1) ;
    // console.log(nickName);
    // console.log(src);
    document.querySelector('.close-div').firstElementChild.setAttribute('src',src);
    document.querySelector('.close-div').setAttribute('data-index', index);
    document.querySelector('.down-user').firstElementChild.textContent = nickName;
    document.querySelector('.down-user').lastElementChild.setAttribute("value",writer)
    document.querySelector('.down-text').setAttribute('data-galleryno',galleryNo);
    document.querySelector('.in-text').textContent = text;
    document.querySelector('.up-likeCnt').firstElementChild.textContent=like;


    const $downBtn = document.querySelector('.down-btn');

    if(loginNick == nickName || "${loginUser.auth}" === "ADMIN") {
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
    // 라이크 확인
    if(${!empty loginUser}) {
        fetch("/like/check?galleryNo=" + galleryNo)
            .then(res => res.text())
            .then(msg => {
                if (msg == "true") {
                    document.querySelector('.likeBtn').firstElementChild.textContent = "Liking";
                }
            });
    }

    document.querySelector('.close-up').classList.add('up');

    // 바뀐 모달창에 수정버튼 이벤트걸기
    if(document.querySelector('.down-btn-mod')) {
        modEvent(e);
        delEvent();
    }
    goListEvent();
    escSearch();
    downloadEvent();
    likeEvent();
    fullSizeEvent();
    nextEvent(e);
    prevEvent(e);
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
    document.querySelector('.down-user').lastElementChild.removeAttribute("value");
    document.querySelector('.down-text').setAttribute('data-galleryno','');
    document.querySelector('.in-text').classList.remove("border");
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
    const galleryNo = $text.dataset.galleryno;
    const text = $text.firstElementChild.textContent;

    document.querySelector('.in-text').removeAttribute("readonly");
    document.querySelector('.in-text').classList.add("border");

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
    const $text = document.querySelector('.in-text');
    $text.setAttribute("readonly","readonly");
    $text.textContent = text;
    document.querySelector('.in-text').classList.remove("border");
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
    const galleryNo = $downText.dataset.galleryno
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
    document.querySelector('.in-text').classList.remove("border");
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
    const galleryNo = document.querySelector('.down-text').dataset.galleryno;

    closeUpDel();
    location.href = "/gallery/list?galleryNo=" + galleryNo +
        "&pageNum=${pm.page.pageNum}&amount=${pm.page.amount}";

}
function delEvent(){
    document.querySelector('.down-btn-del').onclick = e => {
        if(!e.target.matches('.down-btn-del')) return;
        console.log(e.target);
        if(confirm("갤러리를 삭제합니다.")) {

            const url = location.href
            const index = url.indexOf("pageNum");
            const pageNumAmount = url.substring(index);

            const galleryNo = document.querySelector('.down-text').dataset.galleryno;
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
    const galleryNo = document.querySelector('.down-text').dataset.galleryno;
    const ghref = '/gallery/api/loadFile?galleryNo='+galleryNo;
    console.log("location"- {}, location.href);
    location.href=ghref;

}

//============================= 업로드 =====================
function uploadEvent(){
        const $upLoad = document.querySelector('.upLoad');
        $upLoad.innerHTML = `
                            <h1>이미지를 올려주세요!</h1>
                            <form id="upload-form" action="/upload" method="POST" enctype="multipart/form-data">
                                <input type="file" name="file" id="file-input">
                                <div id="checkLog"></div>
                                <p>코멘트 </p> <textarea id="text-input" onkeypress="Check()" type="text" name="fileText" maxlength="50"></textarea>
                                <div id="upload-btn">
                                    <button id="upload-submit" type="submit">업로드</button>
                                    <button type="button" id="upload-cancel">취소</button>
                                </div>
                            </form>
                            `;

        document.querySelector('.upLoad').classList.add('up');
        fileCheckEvent();
        uploadCancelEvent();

}

let check= false;

function fileCheckEvent() {

    document.getElementById('file-input').onchange = e => {
        check= false;
        console.log(e.target);
        const $checkLog = document.getElementById("checkLog");
        // 파일 업로드 확장자 체크
        console.log(e.target.value);
        if (e.target.value !== "") {
            const ext = e.target.value.split('.').pop().toLowerCase();
            const list = ['gif', 'png', 'jpg', 'jpeg', ]
            // console.log(ext);
            // console.log(list[0]);
            // 파일확장자 비교
            for (let i in list) {
                // console.log(list[i]);
                if (ext === list[i]) {
                    check = true;

                }
            }
            console.log(check);
            // 확장자 체크
            if (check !== true) {
                $checkLog.innerHTML =
                    `<b class="c-red" style="color: red">[파일확장자를 확인하세요]<br>[gif, png, jpg, jpeg]</b>`;
                return;
            } else {
                // 파일용량 체크
                if (e.target.files[0].size > 10 * 1024 * 1024) {
                    $checkLog.innerHTML =
                        `<b class="c-red" style="color: red">[파일용량 초과 (최대:10MB) ]</b>`;
                    check = false;
                    return;
                } else {
                    e.target.style.borderColor = 'skyblue';
                    $checkLog.innerHTML = `<b class="c-blue" style="color: limegreen">[업로드가능한 파일입니다.]</b>`;
                }
            }
        }

        const $uploadBtn = document.getElementById('upload-submit');
        const $uploadForm = document.getElementById('upload-form');
        $uploadBtn.addEventListener("click", (e) => {
            e.preventDefault();
            if (check === true) {
                $uploadForm.submit();
            } else {
                alert('파일을 다시 확인하세요');
            }
        });
    }
}
// 코멘트 줄 수 제한.
let enter = 0;
function Check() {
    if(event.keyCode===13){
        enter = enter + 1
    }
    if(enter > 2){
        alert("3줄로 제한됩니다.")
        event.returnValue=false;
        enter = 0;
    }
}
function uploadCancelEvent(){
    document.getElementById("upload-cancel").onclick = e => {

        if(!e.target.matches("#upload-cancel")) return;
        const $upLoad = document.querySelector('.upLoad');
        $upLoad.classList.remove('up');
        $upLoad.innerHTML=``;
    }
}

//=====================================================================
// ========== liking 목록 가져오기 ============================
function likeListEvent (){
    document.getElementById('liking-btn').onclick = e =>{
        if(!e.target.matches('#liking-btn')) return;
            console.log(e.target);
        location.href = "/gallery/list?type=like&keyword="+loginAccount;
    }
}



(function (){
    upEvent();
    downEvent();




})();

</script>


</body>
</html>
