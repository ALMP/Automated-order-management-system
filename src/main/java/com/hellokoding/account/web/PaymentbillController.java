/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.Paymentbill;
import com.hellokoding.account.repository.PaymentBillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import javax.ws.rs.BeanParam;

/**
 *
 * @author dzni0816
 */
@RequestMapping(value = {"/admin/paymentbill"})
@Controller
public class PaymentbillController {

    @Autowired
    private PaymentBillRepository paymentBillRepository;


    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyPaymentbill() {
        return "paymentbill/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createPaymentbill(@Valid
            @BeanParam Paymentbill paymentbill) {
        paymentBillRepository.save(paymentbill);
        return "redirect:list";
    }


    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editPaymentbill(Model model, @PathVariable("id") Long id) {
        model.addAttribute("PAYMENTBILL", paymentBillRepository.findOne(id));
        return "paymentbill/update";
    }


    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updatePaymentbill(@Valid
            @BeanParam Paymentbill paymentbill) {
        paymentBillRepository.save(paymentbill);
        return "redirect:list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String removePaymentbill(@PathVariable("id") Long id) {
        paymentBillRepository.delete(paymentBillRepository.findOne(id));
        return "redirect:list";
    }


    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findPaymentbill(Model model, @PathVariable("id") Long id) {
        model.addAttribute("PAYMENTBILL", paymentBillRepository.findOne(id));
        return "paymentbill/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllPaymentbill(Model model) {
        model.addAttribute("PAYMENTBILL_LIST", paymentBillRepository.findAll());
        return "paymentbill/list";
    }
    
}
