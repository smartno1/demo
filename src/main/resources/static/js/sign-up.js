

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
const checkArr = [false, false, false, false, false, false, false, false, false];






function checkId() {

    const $idInput = document.getElementById('user_id');


    $idInput.addEventListener('keyup',  () => {


        const $idChk = document.getElementById('idChk');


        // 아이디를 입력하지 않은 경우
        if ($idInput.value.trim() === '') {
            $idInput.style.borderColor = 'red';
            $idChk.innerHTML = '<b class="c-red">[아이디는 필수 정보입니다.]</b>';
            checkArr[0] = false;

        } else if (!getIdCheck.test($idInput.value)) {
            // 아이디를 패턴에 맞지 않게 입력하였을 경우
            // test() 메서드는 정규표현식을 검증하여 입력값이 표현식과
            // 일치하면 true, 일치하지 않으면 false를 리턴
            console.log("invalid ID");
            $idInput.style.borderColor = 'red';
            $idChk.innerHTML = '<b class="c-red">[영문, 숫자로 4~14자 사이로 작성하세요!]</b>';
            checkArr[0] = false;
        } else { // 아이디 중복 확인 검증
            fetch('/member/check?type=account&value=' + $idInput.value)
                .then(res => res.text())
                .then(flag => {
                    console.log('flag:', flag);
                    if (flag === 'true') {
                        $idInput.style.borderColor = 'red';
                        $idChk.innerHTML = ('<b class="c-red">[중복된 아이디입니다.]</b>');
                        checkArr[0] = false;
                    } else {
                        // 정상적으로 입력한 경우
                        $idInput.style.borderColor = 'skyblue';
                        $idChk.innerHTML = ('<b class="c-blue">[사용가능한 아이디입니다.]</b>');
                        checkArr[0] = true;
                    }
                });

        }

    })

}

function checkPw() {

    $password = document.getElementById('password');
    $pwChk = document.getElementById('pwChk');
    

    //2. 패스워드 입력값 검증.
    $password.addEventListener('keyup', () => {
        //비밀번호 공백 확인
        console.log($password.value.length)
        if ($password.value === "") {
            $password.style.borderColor = 'red';
            $pwChk.innerHTML=('<b class="c-red">[패스워드는 필수정보!]</b>');
            checkArr[1] = false;
        }
        //비밀번호 유효성검사
        else if (!getPwCheck.test($password.value) || $password.value.length < 8) {
            $password.style.borderColor = 'red';
            $pwChk.innerHTML=('<b class="c-red">[특수문자 포함 8자이상]</b>');
            checkArr[1] = false;
        } else {
            $password.style.borderColor = 'skyblue';
            $pwChk.innerHTML=('<b class="c-blue">[참 잘했어요]</b>');
            checkArr[1] = true;
        }

    });

    $passwordCheck = document.getElementById('password_check');
    $pwChk2 = document.getElementById('pwChk2');
    //패스워드 확인란 입력값 검증.
    $passwordCheck.addEventListener('keyup', () => {
        //비밀번호 확인란 공백 확인
        if ($passwordCheck.value === "") {
            $passwordCheck.style.borderColor = 'red';
            $pwChk2.innerHTML=('<b class="c-red">[패스워드확인은 필수정보!]</b>');
            checkArr[2] = false;
        }
        //비밀번호 확인란 유효성검사
        else if ($password.value !== $passwordCheck.value) {
            $passwordCheck.style.borderColor = 'red';
            $pwChk2.innerHTML=('<b class="c-red">[위에랑 똑같이!!]</b>');
            checkArr[2] = false;
        } else {
            $passwordCheck.style.borderColor = 'skyblue';
            $pwChk2.innerHTML=('<b class="c-blue">[참 잘했어요]</b>');
            checkArr[2] = true;
        }

    });

}

function checkName(){

    $userName = document.getElementById("user_name");
    $nameChk = document.getElementById("nameChk");

    $userName.addEventListener('keyup', () => { 

        //이름값 공백 확인
        if ($userName.value === "") {
            $userName.style.borderColor = 'red';
            $nameChk.innerHTML = ('<b class="c-red">[이름은 필수정보!]</b>');
            checkArr[3] = false;
        }
        //이름값 유효성검사
        else if (!getName.test($userName.value)) {
            $userName.style.borderColor = 'red';
            $nameChk.innerHTML = ('<b class="c-red">[이름은 한글로 ~]</b>');
            checkArr[3] = false;
        } else {
            $userName.style.borderColor = 'skyblue';
            $nameChk.innerHTML = ('<b class="c-blue">[참 잘했어요]</b>');
            checkArr[3] = true;
        }

    });

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
            checkArr[6] = false;
        }
        //별명값 유효성검사
        else if (!getBirth.test($userBirth.value)) {
            $userBirth.style.borderColor = 'red';
            $birthChk.innerHTML = ('<b class="c-red">[ 숫자만~ ex)19900101]</b>');
            checkArr[6] = false;
        } else {
            $userBirth.style.borderColor = 'skyblue';
            $birthChk.innerHTML = ('<b class="c-blue">[참 잘했어요]</b>');
            checkArr[6] = true;
        }

    });

}


function checkAddress(){




}







(function () {




    checkId();
    checkPw();
    checkName();
    checkEmail();
    checkPhone();
    checkNickname();
    checkBirth();

    const $signUpBtn = document.getElementById('signup-btn');
    const $regForm = document.getElementById('signUpForm');

    $signUpBtn.addEventListener("click", (e) => {
        e.preventDefault();
        if (!checkArr.includes(false)) {
            $regForm.submit();
        } else {
            alert('입력란을 다시 확인하세요.')
        }


    });


})();

