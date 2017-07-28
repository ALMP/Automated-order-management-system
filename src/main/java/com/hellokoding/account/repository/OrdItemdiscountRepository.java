package com.hellokoding.account.repository;

import com.hellokoding.account.Models.OrdItemDiscount;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Admin on 17.12.2016.
 */
public interface OrdItemdiscountRepository  extends JpaRepository<OrdItemDiscount, Long> {
    List<OrdItemDiscount> findByOrdItem_orditemId(Long id);
}
