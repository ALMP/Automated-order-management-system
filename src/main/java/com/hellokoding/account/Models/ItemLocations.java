package com.hellokoding.account.Models;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.ws.rs.FormParam;
import java.io.Serializable;

/**
 * Created by dzni0816 on 21.12.2016.
 */
@Entity
@Table(name = "itemlocations")
@Transactional
public class ItemLocations implements Serializable {

    @Column(name = "ILid", table = "itemlocations", nullable = false)
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long iLid;

    @ManyToOne(targetEntity = Locations.class)
    private Locations location;

    @ManyToOne(targetEntity = Item.class)
    private Item item;

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Locations getLocation() {
        return location;
    }

    public void setLocation(Locations location) {
        this.location = location;
    }

    public Long getiLid() {
        return iLid;
    }

    public void setiLid(Long iLid) {
        this.iLid = iLid;
    }
}
