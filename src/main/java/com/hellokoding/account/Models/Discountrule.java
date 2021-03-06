/**
 * This file was generated by the JPA Modeler
 */
package com.hellokoding.account.Models;

import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * @author dzni0816
 */
@Entity
@Table(name = "discountrule")
@Transactional
public class Discountrule implements Serializable {

    @Column(name = "DRId", table = "discountrule", nullable = false)
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long dRId;

    @Column(name = "DiscountValue", table = "discountrule", precision = 12)
    @Basic
    private Float discountValue;

    @Column(name = "DiscountProcent", table = "discountrule", precision = 12)
    @Basic
    private Float discountProcent;

    @Column(name = "Type", table = "discountrule", precision = 12)
    @Basic
    private String type;

    @Column(name = "Description", table = "discountrule")
    @Basic
    private String description;

    @OneToMany(targetEntity = Itemdiscount.class, mappedBy = "discountrule1", cascade = CascadeType.REMOVE)
    private List<Itemdiscount> itemdiscounts1;

    @OneToMany(targetEntity = OrdItemDiscount.class, mappedBy = "discountrule1", cascade = CascadeType.REMOVE)
    private List<OrdItemDiscount> orditemdiscounts;

    public Long getdRId() {
        return this.dRId;
    }

    public void setdRId(Long dRId) {
        this.dRId = dRId;
    }

    public Float getDiscountValue() {
        return this.discountValue;
    }

    public void setDiscountValue(Float discountValue) {
        this.discountValue = discountValue;
    }

    public Float getDiscountProcent() {
        return this.discountProcent;
    }

    public void setDiscountProcent(Float discountProcent) {
        this.discountProcent = discountProcent;
    }

    public List<Itemdiscount> getItemdiscounts1() {
        return this.itemdiscounts1;
    }

    public void setItemdiscounts1(List<Itemdiscount> itemdiscounts1) {
        this.itemdiscounts1 = itemdiscounts1;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<OrdItemDiscount> getOrditemdiscounts() {
        return orditemdiscounts;
    }

    public void setOrditemdiscounts(List<OrdItemDiscount> orditemdiscounts) {
        this.orditemdiscounts = orditemdiscounts;
    }
}
