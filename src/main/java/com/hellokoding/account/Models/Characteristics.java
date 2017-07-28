package com.hellokoding.account.Models;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Admin on 17.12.2016.
 */
@Entity
@Table(name = "characteristics")
@Transactional
public class Characteristics implements Serializable {
    @Column(name = "characteristicId", table = "characteristics", nullable = false)
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long characteristicId;

    @Column(name = "Characteristic", table = "characteristics")
    @Basic
    private String Characteristic;

    @Column(name = "CharacteristicValue", table = "characteristics")
    @Basic
    private String CharacteristicValue;

    @OneToMany(targetEntity = ItemCharacteristic.class, mappedBy = "itemCharacteristic", cascade = CascadeType.REMOVE)
    private List<ItemCharacteristic> itemCharacteristic;

    @OneToMany(targetEntity = OrdItemCharacteristic.class, mappedBy = "ItemCharacteristic", cascade = CascadeType.REMOVE)
    private List<OrdItemCharacteristic> orditemCharacteristic;

    public Long getCharacteristicId() {
        return characteristicId;
    }

    public void setCharacteristicId(Long characteristicId) {
        this.characteristicId = characteristicId;
    }

    public String getCharacteristic() {
        return Characteristic;
    }

    public void setCharacteristic(String characteristic) {
        Characteristic = characteristic;
    }

    public String getCharacteristicValue() {
        return CharacteristicValue;
    }

    public void setCharacteristicValue(String characteristicValue) {
        CharacteristicValue = characteristicValue;
    }

    public List<ItemCharacteristic> getItemCharacteristic() {
        return itemCharacteristic;
    }

    public void setItemCharacteristic(List<ItemCharacteristic> itemCharacteristic) {
        this.itemCharacteristic = itemCharacteristic;
    }

    public List<OrdItemCharacteristic> getOrditemCharacteristic() {
        return orditemCharacteristic;
    }

    public void setOrditemCharacteristic(List<OrdItemCharacteristic> orditemCharacteristic) {
        this.orditemCharacteristic = orditemCharacteristic;
    }
}
