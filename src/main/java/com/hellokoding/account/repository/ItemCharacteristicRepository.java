package com.hellokoding.account.repository;

import com.hellokoding.account.Models.ItemCharacteristic;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Admin on 17.12.2016.
 */
public interface ItemCharacteristicRepository extends JpaRepository<ItemCharacteristic, Long> {
    List<ItemCharacteristic> findByItemCharacteristic_CharacteristicId(Long fd);
    List<ItemCharacteristic> findByItem_ItemId(Long itemid);
}
