package com.hellokoding.account.repository;

import com.hellokoding.account.Models.So;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Admin on 02.12.2016.
 */
public interface SORepository extends JpaRepository<So, Long> {
    List<So> findByStatusAndCustomer1_UserId(String status, String UserId);

    List<So> findByStatus(String s);

    List<So> findByCustomer1_CustomerId(Long customerid);

    List<So> findByCustomer1_UserId(String customerid);

    List<So> findByLocation(String location);
}
