package com.hellokoding.account.Models;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Admin on 17.12.2016.
 */

@Entity
@Table(name = "itemcharacteristic")
@Transactional
public class ItemCharacteristic implements Serializable{
    @Column(name = "ItemCharacteristicId", table = "itemcharacteristic", nullable = false)
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long ItemCharacteristicId;

    @ManyToOne(targetEntity = Characteristics.class)
    private Characteristics itemCharacteristic;

    @ManyToOne(targetEntity = Item.class)
    private Item item;

    public Long getItemCharacteristicId() {
        return ItemCharacteristicId;
    }

    public void setItemCharacteristicId(Long itemCharacteristicId) {
        ItemCharacteristicId = itemCharacteristicId;
    }

    public Characteristics getItemCharacteristic() {
        return itemCharacteristic;
    }

    public void setItemCharacteristic(Characteristics itemCharacteristic) {
        this.itemCharacteristic = itemCharacteristic;
    }

    public com.hellokoding.account.Models.Item getItem() {
        return item;
    }

    public void setItem(com.hellokoding.account.Models.Item item) {
        this.item = item;
    }
}
