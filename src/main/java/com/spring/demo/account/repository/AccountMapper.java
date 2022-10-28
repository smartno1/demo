package com.spring.demo.account.repository;

import com.spring.demo.account.domain.Account;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccountMapper {

    // 로그인
    Account login(Account account);

    // 로그아웃
    String logout(Account account);

    // 회원가입
    boolean join(Account account);

    // 정보수정
    int modify(Account account);

    // 회원탈퇴
    int remove(Account account);
}
