<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">



<head>
    <%@ include file="../include/static-head.jsp" %>

    <style>
        .wrap {
            margin: 200px auto;
        }

        .c-red {
            color: #e00;
        }

        .c-blue {
            color: rgb(25, 236, 120);
        }
    </style>

    <script src="/js/sign-up.js" defer></script>
</head>

<body>




    <div class="container wrap">
        <div class="row">
            <div class="offset-md-2 col-md-4" " >
                <div class="card" style="width:200%; " >
                    <div class="card-header text-white" style="background: #343A40;">
                        <h2 style="text-align:center"><span style="color: ORANGE;">DEMO</span> 회원 가입</h2>
                    </div>
                    <div class="card-body">


                        <form action="/member/sign-up" name="signup" id="signUpForm" method="post"
                            style="margin-bottom: 0;">


                            <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                                <tr>
                                    <td style="text-align: left">
                                        <p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;
                                            <span id="idChk"></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="account" id="user_id"
                                            class="form-control tooltipstered" maxlength="14" required="required"
                                            aria-required="true"
                                            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                            placeholder="숫자와 영어로 4-14자">
                                    </td>

                                </tr>

                                <tr>
                                    <td style="text-align: left">
                                        <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="password" size="17" maxlength="20" id="password" name="password"
                                            class="form-control tooltipstered" maxlength="20" required="required"
                                            aria-required="true"
                                            style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                                            placeholder="영문과 특수문자를 포함한 최소 8자"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        <p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="password" size="17" maxlength="20" id="password_check"
                                            name="pw_check" class="form-control tooltipstered" maxlength="20"
                                            required="required" aria-required="true"
                                            style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                                            placeholder="비밀번호가 일치해야합니다."></td>
                                </tr>

                                <tr>
                                    <td style="text-align: left">
                                        <p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="name" id="user_name" class="form-control tooltipstered"
                                            maxlength="6" required="required" aria-required="true"
                                            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                            placeholder="한글로 최대 6자"></td>
                                </tr>

                                <tr>
                                    <td style="text-align: left">
                                        <p><strong>별명을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nicknameChk"></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="nickname" id="user_nickname" class="form-control tooltipstered"
                                            maxlength="10" required="required" aria-required="true"
                                            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                            placeholder="별명은 최대 10자"></td>
                                </tr>

                                <tr>
                                    <td style="text-align: left">
                                        <p><strong>주소를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="addressChk"></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="address" id="user_address" class="form-control tooltipstered"
                                            maxlength="30" required="required" aria-required="true"
                                            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                            placeholder=""></td>
                                </tr>

                                <tr>
                                    <td style="text-align: left">
                                        <p><strong>전화번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="phoneChk"></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="phoneNum" id="user_phone" class="form-control tooltipstered"
                                            maxlength="13" required="required" aria-required="true"
                                            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                            placeholder="ex)01012345678"></td>
                                </tr>

                                <tr>
                                    <td style="text-align: left">
                                        <p><strong>생년월일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="birthChk"></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="birth" id="user_birth" class="form-control tooltipstered"
                                            maxlength="8" required="required" aria-required="true"
                                            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                            placeholder="ex)19900101"></td>
                                </tr>





                                <tr>
                                    <td style="text-align: left">
                                        <p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="email" name="email" id="user_email"
                                            class="form-control tooltipstered" required="required" aria-required="true"
                                            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                            placeholder="ex) abc@mvc.com"></td>
                                </tr>


                                <tr>
                                    <td style="text-align: left">
                                        <strong>성별</strong>&nbsp;&nbsp;&nbsp;<span id="genderChk"></span>
                                        
                                        <select name="gender" id="user_gender"  style="margin-bottom: 20px;"> 
                                            <option value="M">남성</option>
                                            <option value="F">여성</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: left">
                                        <strong>가장 좋아하는 멤버</strong>&nbsp;&nbsp;&nbsp;<span id="favoriteChk"></span>
                                        <select name="favorite" id="user_favorite"  style="margin-bottom: 20px;"> 
                                            <option value="Suga">슈가</option>
                                            <option value="V">뷔</option>
                                            <option value="RM">랩몬스터</option>
                                            <option value="Jin">진</option>
                                            <option value="Jimin">지민</option>
                                            <option value="Jhope">제이홉</option>
                                            <option value="JungKook">정국</option>

                                        </select>
                                        
                                    </td>
                                </tr>


                                <tr>
                                    <td style="padding-top: 10px; text-align: center">
                                        <p><strong>회원가입하셔서 더 많은 서비스를 사용하세요~~!</strong></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; text-align: center; colspan: 2;">
                                        <input type="button" value="회원가입" class="btn form-control tooltipstered"
                                            id="signup-btn"
                                            style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
                                    </td>
                                </tr>

                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>





</body>

</html>