package com.hellokoding.account.Models;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Admin on 17.12.2016.
 */

@Entity
@Table(name = "orditemcharacteristic")
@Transactional
public class OrdItemCharacteristic implements Serializable {
    @Column(name = "OrdItemCharacteristicId", table = "orditemcharacteristic", nullable = false)
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long ordItemCharacteristicId;

    @ManyToOne(targetEntity = Characteristics.class)
    private Characteristics ItemCharacteristic;

    @ManyToOne(targetEntity = OrdItem.class)
    private OrdItem ordItem;

    public Long getOrdItemCharacteristicId() {
        return ordItemCharacteristicId;
    }

    public void setOrdItemCharacteristicId(Long ordItemCharacteristicId) {
        this.ordItemCharacteristicId = ordItemCharacteristicId;
    }

    public com.hellokoding.account.Models.OrdItem getOrdItem() {
        return ordItem;
    }

    public void setOrdItem(com.hellokoding.account.Models.OrdItem ordItem) {
        this.ordItem = ordItem;
    }

    public Characteristics getItemCharacteristic() {
        return ItemCharacteristic;
    }

    public void setItemCharacteristic(Characteristics itemCharacteristic) {
        ItemCharacteristic = itemCharacteristic;
    }
}
