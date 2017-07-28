package com.hellokoding.account.repository;

import com.hellokoding.account.Models.ItemLocations;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by dzni0816 on 21.12.2016.
 */
public interface ItemLocationRepository extends JpaRepository<ItemLocations, Long> {
    List<ItemLocations> findByLocation_Locationname(String location);
    List<ItemLocations> findByLocation_LocationId(Long loc);
    List<ItemLocations> findByItem_ItemId(Long item);
}
