package com.hellokoding.account.Models;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import javax.ws.rs.FormParam;
import java.io.Serializable;

/**
 * Created by Admin on 17.12.2016.
 */
@Entity
@Table(name = "orditemdiscount")
@Transactional
public class OrdItemDiscount implements Serializable {

    @Column(name = "ordIDid", table = "orditemdiscount", nullable = false)
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long ordIDid;

    @ManyToOne(targetEntity = OrdItem.class)
    private OrdItem ordItem;

    @ManyToOne(targetEntity = Discountrule.class)
    private Discountrule discountrule1;

    public com.hellokoding.account.Models.OrdItem getOrdItem() {
        return ordItem;
    }

    public void setOrdItem(com.hellokoding.account.Models.OrdItem ordItem) {
        this.ordItem = ordItem;
    }

    public Discountrule getDiscountrule1() {
        return discountrule1;
    }

    public void setDiscountrule1(Discountrule discountrule1) {
        this.discountrule1 = discountrule1;
    }

    public Long getOrdIDid() {
        return ordIDid;
    }

    public void setOrdIDid(Long ordIDid) {
        this.ordIDid = ordIDid;
    }
}
