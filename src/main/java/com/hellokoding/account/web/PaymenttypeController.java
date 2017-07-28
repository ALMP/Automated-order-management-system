/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.Paymenttype;
import com.hellokoding.account.repository.PaymentTypeRepository;
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
@RequestMapping(value = {"/admin/paymenttype"})
@Controller
public class PaymenttypeController {

    @Autowired
    private PaymentTypeRepository paymentTypeRepository;

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyPaymenttype() {
        return "paymenttype/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createPaymenttype(@Valid
            @BeanParam Paymenttype paymenttype) {
        paymentTypeRepository.save(paymenttype);
        return "redirect:list";
    }


    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editPaymenttype(Model model, @PathVariable("id") Long id) {
        model.addAttribute("PAYMENTTYPE", paymentTypeRepository.findOne(id));
        return "paymenttype/update";
    }


    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updatePaymenttype(@Valid
            @BeanParam Paymenttype paymenttype) {
        paymentTypeRepository.save(paymenttype);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String removePaymenttype(@PathVariable("id") Long id) {
        paymentTypeRepository.delete(paymentTypeRepository.findOne(id));
        return "redirect:list";
    }


    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findPaymenttype(Model model, @PathVariable("id") Long id) {
        model.addAttribute("PAYMENTTYPE", paymentTypeRepository.findOne(id));
        return "paymenttype/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllPaymenttype(Model model) {
        model.addAttribute("PAYMENTTYPE_LIST", paymentTypeRepository.findAll());
        return "paymenttype/list";
    }
    
}
