package com.spring.demo.account.service;

import com.spring.demo.account.domain.Account;
import com.spring.demo.account.repository.AccountMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class AccountService {

    private final AccountMapper accountMapper;

    public Account loginService(Account account){
        log.info("login service start ", account);
        return accountMapper.login(account);
    }

    public boolean joinService(Account account){
        log.info("join service start", account);

        return accountMapper.join(account);
    }
}
