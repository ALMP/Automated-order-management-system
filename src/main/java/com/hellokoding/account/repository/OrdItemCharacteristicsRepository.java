package com.hellokoding.account.repository;

import com.hellokoding.account.Models.ItemCharacteristic;
import com.hellokoding.account.Models.OrdItemCharacteristic;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Admin on 17.12.2016.
 */
public interface OrdItemCharacteristicsRepository extends JpaRepository<OrdItemCharacteristic, Long> {
    List<OrdItemCharacteristic> findByOrdItem_orditemId(Long id);
}
