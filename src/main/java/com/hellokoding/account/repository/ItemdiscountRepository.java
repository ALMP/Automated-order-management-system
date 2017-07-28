package com.hellokoding.account.repository;

import com.hellokoding.account.Models.Itemdiscount;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Admin on 02.12.2016.
 */
public interface ItemdiscountRepository extends JpaRepository<Itemdiscount, Long> {
    List<Itemdiscount> findByItem1_ItemId(Long itemid);
    List<Itemdiscount> findByDiscountrule1_DRId(Long i);
}
