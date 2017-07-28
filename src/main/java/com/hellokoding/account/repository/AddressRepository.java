package com.hellokoding.account.repository;

import com.hellokoding.account.Models.Address;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by dzni0816 on 02.12.2016.
 */
public interface AddressRepository extends JpaRepository<Address, Long> {
}
