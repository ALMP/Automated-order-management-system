package com.hellokoding.account.repository;

import com.hellokoding.account.Models.OrdItem;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Admin on 17.12.2016.
 */
public interface OrdItemRepository extends JpaRepository<OrdItem, Long> {
}
