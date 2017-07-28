package com.hellokoding.account.Models;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;


@Entity
@Table(name = "account_histories")
public class AccountHistory{
    public final static String GET_ALL_BY_USER_ID = "AccountHistory.getAllByUserId";
    public final static String GET_ALL_BY_ACCOUNT_ID = "AccountHistory.getAllByAccountId";
    public final static String GET_BY_ID = "AccountHistory.getById";
    public final static String GET_BETWEEN_BY_USER_ID = "AccountHistory.getBetweenByUserId";
    public final static String GET_ALL_BETWEEN_BY_ACCOUNT_ID = "AccountHistory.getBetweenByAccountId";
    public final static String GET_DEBIT_BETWEEN_BY_ACCOUNT_ID = "AccountHistory.getDebitBetweenByAccountId";
    public final static String GET_CREDIT_BETWEEN_BY_ACCOUNT_ID = "AccountHistory.getCreditBetweenByAccountId";
    public final static String GET_COMMISSION_HISTORY = "AccountHistory.getCommissionHistory";

    @Column(name = "achisId")
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer achisId;

    @Column(name = "from_user_id")
    @NotNull
    private Integer fromUserId;

    @Column(name = "to_user_id", nullable = false)
    @NotNull
    private Integer toUserId;

    @Column(name = "from_account_id")
    private Integer fromAccountId;

    @Column(name = "to_account_id", nullable = false)
    @NotNull
    private Integer toAccountId;

    @Column(name = "operation_time")
    private Timestamp operationTime = Timestamp.valueOf(LocalDateTime.now());

    @Column(name = "sender_currency", nullable = false)
    @NotNull
    private Currency senderCurrency;

    @Column(name = "recipient_currency", nullable = false)
    @NotNull
    private Currency recipientCurrency;

    @Column(name = "from_account_number")
    private String fromAccountNumber = "";

    @Column(name = "to_account_number", nullable = false)
    @NotEmpty
    private String toAccountNumber;

    @Column(name = "comment", nullable = false)
    @NotNull
    private String comment;

    @Column(name = "sender_amount", nullable = false)
    @NotNull
    private BigDecimal senderAmount;

    @Column(name = "recipient_amount", nullable = false)
    @NotNull
    private BigDecimal recipientAmount;

    @Column(name = "commission")
    private BigDecimal commission;

    @Column(name = "amount_after_operation_on_sender")
    private BigDecimal amountAfterOperationOnSender;

    @Column(name = "amount_after_operation_in_recipient", nullable = false)
    @NotNull
    private BigDecimal amountAfterOperationInRecipient;

    public AccountHistory(){
    }

    public AccountHistory(Integer fromUserId, Integer toUserId,
                          Integer fromAccountId, Integer toAccountId,
                          Currency senderCurrency, Currency recipientCurrency,
                          String fromAccountNumber, String toAccountNumber,
                          String comment,
                          BigDecimal senderAmount,
                          BigDecimal recipientAmount,
                          BigDecimal commission,
                          BigDecimal amountAfterOperationOnSender, BigDecimal amountAfterOperationInRecipient) {
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.fromAccountId = fromAccountId;
        this.toAccountId = toAccountId;
        this.senderCurrency = senderCurrency;
        this.recipientCurrency = recipientCurrency;
        this.fromAccountNumber = fromAccountNumber;
        this.toAccountNumber = toAccountNumber;
        this.comment = comment;
        this.senderAmount = senderAmount;
        this.recipientAmount = recipientAmount;
        this.commission = commission;
        this.amountAfterOperationOnSender = amountAfterOperationOnSender;
        this.amountAfterOperationInRecipient = amountAfterOperationInRecipient;
    }

    public Integer getFromUserId() {
        return fromUserId;
    }

    public void setFromUserId(Integer fromUserId) {
        this.fromUserId = fromUserId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getToUserId() {
        return toUserId;
    }

    public void setToUserId(Integer toUserId) {
        this.toUserId = toUserId;
    }

    public Integer getFromAccountId() {
        return fromAccountId;
    }

    public void setFromAccountId(Integer fromAccountId) {
        this.fromAccountId = fromAccountId;
    }

    public Integer getToAccountId() {
        return toAccountId;
    }

    public void setToAccountId(Integer toAccountId) {
        this.toAccountId = toAccountId;
    }

    public Currency getSenderCurrency() {
        return senderCurrency;
    }

    public void setSenderCurrency(Currency senderCurrency) {
        this.senderCurrency = senderCurrency;
    }

    public Currency getRecipientCurrency() {
        return recipientCurrency;
    }

    public void setRecipientCurrency(Currency recipientCurrency) {
        this.recipientCurrency = recipientCurrency;
    }

    public String getFromAccountNumber() {
        return fromAccountNumber;
    }

    public void setFromAccountNumber(String fromAccountNumber) {
        this.fromAccountNumber = fromAccountNumber;
    }

    public String getToAccountNumber() {
        return toAccountNumber;
    }

    public void setToAccountNumber(String toAccountNumber) {
        this.toAccountNumber = toAccountNumber;
    }

    public BigDecimal getSenderAmount() {
        return senderAmount;
    }

    public void setSenderAmount(BigDecimal senderAmount) {
        this.senderAmount = senderAmount;
    }

    public BigDecimal getRecipientAmount() {
        return recipientAmount;
    }

    public void setRecipientAmount(BigDecimal recipientAmount) {
        this.recipientAmount = recipientAmount;
    }

    public BigDecimal getCommission() {
        return commission;
    }

    public void setCommission(BigDecimal commission) {
        this.commission = commission;
    }

    public BigDecimal getAmountAfterOperationOnSender() {
        return amountAfterOperationOnSender;
    }

    public void setAmountAfterOperationOnSender(BigDecimal amountAfterOperationOnSender) {
        this.amountAfterOperationOnSender = amountAfterOperationOnSender;
    }

    public BigDecimal getAmountAfterOperationInRecipient() {
        return amountAfterOperationInRecipient;
    }

    public void setAmountAfterOperationInRecipient(BigDecimal amountAfterOperationInRecipient) {
        this.amountAfterOperationInRecipient = amountAfterOperationInRecipient;
    }

    public Timestamp getOperationTime() {
        return operationTime;
    }

    public void setOperationTime(Timestamp operationTime) {
        this.operationTime = operationTime;
    }

    public Integer getAchisId() {
        return achisId;
    }

    public void setAchisId(Integer achisId) {
        this.achisId = achisId;
    }
}