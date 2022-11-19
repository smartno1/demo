<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-11
  Time: 오후 11:14
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
        a {
            color: #fff;
            text-decoration: none;
            outline: none
        }

        a:hover, a:active {
            text-decoration: none;
        }

        /* input 기본 스타일 초기화 */
        /*input {*/
        /*  -webkit-appearance: none;*/
        /*  -moz-appearance: none;*/
        /*  appearance: none;*/
        /*}

        /* IE10 이상에서 input box 에 추가된 지우기 버튼 제거 */
        input::-ms-clear {
            display: none;
        }

        /* input type number 에서 화살표 제거 */
        input[type='number']::-webkit-inner-spin-button,
        input[type='number']::-webkit-outer-spin-button {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        input:focus {
            outline: none;
        }

        .clear-fix {
            content: "";
            display: block;
            clear: both;
        }

        .detail-wrap {
            width: 1100px;
            position: relative;
            margin: 0 auto;
        }
        .top-header{
            margin-top: 10px;
            color: #fff;
            position: relative;
        }
        .top-header .goList{
            float: left;
        }
        #modify, #delete{
            float: right;
            margin-left: 20px;
            cursor: pointer;
        }

        .top-box {
            /*border: 1px solid greenyellow;*/
            margin-top: 20px;
            color: #fff;
            position: relative;
            height: 500px;
        }

        .top-box .img-box {
            width: 550px;
            height: 550px;
            /*background: red;*/
            float: left;
            text-align: center;
        }

        .top-box .img-box img {
            width: 500px;
            height: 500px;

            object-fit: contain;
        }

        .top-box .info-box {
            /*background: red;*/
            float: left;
            margin-left: 80px;
            width: 470px;
        }

        .top-box .info-box .name-price {
            margin-bottom: 20px;
        }

        .top-box .info-box .name-price #name {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .top-box .info-box .name-price #priceStock {
            font-size: 25px;
            width: 470px;
            padding-bottom: 60px;
            padding-top: 20px;
            border-bottom: 1px solid #fff;
            position: relative;
        }
        .top-box .info-box .name-price #priceStock #price {
            float: left;
        }
        .top-box .info-box .name-price #priceStock #stock{
            float: right;
        }

        .top-box .info-box .info {
            line-height: 30px;
        }

        .top-box .info-box .info em {
            font-weight: bold;
        }

        .top-box .info-box .count {
            margin-top: 30px;
            margin-bottom: 10px;
        }

        .top-box .info-box .countBtn {
            position: relative;

        }

        .top-box .info-box .countBtn p {
            border: 1px solid #fff;
            float: left;
            width: 30px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            font-size: 20px;
            margin-bottom: 30px;
            cursor: pointer;
        }

        .top-box .info-box .countBtn #count {
            width: 50px;
        }

        .top-box .info-box .countBtn #count input {
            resize: none;
            width: 40px;
            height: 24px;
            line-height: 24px;
            text-align: center;
            border: none;

            background: none;
            color: #fff;
            font-size: 20px;
            font-weight: bold;

        }

        .top-box .info-box .countBtn p:last-child {
            float: right;
            width: fit-content;
            border: 0;
        }

        .top-box .info-box .total #totalCnt {
            float: left;
        }

        .top-box .info-box .total #totalPrice {
            float: right;
            font-size: 30px;
        }

        .top-box .info-box .buyBtn {
            margin-top: 40px;
            position: relative;
            text-align: center;
        }

        .top-box .info-box .buyBtn div {
            border: 1px solid #fff;
            width: 30%;
            height: 40px;
            line-height: 40px;
            float: left;
            margin-right: 20px;
            cursor: pointer;
        }

        .top-box .info-box .buyBtn #like {
            margin-right: 0;
        }
        #content {
            margin-top: 30px;
        }
        #content div {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #fff;
            color: #fff;
        }

        #content p {
            color: #fff;
            min-height: 50px;
            width: 100%;
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
    <%@ include file="../include/header.jsp" %>
    <section class="detail-wrap">
        <div class="top-header clear-fix">
            <div class="goList">
                <a href="/shop/list?search=${s}">SHOP</a><span> > ${g.shortName}</span>
            </div>
            <div id="delete">삭제하기</div>
            <div id="modify">수정하기</div>
        </div>
        <div class="top-box clear-fix">
            <div class="img-box">
                <img src="${g.src}" alt="">
            </div>
            <div class="info-box">
                <div class="name-price">
                    <p id="name">
                        ${g.name}
                    </p>
                    <div id="priceStock">
                        <p id="price">
                            ${g.decimalPrice}원
                        </p>
                        <p id="stock">
                            재고량 : ${g.stock}
                        </p>
                    </div>
                </div>
                <div class="info">
                    <em>원산지 </em> &nbsp&nbsp${g.origin}<br>
                    <em>배송 방법 </em>&nbsp&nbsp 택배<br>
                    <em>배송비 </em>&nbsp&nbsp 2,500원
                </div>
                <div>
                    <div class="count">
                        수량
                    </div>
                    <div class="countBtn clear-fix">
                        <p id="minus">-</p>
                        <p id="count"><input type="number" value="1" min="1" max="100"></p>
                        <p id="plus">+</p>
                        <p>${g.decimalPrice}원</p>
                    </div>
                </div>
                <div class="total clear-fix">
                    <p id="totalCnt">
                        총 상품금액(1개)
                    </p>
                    <p id="totalPrice"> ${g.decimalPrice}원</p>
                </div>
                <div class="buyBtn clear-fix">
                    <div id="buy">
                        구매하기
                    </div>
                    <div id="basket">
                        장바구니
                    </div>
                    <div id="like">
                        좋아요
                    </div>
                </div>
            </div>
        </div>
        <div id="content">
            <div>상 세 정 보</div>
            <p>${g.content}</p>
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
    <%@ include file="../include/footer.jsp" %>
</div>

<script>

    // + , - 버튼클릭시 계산
    function countButton() {
        document.querySelector('.countBtn').addEventListener('click', e => {

            if (!e.target.matches('#plus') && !e.target.matches('#minus')) return;

            $count = document.getElementById('count');
            let count = $count.firstElementChild.value * 1;

            if (e.target.matches('#plus')) {
                count += 1;
            } else if (e.target.matches('#minus')) {
                count -= 1;
            }
            if (count > 100) {
                count = 100;
                alert("한번에 최대 주문수량은 100개 입니다.");
            }
            if(count > ${g.stock}){
                count = ${g.stock};
                alert("주문량이 재고량보다 많습니다");
            }
            document.getElementById('totalCnt').textContent = `총 상품금액(` + count + `개)`;

            let price = "${g.price}";
            price = price * count;
            price = price.toLocaleString('ko-KR');

            document.getElementById('totalPrice').textContent = price + "원";
            $count.firstElementChild.value = '' + count;

        })
    }

    //직접입력시 계산
    function countInput() {
        $count = document.getElementById('count');
        $count.firstElementChild.addEventListener('change', e => {

            if (e.target.value > 100) {
                e.target.value = 100;
                alert("한번에 최대주문수량은 100개입니다.");
            }
            if(e.target.value > ${g.stock}){
                e.target.value = ${g.stock};
                alert("주문량이 재고량보다 많습니다");
            }
            let price = "${g.price}";
            price = price * e.target.value;
            price = price.toLocaleString('ko-KR');

            document.getElementById('totalPrice').textContent = price + "원";
        });
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

            const count = document.getElementById('count').firstElementChild.value;

            document.getElementById('modalCount').value = count;
            document.getElementById('modalId').value = ${g.id};
            document.getElementById('buy-modal').style.display = "block";
            console.log("madalcount",document.getElementById('modalCount').value)
        })
    }

    function basket(){
        document.getElementById('basket').addEventListener('click', e => {

            if(!e.target.matches('#basket')) return;

            if(!confirm("장바구니에 담을까요?")) return;

            const count = document.getElementById('count').firstElementChild.value;
            const id = ${g.id};
            console.log(count, id);

                const reqInfo = {
                    method: 'POST',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({
                        goodsId: parseInt(id),
                        count: parseInt(count),
                        purchase: false

                    })
                };

                fetch("/shop/basket",reqInfo)
                    .then(res => res.text())
                    .then(msg => {
                        if(msg === 'success'){
                            alert("본 상품을 장바구니에 담았습니다.");
                            location.reload();
                        }else{
                            alert("장바구니에 담을 수 없습니다.")
                        }

                    })

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
                    const count = document.getElementById('modalCount').value;
                    const id = document.getElementById('modalId').value;
                    console.log(typeof id, id);
                    console.log(typeof count, count);

                    const reqInfo = {
                        method: 'POST',
                        headers: {
                            'content-type': 'application/json'
                        },
                        body: JSON.stringify({
                            recipient: recipient,
                            deliveryAddress: deliveryAddress,
                            goodsId: parseInt(id),
                            count: parseInt(count),
                            purchase: true
                        })
                    };

                    fetch("/shop/buy", reqInfo)
                        .then(res => res.text())
                        .then(msg => {
                            if (msg === 'success') {
                                document.getElementById('buySuccess').style.display='block';
                            }
                        })

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

            location.href = "/shop/detail?id=${g.id}&search=${s}"
        })
    }

    function shopping(){
        document.getElementById('buySuccess').addEventListener('click', e=>{
            if(e.target.matches('#shopping')){

                location.href="/shop/list?type=${s.type}&keyword=${s.keyword}&pageNum=${s.pageNum}&amount=${s.amount}";
            }
            if(e.target.matches('#confirm')){
                alert("구매확인페이지")
            }


        })
    }

    (function () {
        countButton();
        countInput();
        buyEvent();
        address();
        recipientChk();
        deliveryAddr();
        checkOrder();
        cancel();
        shopping();
        basket();


    })();
</script>
</body>
</html>
