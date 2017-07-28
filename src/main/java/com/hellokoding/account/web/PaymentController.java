/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.Payment;
import com.hellokoding.account.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import javax.ws.rs.BeanParam;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author dzni0816
 */
@RequestMapping(value = {"/admin/payment"})
@Controller
public class PaymentController {

    @Autowired
    private PaymentRepository paymentRepository;

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyPayment() {
        return "payment/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createPayment(@Valid
            @BeanParam Payment payment) {
        Calendar cal = Calendar.getInstance();
        Date date=cal.getTime();
        DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        String formattedDate=dateFormat.format(date);
        payment.setPaymentDate(date);
        paymentRepository.save(payment);
        return "redirect:list";
    }


    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editPayment(Model model, @PathVariable("id") Long id) {
        model.addAttribute("PAYMENT", paymentRepository.findOne(id));
        return "payment/update";
    }


    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updatePayment(@Valid
            @BeanParam Payment payment) {
        paymentRepository.save(payment);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String removePayment(@PathVariable("id") Long id) {
        paymentRepository.delete(paymentRepository.findOne(id));
        return "redirect:list";
    }


    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findPayment(Model model, @PathVariable("id") Long id) {
        model.addAttribute("PAYMENT", paymentRepository.findOne(id));
        return "payment/view";
    }


    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllPayment(Model model) {
        model.addAttribute("PAYMENT_LIST", paymentRepository.findAll());
        return "payment/list";
    }
    
}
