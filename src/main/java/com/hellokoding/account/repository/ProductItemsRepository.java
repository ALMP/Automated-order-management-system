package com.hellokoding.account.repository;

import com.hellokoding.account.Models.ProductItems;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Admin on 02.12.2016.
 */
public interface ProductItemsRepository extends JpaRepository<ProductItems, Long> {
    List<ProductItems> findBySoproduct1_SOPId(Long id);
}
