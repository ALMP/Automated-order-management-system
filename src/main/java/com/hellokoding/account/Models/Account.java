package com.hellokoding.account.Models;


import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Entity
@Table(name = "accounts", uniqueConstraints = {@UniqueConstraint(columnNames = "account_number", name = "account_number_idx")})
public class Account {

    @Column(name = "accid", nullable = false)
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long accid;

    @Column(name = "name", nullable = false)
    @NotEmpty
    private String name;

    @Column(name = "account_number")
    private String accountNumber;

    @Enumerated(EnumType.STRING)
    @Column(name = "currency", nullable = false)
    @NotNull
    private Currency currency;

    @Column(name = "balance", nullable = false, scale = 2)
    @NotNull
    private BigDecimal balance;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private PayUser user;

    @Column(name = "enabled", nullable = false)
    @NotNull
    private boolean enable = true;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public Currency getCurrency() {
        return currency;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public PayUser getPayUser() {
        return user;
    }

    public void setPayUser(PayUser user) {
        this.user = user;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public Long getAccid() {
        return accid;
    }

    public void setAccid(Long accid) {
        this.accid = accid;
    }
}
