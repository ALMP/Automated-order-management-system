package com.hellokoding.account.service;



import com.hellokoding.account.Models.Account;
import com.hellokoding.account.Models.PayUser;

import java.math.BigDecimal;

public class ExceptionUtils {

    private ExceptionUtils(){
    }

    public static void checkForZeroBalance(Account account) {
        if (account.getBalance().compareTo(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP)) != 0) {
            throw new RuntimeException();
        }
    }

    public static void checkBalance(BigDecimal balance, BigDecimal amount) {
        if (balance.compareTo(amount) < 0) {
            throw new RuntimeException();
        }
        checkForNegativeAndZeroAmount(amount);
    }

    public static void checkAccountForBlocking(Account account) {
        if (!account.isEnable()) {
            throw new RuntimeException();
        }
    }

    public static void checkForNegativeAndZeroAmount(BigDecimal amount) {
        if (amount.compareTo(BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP)) <= 0) {
            throw new RuntimeException();
        }
    }

    public static void checkSuperAdmin(PayUser user) {
        if (user.getRole().name().equals("ROLE_SUPER_ADMIN")) {
            throw new RuntimeException();
        }
    }

}
