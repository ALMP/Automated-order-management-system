package com.hellokoding.account.web;

import com.hellokoding.account.Models.Payment;
import com.hellokoding.account.Models.Paymentbill;
import com.hellokoding.account.Models.So;
import com.hellokoding.account.repository.PaymentRepository;
import com.hellokoding.account.repository.SORepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Admin on 03.12.2016.
 */
@Service
@EnableScheduling
public class PaymentProcessorService {

    @Autowired
    PaymentRepository paymentRepository;
    @Autowired
    SORepository soRepository;


    public Float paymentCount(Payment payment){
        Paymentbill paymentbill = payment.getPaymentbill1();
        if ("OneTimePay".equals(payment.getPaymenttype1().getTypeName())){
            return paymentbill.getCotp() - paymentbill.getCOTPDisc();
        } else if ("MultiTimePay".equals(payment.getPaymenttype1().getTypeName())){
            return paymentbill.getCmp() - paymentbill.getCMPDisc();
        } else if ("MixPay".equals(payment.getPaymenttype1().getTypeName())){

            return paymentbill.getCotp() - paymentbill.getCOTPDisc();
        }
        return null;
    }

//    @Scheduled(cron = "*/10 * * * * *")
    @Scheduled(cron = "0 0 12 * * *")
    public void paymentTimer(){
        List<Payment> payments = paymentRepository.findAll();
        for (Payment payment : payments){
            if (payment.getSo1().getFinalMP() != null
                    && payment.getSo1().getFinalMPwithTaxAndDiscount() != null
                    && !BigDecimal.ZERO.equals(payment.getSo1().getFinalMPwithTaxAndDiscount())
                    && payment.getSo1().getStatus().equals("Ordered")) {
                try {
                    Date date = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    Date paymentDate = formatter.parse(payment.getSo1().getOrderDate());
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(paymentDate);
                    cal.add(Calendar.DATE, 27);
                    paymentDate = cal.getTime();
                    long left = Math.abs(date.getTime() - paymentDate.getTime());
                    long days = left / (24 * 60 * 60 * 1000);
                    if (paymentDate.before(date) && days >= 0) {
                        So so = payment.getSo1();
                        so.setAttentionFlag("Waiting for payment. Days left: " + days);
                        soRepository.save(so);
                    } else if (days < 0){
                        So so = payment.getSo1();
                        so.setAttentionFlag("Services stopped");
                        soRepository.save(so);
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
