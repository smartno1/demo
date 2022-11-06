

const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
const getPwCheck = RegExp(
    /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
const getName = RegExp(/^[가-힣]+$/);
const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

const getPhoneNum = RegExp(/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/);
const getNickname = RegExp(/^(?=.*[a-z0-9ㄱ-ㅎㅏ-ㅣ가-힣])[a-z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{1,10}$/);
const getBirth = RegExp(/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);

// 입력값 검증 배열
// 1: 아이디,  2: 비번, 3: 비번확인, 4: 이름, 5: 이메일 6: 전화번호 7: 닉네임 8: 생년월일 9: 주소
const checkArr = [true, true, true, true, true, true, true, true, true];






function checkId() {

    checkArr[0] = true;

}

function checkPw() {

    checkArr[2] = true;

}

function checkName(){

    checkArr[3] = true;

}


function checkEmail(){

    $emailInput = document.getElementById("user_email");
    $emailChk = document.getElementById("emailChk");


    
    $emailInput.addEventListener('keyup', () => {
        //이메일값 공백 확인
        if ($emailInput.value == "") {
            $emailInput.style.borderColor = 'red';
           $emailChk.innerHTML = ('<b class="c-red">[이메일은 필수정보에요!]</b>');
            checkArr[4] = false;
        }
        //이메일값 유효성검사
        else if (!getMail.test($emailInput.value)) {
            $emailInput.style.borderColor = 'red';
           $emailChk.innerHTML = ('<b class="c-red">[이메일 형식 몰라?]</b>');
            checkArr[4] = false;
        } else {

            //이메일 중복확인 비동기 통신
            fetch('/member/check?type=email&value=' + $emailInput.value)
                .then(res => res.text())
                .then(flag => {
                    //console.log(flag);
                    if (flag === 'true') {
                        $emailInput.style.borderColor = 'red';
                       $emailChk.innerHTML = (
                            '<b class="c-red">[이메일이 중복되었습니다!]</b>');
                        checkArr[4] = false;
                    } else {
                        $emailInput.style.borderColor = 'skyblue';
                       $emailChk.innerHTML = (
                            '<b class="c-blue">[사용가능한 이메일입니다.]</b>'
                        );
                        checkArr[4] = true;
                    }
                });
        }

    });

}

function checkPhone(){

    $userPhone = document.getElementById("user_phone");
    $phoneChk = document.getElementById("phoneChk");


    
    $userPhone.addEventListener('keyup', () => {
        //전화번호값 공백 확인
        if ($userPhone.value == "") {
            $userPhone.style.borderColor = 'red';
           $phoneChk.innerHTML = ('<b class="c-red">[전화번호는 필수정보에요!]</b>');
            checkArr[5] = false;
        }
        //전화번호값 유효성검사
        else if (!getPhoneNum.test($userPhone.value)) {
            $userPhone.style.borderColor = 'red';
           $phoneChk.innerHTML = ('<b class="c-red">[ex) 010-1111-2222 ]</b>');
            checkArr[5] = false;
        } else {

            //전화번호 중복확인 비동기 통신
            fetch('/member/check?type=phoneNum&value=' + $userPhone.value)
                .then(res => res.text())
                .then(flag => {
                    //console.log(flag);
                    if (flag === 'true') {
                        $userPhone.style.borderColor = 'red';
                       $phoneChk.innerHTML = (
                            '<b class="c-red">[전화번호가 중복되었습니다!]</b>');
                        checkArr[5] = false;
                    } else {
                        $userPhone.style.borderColor = 'skyblue';
                       $phoneChk.innerHTML = (
                            '<b class="c-blue">[사용가능한 전화번호입니다.]</b>'
                        );
                        checkArr[5] = true;
                    }
                });
        }

    });



}


function checkNickname(){

    $userNickname = document.getElementById("user_nickname");
    $nicknameChk = document.getElementById("nicknameChk");

    $userNickname.addEventListener('keyup', () => { 

        //별명값 공백 확인
        if ($userNickname.value === "") {
            $userNickname.style.borderColor = 'red';
            $nicknameChk.innerHTML = ('<b class="c-red">[별명은 필수정보!]</b>');
            checkArr[6] = false;
        }
        //별명값 유효성검사
        else if (!getNickname.test($userNickname.value)) {
            $userNickname.style.borderColor = 'red';
            $nicknameChk.innerHTML = ('<b class="c-red">[특수문자는 안됩니다!]</b>');
            checkArr[6] = false;
        } else {
            $userNickname.style.borderColor = 'skyblue';
            $nicknameChk.innerHTML = ('<b class="c-blue">[참 잘했어요]</b>');
            checkArr[6] = true;
        }

    });

}


function checkBirth(){

    $userBirth= document.getElementById("user_birth");
    $birthChk= document.getElementById("birthChk");

    $userBirth.addEventListener('keyup', () => { 

        //별명값 공백 확인
        if ($userBirth.value === "") {
            $userBirth.style.borderColor = 'red';
            $birthChk.innerHTML = ('<b class="c-red">[생년월일은 필수정보!]</b>');
            checkArr[7] = false;
        }
        //별명값 유효성검사
        else if (!getBirth.test($userBirth.value)) {
            $userBirth.style.borderColor = 'red';
            $birthChk.innerHTML = ('<b class="c-red">[ ex)19900101]</b>');
            checkArr[7] = false;
        } else {
            $userBirth.style.borderColor = 'skyblue';
            $birthChk.innerHTML = ('<b class="c-blue">[참 잘했어요]</b>');
            checkArr[7] = true;
        }

    });

}


function checkAddress(){

    $jusoCallBack= document.getElementById("jusoCallBack");


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

    checkArr[8] = true;
}









(function () {




    checkId();
    checkPw();
    checkName();
    checkEmail();
    checkPhone();
    checkNickname();
    checkBirth();
    checkAddress();

    const $signUpBtn = document.getElementById('signup-btn');
    const $regForm = document.getElementById('signUpForm');
    $zipNo = document.getElementById("zipNo")
    $roadAddrPart1 = document.getElementById("roadAddrPart1")
    $address = document.getElementById("user_address")

    console.log(checkArr);

    $signUpBtn.addEventListener("click", (e) => {
        e.preventDefault();
        $address.value = $zipNo.value + $roadAddrPart1.value; 
        if (!checkArr.includes(false)) {
            $regForm.submit();
        }else if (!checkArr[8]) {
            alert('주소를 입력해 주세요.')
        }
        else {
            alert('입력란을 다시 확인하세요.')
        }


    });


})();

