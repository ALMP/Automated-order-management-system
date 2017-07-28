package com.hellokoding.account.repository;

import com.hellokoding.account.Models.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Admin on 02.01.2017.
 */
public interface AccountRepository extends JpaRepository<Account, Long> {
    List<Account> findByUser_Login(String login);

    Account findByAccountNumber(String accountnumber);
}
