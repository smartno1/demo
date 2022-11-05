package com.spring.demo.member.service;

import com.spring.demo.member.domain.Auth;
import com.spring.demo.member.domain.FavoriteMember;
import com.spring.demo.member.domain.Gender;
import com.spring.demo.member.domain.Member;
import com.spring.demo.member.repository.MemberMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MemberServiceTest {

    @Autowired
    MemberService service;

    @Autowired
    MemberMapper mapper;


    @Test
    @DisplayName("평문 비밀번호로 회원가입하면 암호화되어 저장된다.")
    void signUpTest() {

        Member m = new Member();
        m.setAccount("banana");
        m.setPassword("bbb1234");
        m.setFavorite(FavoriteMember.JHope);
        m.setNickname("버내나");
        m.setName("돌빠나나");
        m.setPhoneNum("010-2222-2222");
        m.setBirth("990101");
        m.setAddress("서울시 강남구");
        m.setGender(Gender.M);
        m.setEmail("banana@hanmail.net");
        m.setAuth(Auth.COMMON);


        service.signUp(m);

        Member m2 = mapper.findUser("banana");

        System.out.println("encodePassword : " + m2.getPassword());

    }

    @Test
    @DisplayName("중복된 아이디를 전달하면 true가 나와야 한다.")
    void checkAccountServiceTest() {

        //given
        String account = "banana";

        //when
        boolean flag = service.checkSignUpValue("account", account);

        //then
        assertTrue(flag);

    }



}


