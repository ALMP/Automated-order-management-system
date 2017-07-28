package com.hellokoding.account.repository;

import com.hellokoding.account.Models.PayUser;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Admin on 02.01.2017.
 */
public interface PayUserrepository extends JpaRepository<PayUser, Long> {
    PayUser findByLogin(String login);

    PayUser findByLoginAndPassword(String login, String password);
}
