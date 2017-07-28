package com.hellokoding.account.repository;

import com.hellokoding.account.Models.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Admin on 02.12.2016.
 */
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    List<Customer> findByUserId(String userid);
    Customer findByEmail(String email);
}
