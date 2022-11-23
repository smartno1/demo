<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-04
  Time: 오후 9:25
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <style>
        a {color: #fff; text-decoration: none; outline: none}
        a:hover, a:active {text-decoration: none; }
    </style>
    <!-- custom css -->
    <link rel="stylesheet" type="text/css" href="/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="/css/header.css"/>

    <style>
        .clear-fix:after {
            content: "";
            display: block;
            clear: both;
        }
        .wrap{
            background: black;
        }

        .basket-wrap{
            width: 100%;
            height: 100%;
        }
        .basket-box{
            margin-top: 20px;
            width: 1100px;
            margin: 20px auto;
        }
        .basket-box .top-header{
            color: white;
            position: relative;
            margin-bottom: 20px;
        }
        .basket-box .top-header .goList{
            float: left;
        }
        .basket-box .top-header #delete{
            margin-left: 20px;
            float: right;
            cursor: pointer;
        }
        .basket-box .top-header #buy{
            margin-left: 20px;
            float: right;
            cursor: pointer;
        }
        .basket-box .top-header #allCheck{
            float: right;
            cursor: pointer;
        }
        .basket-box .basket-ul {

        }
        .basket-box .basket-ul .basket-li{
            position: relative;
            height: 250px;
        }
        .basket-box .basket-ul .basket-li .picture {
            float: left;
            width: 300px;
            height: 200px;
        }
        .basket-box .basket-ul .basket-li .picture img{
            width: 200px;
            height: 200px;
        }

        .basket-box .basket-ul .basket-li .txt {
            float: left;
            width: 800px;
            margin: auto 0;
            font-size: 25px;
        }
        .basket-box .basket-ul .basket-li .txt .name {
            margin-top: 10px;
            margin-bottom: 20px;
        }
        .basket-box .basket-ul .basket-li .txt .price {
            margin-bottom: 20px;
        }
        .basket-box .basket-ul .basket-li .txt .count{
            width: 800px;
            word-break: break-all;
            margin-bottom: 20px;
        }
        .basket-box .basket-ul .basket-li .txt .totalPrice{
        }
        .basket-box .basket-ul .basket-li .inputCheck{
            float:right;
            color: white;
            font-size: 25px;
        }
        .basket-box .basket-ul .basket-li .inputCheck .label{
            background: #fff;
            width: 30px;
            height: 30px;
        }
        /*modal =======================*/
        #buy-modal {
            background: #fff;
            width: 600px;
            height: 500px;

            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

            border-radius: 20px;
        }

        #buy-modal .modal-box {
            margin: 50px;

        }

        #buy-modal .modal-box .checkbox {
            margin-bottom: 50px;
            line-height: 30px;
        }

        #buy-modal .modal-box .checkbox span {
            font-size: 30px;
        }

        #buy-modal .modal-box .deliveryAddr span {
            font-size: 30px;
        }

        #buy-modal .modal-box .deliveryAddr .address-table tr {

        }

        #buy-modal .modal-box .deliveryAddr .address-table input {
            width: 300px;
            margin-top: 20px;
        }

        #buy-modal .modal-box .deliveryAddr .address-table #zipNo,
        #buy-modal .modal-box .deliveryAddr .address-table #jusoCallBack {
            width: 100px;
        }

        #buy-modal .modal-box .modalBtn {
            /*background: red;*/
            width: fit-content;
            height: 60px;
            position: relative;

            margin: 30px auto;
        }

        #buy-modal .modal-box #buyBtn, #cancelBtn {
            width: 200px;
            height: 50px;
            font-size: 30px;

            border: 1px solid black;
            text-align: center;
            line-height: 50px;
            border-radius: 10px;

            float: left;
            cursor: pointer;
        }

        #buy-modal .modal-box #cancelBtn {
            width: 100px;
            margin-left: 50px;
        }

        #buySuccess {
            background: #fff;
            width: 320px;
            height: 200px;

            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);

            border-radius: 20px;
            border: 2px double black;
        }
        #buySuccess > div{
            margin:25px;
        }
        #buySuccess > div > h1{
            line-height: 30px;
        }
        #buySuccess > div > div{
            position: relative;
            margin-top: 10px;
            border-top: 1px solid black;
        }
        #buySuccess > div > div > div{
            float: left;
            border: 2px solid black;
            border-radius: 10px;
            width: 120px;
            height: 30px;
            line-height: 30px;
            margin-top: 30px;
            text-align: center;

        }
        #buySuccess > div > div #shopping{
            margin-right: 20px;
        }
    </style>
</head>
<body>

<div class="wrap">

    <%@include file="../include/header.jsp"%>

    <section class="basket-wrap">
        <div class="basket-box">
            <div class="top-header clear-fix">
                <div class="goList">
                    <a href="/shop/list">SHOP</a> <span> > 장바구니</span>
                </div>
                <div id="delete">삭제하기</div>
                <div id="buy">구매하기</div>
                <div id="allCheck"><input type="checkbox" id="checkAll">전체선택</div>
            </div>
            <ul class="basket-ul clear-fix">
                <li>

                </li>
                <c:forEach var="i" items="${shopSolds}">

                    <li class="basket-li">
                        <div class="picture">
                            <div>
                                <a href="/shop/detail?id=${i.goodsId}&type=count&keyword=${i.count}" target="">
                                    <c:if test="${!empty i.src}">
                                        <img src="${i.src}">
                                    </c:if>
                                    <c:if test="${empty i.src}">
                                        No image
                                    </c:if>
                                </a>
                            </div>
                            <div></div>
                        </div>
                        <div class="txt">
                            <div class="name">
                                <a href="/shop/detail/${i.goodsId}" target="_blank">
                                        상품명 : ${i.name}
                                </a>
                            </div>
                            <div class="price">
                                <a href="/shop/detail/${i.goodsId}" target="_blank">

                                    가격 : <span id="onePrice">${i.price}</span> 원
                                </a>
                            </div>
                            <div class="count">
                                <a href="/shop/detail/${i.goodsId}" target="_blank">
                                        수량 : ${i.count}
                                </a>
                            </div>
                            <div class="totalPrice">
                                <a href="/shop/detail/${i.goodsId}" target="_blank">
                                    총 구매가격 : <span id="totalPrice">${i.totalPrice}</span> 원
                                </a>
                            </div>
                        </div>
                        <div class="inputCheck">
                            <input id=`"check_"+${i.id}` type="checkbox" value="${i.id}" name="id" class="checkOne">
                            <label for='"check_"+${i.id}' class='label'></label><span>선택</span>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div id="buy-modal" style="display: none">
            <div class="modal-box">
                <input id="modalCount" name="count" type="hidden"/>
                <input id="modalId" name="goodsId" type="hidden"/>

                <div class="checkbox">
                    <span> 받는사람</span>
                    주문자와 동일<input id="recipient" type="checkbox" value="${loginUser.account}"/><br>
                    <input id="other" type="text" name="recipient" placeholder="받는사람 이름"/>
                </div>
                <div class="deliveryAddr">
                    <span> 받으실 주소</span>
                    주문자와 동일<input id="deliveryAddr" type="checkbox"
                                  value="${loginUser.address}"/><br><br>
                    <input id="deliveryAddress" type="hidden" name="deliveryAddress">
                    <table class="address-table">
                        <tr>
                            <td><strong>우편번호</strong></td>
                            <td><input type="text" id="zipNo" name="zipNo" readonly
                                       value=""/>
                                <input type="button" id="jusoCallBack" value="주소 검색"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>도로명주소</strong></td>
                            <td><input type="text" id="roadAddrPart1"
                                       name="roadAddrPart1" readonly/></td>
                        </tr>
                        <tr>
                            <td><strong>지번</strong></td>
                            <td><input type="text" id="jibunAddr" name="jibunAddr"
                                       readonly/></td>
                        </tr>
                        <tr>
                            <td><strong>고객입력 상세주소</strong></td>
                            <td><input type="text" id="addrDetail"
                                       name="addrDetail"/></td>
                        </tr>
                    </table>
                </div>
                <div class="modalBtn">
                    <div id="buyBtn">
                        구매
                    </div>
                    <div id="cancelBtn">
                        취소
                    </div>
                </div>
            </div>
        </div>
        <div id="buySuccess" style="display: none">
            <div>
                <h1>구매가 성공적으로 완료되었습니다.<br>감사합니다.</h1>
                <div>
                    <div id="shopping">
                        계속 쇼핑하기
                    </div>
                    <div id="confirm">
                        구매확인
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="../include/footer.jsp"%>
</div>

<script>
    const buyCheck = [];

    function decimal(){
        const $prices = document.querySelectorAll('#onePrice');
        for (const $price of $prices){
            let price = 1*$price.textContent;
            $price.textContent = price.toLocaleString('ko-KR');
        }
        const $tPrices = document.querySelectorAll('#totalPrice');
        for (const $tPrice of $tPrices){
            let price = 1*$tPrice.textContent;
            $tPrice.textContent = price.toLocaleString('ko-KR');
        }
    }
    function allCheck(){

        const $checkAll = document.getElementById('checkAll');
        const $check = document.querySelectorAll('.checkOne');
        $checkAll.addEventListener('click', e =>{
            if(e.target.matches('#checkAll')) {
                if ($checkAll.checked) {
                    $check.forEach(function (check) {
                        check.checked = true;
                    })
                } else {
                    $check.forEach(function (check) {
                        check.checked = false;
                    })
                }
            }
        } )
        document.querySelector('.basket-ul').addEventListener('click', e => {
            if(!e.target.matches('.checkOne')) return;
            inputChecker();
        })
    }
    function inputChecker(){
        const $checkAll = document.getElementById('checkAll');
        const $check = document.querySelectorAll('.checkOne');
        let checkArr = [];
        $check.forEach(function (check) {
            if (check.checked) {
                checkArr.push(true);
            } else {
                checkArr.push(false);
            }
        })
        console.log(checkArr);
        if (checkArr.includes(false)){
            $checkAll.checked = false;
        }else{
            $checkAll.checked = true;
        }
    }
    function buyEvent() {
        document.getElementById('buy').addEventListener('click', e => {

            if (!e.target.matches('#buy')) return;
            if(${loginUser == null}){
                if(confirm("로그인이 필요합니다.\n로그인페이지로 이동할까요?")){
                    location.href="/member/sign-in";
                }else{
                    return;
                }
            }
            const $check = document.querySelectorAll('.checkOne');
            let checkArr = [];
            $check.forEach(function (check) {
                if (check.checked) {
                    checkArr.push(true);
                    buyCheck.push(check.value);
                } else {
                    checkArr.push(false);
                }
            })
            console.log(checkArr);
            if (!checkArr.includes(true)) {
                alert("구매할 상품을 선택해주세요.");
                return;
            }
            document.getElementById('buy-modal').style.display = "block";

        })
    }
    // 주소 api
    function address() {
        $jusoCallBack = document.getElementById("jusoCallBack");

        $jusoCallBack.addEventListener('click', () => {
            var pop = window.open("/juso/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");

            // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/juso/jusoPopup","pop","scrollbars=yes, resizable=yes");

        });
    }

    function jusoCallBack(zipNo, roadAddrPart1, jibunAddr, addrDetail) {
        // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        console.log("주소콜백");
        document.getElementById("zipNo").value = zipNo;
        document.getElementById("roadAddrPart1").value = roadAddrPart1;
        document.getElementById("jibunAddr").value = jibunAddr;
        document.getElementById("addrDetail").value = addrDetail;
    }

    // 받는사람 주문자 동일 체크시
    function recipientChk() {
        document.getElementById('recipient').addEventListener('change', e => {
            console.log(e.target);
            const $other = document.getElementById('other');
            if (e.target.checked === true) {
                $other.value = e.target.value;
                $other.setAttribute("disabled", ""); //$other.disabled=true;
            } else {
                $other.value = '';
                $other.removeAttribute("disabled"); //$other.disabled=false;
            }
        })
    }

    //받으실 주소 주문자동일 체크시
    function deliveryAddr() {
        document.getElementById('deliveryAddr').addEventListener('change', e => {
            const $zipNo = document.getElementById("zipNo")
            const $roadAddrPart1 = document.getElementById("roadAddrPart1")
            const $addrDetail = document.getElementById("addrDetail");
            const $jibunAddr = document.getElementById('jibunAddr');

            if (e.target.checked === true) {
                const addr = "${loginUser.address}";
                const addrArr = addr.split("_");

                $zipNo.value = addrArr[0];
                $roadAddrPart1.value = addrArr[1];
                $addrDetail.value = addrArr[2];
                $jibunAddr.value = addrArr[3];

            } else {
                $zipNo.removeAttribute("disabled");
                $zipNo.value = '';
                $roadAddrPart1.removeAttribute("disabled");
                $roadAddrPart1.value = '';
                $addrDetail.removeAttribute("disabled");
                $addrDetail.value = '';
                $jibunAddr.removeAttribute("disabled");
                $jibunAddr.value = '';
            }
        })
    }

    function checkOrder() {
        document.getElementById('buyBtn').addEventListener('click', e => {
            console.log(e.target);
            const recipient = document.getElementById('other').value;
            const deliveryAddr = document.getElementById('zipNo').value;
            console.log(recipient, deliveryAddr);

            if (recipient !== '' && recipient !== undefined) {
                if (deliveryAddr !== '' && deliveryAddr !== undefined) {
                    const $zipNo = document.getElementById("zipNo")
                    const $roadAddrPart1 = document.getElementById("roadAddrPart1")
                    const $addrDetail = document.getElementById("addrDetail");
                    const $jibunAddr = document.getElementById('jibunAddr');

                    const deliveryAddress = $zipNo.value + "_" + $roadAddrPart1.value + "_" + $addrDetail.value + "_" + $jibunAddr.value;
                    const ids = document.querySelectorAll('input[name="id"]:checked');

                    let done = false;
                    const success = [];
                    const fails = [];
                    for(let i = 0; i < ids.length; i++){
                        const reqInfo = {
                            method: 'POST',
                            headers: {
                                'content-type': 'application/json'
                            },
                            body: JSON.stringify({
                                recipient: recipient,
                                deliveryAddress: deliveryAddress,
                                purchase: true,
                                id:ids[i].value
                            })
                        };

                        fetch("/shop/buy", reqInfo)
                            .then(res => res.text())
                            .then(msg => {
                                console.log("mag",msg);
                                if (msg.indexOf('success') != null){
                                    console.log("mag",msg);
                                    let id = msg.substring(msg.indexOf("_")+1);
                                    success.push(id);
                                    console.log("succe",success);
                                }else{
                                    console.log(msg);
                                    let id = msg.substring(msg.indexOf("_")+1);
                                    console.log(id);
                                    fails.push(id);
                                }
                            })
                        if(i === (ids.length-1)){
                            if(fails[0] === undefined){
                                document.getElementById('buy-modal').style.display = "none";
                                document.getElementById('buySuccess').style.display="block";

                            }else{
                                let ids = "";
                                for(id of fails){
                                    console.log("id");
                                    console.log(id);
                                    ids = ids + id + " ";
                                }
                                console.log("fail", fails);
                                // alert("구매번호 : \n"+ ids +"\n 의 구매에 실패하였습니다.")
                            }
                        }
                    }

                } else {
                    console.log("addr no")
                    alert("작성란을 확인하세요");
                }
            } else {
                console.log("recipient no")
                alert("작성란을 확인하세요");
            }
        })
    }

    function cancel() {
        document.getElementById('cancelBtn').addEventListener('click', e => {

            location.href = "/shop/basket"
        })
    }

    function shopping(){
        document.getElementById('buySuccess').addEventListener('click', e=>{
            if(e.target.matches('#shopping')){
                history.go(-1);
            }
            if(e.target.matches('#confirm')){
                alert("구매확인페이지")
            }
        })
    }

    // function delete(){
    //
    // }

    (function (){
        decimal();
        allCheck();
        buyEvent();
        address();
        recipientChk();
        deliveryAddr();
        checkOrder();
        cancel();
        shopping();
    })();
</script>
</body>
</html>