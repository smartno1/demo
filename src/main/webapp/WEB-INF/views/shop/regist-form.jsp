<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-11
  Time: 오후 4:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">

<head>
  <title>Title</title>
  <!-- reset css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

  <!-- custom css -->
  <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
  <link rel="stylesheet" type="text/css" href="/css/header.css"/>
  <link rel="stylesheet" type="text/css" href="/css/main.css"/>

  <style>
    a {color: #fff; text-decoration: none; outline: none}
    a:hover, a:active {text-decoration: none; }

    /* common */
    .clear-fix{
      content: "";
      display: block;
      clear: both;
    }
    .c-red{
      color: red;
    }
    /*------------------*/

    .bodywrap {
      background: #fff;
      width: 550px;
      margin: 0 auto;
      min-height: 500px;
      padding-top: 30px;
    }
    .bodywrap h1{
      margin: 0 30px 30px 30px;
      font-size: 30px;
    }
    #regist{
      margin: 30px;
    }
    #regist div, #regist input{
      margin-bottom: 20px;
    }
    #regist #detailInput{
      margin-top: -10px;
      width: 400px;
      height: 150px;
      resize: none;
    }
    .btn {
      position: relative;
      margin-bottom: 30px;
    }
    .btn div {
      float: right;
      margin-bottom: 30px;
      margin-right: 30px;
      cursor: pointer;
      text-align: center;

      width: 80px;
      height: 30px;
      line-height: 30px;
      border-radius: 10px;
      border: 1px solid black;
    }
  </style>

</head>
<body>
<div class="wrap">
  <%@ include file= "../include/header.jsp" %>

  <div class="bodywrap">
    <h1>상품등록</h1>
    <form id="regist" action="/shop/regist" method="POST" enctype="multipart/form-data">
      <div class="img">
        이미지 사진 : <input type="file" name="file" id="file-input">
        <p id="checkLog"></p>
      </div>
      <div class="text">
        <div>
          <p>
            상품명 : <input type="text" name="name" id="nameInput"><span id="nameChk"></span>
          </p>
          <p>
            가격 : <input type="text" name="price" id="priceInput"><span id="priceChk"></span>
          </p>
        </div>
        <div class="info">
          원산지 : <input type="text" name="origin" id="originInput"><span id="originChk"></span>
        </div>
        <div class="count">
          수량 : <input type="text" name="stock" id="stockInput"><span id="stockChk"></span>
        </div>
        <div class="detail-info">
          <div>상세설명 : <span id="detailChk"></span></div>
          <textarea id="detailInput"  name="content"></textarea>
        </div>
      </div>
      <div  class="btn clear-fix">
        <div  id="cancel"> 취소 </div>
        <div  id="done"> 등록 </div>
      </div>
    </form>

  </div>


  <%@ include file= "../include/footer.jsp" %>
</div>

<script>
  const onlyNumber = RegExp(/^[0-9]/);
  const checkArr = [false,false,false,false,false,false];



  function checkFile() {
    document.getElementById('file-input').addEventListener('change', e => {

      console.log(e.target);
      const $checkLog = document.getElementById("checkLog");
      // 파일 업로드 확장자 체크
      console.log(e.target.value);
      if (e.target.value !== "") {
        const ext = e.target.value.split('.').pop().toLowerCase();
        const list = ['gif', 'png', 'jpg', 'jpeg',]
        // console.log(ext);
        // console.log(list[0]);
        // 파일확장자 비교
        for (let i in list) {
          // console.log(list[i]);
          if (ext === list[i]) {
            checkArr[0] = true;

          }
        }

        // 확장자 체크
        if (checkArr[0] !== true) {
          $checkLog.innerHTML =
                  `<b class="c-red" style="color: red">[파일확장자를 확인하세요]<br>[gif, png, jpg, jpeg]</b>`;
          return;
        } else {
          // 파일용량 체크
          if (e.target.files[0].size > 10 * 1024 * 1024) {
            $checkLog.innerHTML =
                    `<b class="c-red" style="color: red">[파일용량 초과 (최대:10MB) ]</b>`;
            checkArr[0] = false;
            return;
          } else {
            e.target.style.borderColor = 'skyblue';
            $checkLog.innerHTML = `<b class="c-blue" style="color: limegreen">[업로드가능한 파일입니다.]</b>`;
            checkArr[0] = true;
          }
        }
      }
    })
  }

function checkName(){
    document.getElementById('nameInput').addEventListener('keyup', e => {
      const $nameChk = document.getElementById('nameChk');

      if(e.target.value.trim() === ''){
        e.target.style.borderColor = 'red';
        $nameChk.innerHTML = '<b class="c-red">[상품명은 필수 정보입니다.]</b>';
        checkArr[1] = false;
      }
      else{
        $nameChk.innerHTML='';
        e.target.style.borderColor = '';
        checkArr[1] = true;
      }
    })
}

  function checkPrice(){
    document.getElementById('priceInput').addEventListener('keyup', e => {
      const $priceChk = document.getElementById('priceChk');

      if(e.target.value.trim() === ''){
        e.target.style.borderColor = 'red';
        $priceChk.innerHTML = '<b class="c-red">[가격은 필수 정보입니다.]</b>';
        checkArr[2] = false;
      }else if(!onlyNumber.test(e.target.value)){
        e.target.style.borderColor = 'red';
        $priceChk.innerHTML = '<b class="c-red">[가격은 숫자로 작성하세요.]</b>';
        checkArr[2] = false;
      }else{
        $priceChk.innerHTML ='';
        e.target.style.borderColor = '';
        checkArr[2] = true;
      }
    })
  }

  function checkOrigin(){
    document.getElementById('originInput').addEventListener('keyup', e => {
      const $nameChk = document.getElementById('originChk');

      if(e.target.value.trim() === ''){
        e.target.style.borderColor = 'red';
        $nameChk.innerHTML = '<b class="c-red">[원산지는 필수 정보입니다.]</b>';
        checkArr[3] = false;
      }
      else{
        $nameChk.innerHTML = '';
        e.target.style.borderColor = '';
        checkArr[3] = true;
      }
    })
  }

  function checkStock(){
    document.getElementById('stockInput').addEventListener('keyup', e => {
      const $stockChk = document.getElementById('stockChk');

      if(e.target.value.trim() === ''){
        e.target.style.borderColor = 'red';
        console.log(e.target.value);
        $stockChk.innerHTML = '<b class="c-red">[수량은 필수 정보입니다.]</b>';
        checkArr[4] = false;
      }else if(!onlyNumber.test(e.target.value)){

        e.target.style.borderColor = 'red';
        $stockChk.innerHTML = '<b class="c-red">[수량은 숫자로 작성하세요.]</b>';
        checkArr[4] = false;
      }else{
        $stockChk.innerHTML='';
        e.target.style.borderColor = '';
        checkArr[4] = true;
      }
    })
  }

  function checkDetail(){
    document.getElementById('detailInput').addEventListener('keyup', e => {
      const $detailChk = document.getElementById('detailChk');

      if(e.target.value.trim() === ''){
        e.target.style.borderColor = 'red';
        $detailChk.innerHTML = '<b class="c-red">[상세설명은 필수 정보입니다.]</b>';
        checkArr[5] = false;
      }
      else{
        e.target.style.borderColor = '';
        $detailChk.innerHTML = '';
        checkArr[5] = true;
      }
    })
  }

  function doneEvent(){
    document.getElementById('done').onclick = e => {
      e.preventDefault();

      if(!e.target.matches('#done')) return;

      const $regist = document.getElementById('regist');

      if(!checkArr.includes(false)){
        $regist.submit();
        for(let i=0;i<checkArr.length;i++){
          checkArr[i] = false;
        }

      }else{
        alert('입력란을 다시 확인하세요')
      }
    }
  }
  function cancelEvent(){
    document.getElementById('cancel').addEventListener('click', e => {
      if(!e.target.matches('#cancel')) return;

      location.href = '/shop/list';
    })
  }
  (function (){
    checkName();
    checkPrice();
    checkDetail();
    checkStock();
    checkOrigin();
    checkFile();
    cancelEvent();
    doneEvent();
  })();

</script>
</body>
</html>
