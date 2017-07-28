package com.hellokoding.account.repository;

import com.hellokoding.account.Models.Itemgroup;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by Admin on 02.12.2016.
 */
public interface ItemGroupRepository extends JpaRepository<Itemgroup, Long> {
    List<Itemgroup> findByGroups1_GroupId(Long group);
    List<Itemgroup> findByItem1_ItemId(Long item);
}
