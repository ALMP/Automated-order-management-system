package com.hellokoding.account.repository;

import com.hellokoding.account.Models.AccountHistory;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Admin on 22.01.2017.
 */
public interface AccountHistoryRepository extends JpaRepository<AccountHistory, Integer> {

}
