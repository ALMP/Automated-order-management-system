/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.*;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.BeanParam;
import java.math.BigDecimal;
import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author dzni0816
 */
@RequestMapping(value = {"admin/so"})
@Controller
public class SoController {

    @Autowired
    OrdItemRepository ordItemRepository;
    @Autowired
    OrdItemdiscountRepository ordItemdiscountRepository;
    @Autowired
    OrdItemCharacteristicsRepository ordItemCharacteristicsRepository;
    @Autowired
    SORepository soRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    ProductItemsRepository productItemsRepository;
    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    SOProductRepository soProductRepository;
    @Autowired
    private PaymentRepository paymentFacade;
    @Autowired
    private PaymentBillRepository paymentBillRepository;
    @Autowired
    private PaymentTypeRepository paymentTypeRepository;
    @Inject
    private ErrorBean error;


    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptySo(Model model) {
        model.addAttribute("CUSTOMER_LIST", customerRepository.findAll());
        return "/so/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createSo(Model model, So so, Soproduct soproduct, @RequestParam("socustomer") String cust) {
        Customer customer = customerRepository.findOne(Long.valueOf(cust));
        if (so.getOrderDate().equals("")){
            so.setOrderDate(null);
        }
        so.setFinalMP(BigDecimal.ZERO);
        so.setFinalOTP(BigDecimal.ZERO);
        so.setLocation(customer.getAddress1().getCountry());
        so.setFinalMPwithTaxAndDiscount(BigDecimal.ZERO);
        so.setFinalOTPwithTaxAndDiscount(BigDecimal.ZERO);
        so.setCustomer1(customer);
        soRepository.save(so);
        soproduct.setSOPId(so.getSOId());
        soproduct.setSo1(so);
        soProductRepository.save(soproduct);
        return "redirect:list";
    }


    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editSo(Model model, @PathVariable("id") Long id) {
        model.addAttribute("SO", soRepository.findOne(id));
        return "so/update";
    }

    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateSo(@Valid
                                @BeanParam So so) {
        soRepository.save(so);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateSo(@Valid
                                @BeanParam So so, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        soRepository.save(so);
        return "redirect:list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public String removeSo(@PathVariable("id") Long id) {
        soRepository.delete(id);
        return "redirect:/admin/so/list";
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findSo(Model model, @PathVariable("id") Long id) {
        model.addAttribute("SO", soRepository.findOne(id));
        model.addAttribute("PROD", productItemsRepository.findBySoproduct1_SOPId(id));
        model.addAttribute("USER", userRepository.findOne(Long.valueOf(soRepository.findOne(id).getCustomer1().getUserId())));
        return "so/view";
    }

    @RequestMapping(value = {"/pays/{id}"}, method = RequestMethod.GET)
    public String pay(Model model, @PathVariable("id") Long id) {
        model.addAttribute("SO", soRepository.findOne(id));
        model.addAttribute("PAY", paymentFacade.findAll());
        model.addAttribute("PROD", productItemsRepository.findBySoproduct1_SOPId(id));
        model.addAttribute("USER", userRepository.findOne(Long.valueOf(soRepository.findOne(id).getCustomer1().getUserId())));
        return "so/pay";
    }

    @RequestMapping(value = {"/item/{id}/{s}"}, method = RequestMethod.GET)
    public String findItem(Model model, @PathVariable("id") Long id, @PathVariable("s") Long s) {
        model.addAttribute("SO", s);
        model.addAttribute("ITEM", ordItemRepository.findOne(id));
        model.addAttribute("DISC", ordItemdiscountRepository.findByOrdItem_orditemId(id));
        model.addAttribute("CHAR", ordItemCharacteristicsRepository.findByOrdItem_orditemId(id));
        return "so/item";
    }

    @RequestMapping(value = {"/pay/{id}"}, method = RequestMethod.GET)
    public String fakePay(Model model, @PathVariable("id") Long qw, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
//        Long userid = userRepository.findByUsername(principal.getName()).getId();
//        if ( soRepository.findOne(qw) == null
//                || !soRepository.findOne(qw).getCustomer1().getUserId().equals(userid.toString())){
//            model.addAttribute("message", "You cannot process this order");
//            return "error";
//        }

        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        Float CMP = 0f;
        Float OTP = 0f;
        So so = soRepository.findOne(qw);
        if (!so.getStatus().equals("Ordered")) {
            Paymentbill paymentbill = new Paymentbill();
            List<ProductItems> productItems = productItemsRepository.findAll();
            List<ProductItems> productItemsList = new ArrayList<>();
            for (ProductItems pi : productItems){
                if (pi.getOrdItem().getStatus().equals("Wait")  && qw.equals(pi.getSoproduct1().getSo1().getSOId())){
                    CMP += pi.getMPWithTaxandDiscont();
                    OTP += pi.getOTPWithTaxandDiscont();
                }
            }

            Integer signal = 0;
            for (ProductItems product : productItems) {
                if (product.getOrdItem().getStatus().equals("Wait") && qw.equals(product.getSoproduct1().getSo1().getSOId())) {
                    if (product.getOrdItem().getDefOTP() != 0 || product.getOrdItem().getDefOTP() != null){
                        signal+=1;
                    }
                }
            }
            if (signal != 0){
                paymentbill.setCotp(OTP);
            } else {
                paymentbill.setCmp(CMP);
            }
            for (ProductItems product : productItems) {
                if (product.getOrdItem().getStatus().equals("Wait") && qw.equals(product.getSoproduct1().getSo1().getSOId())) {
                    OrdItem item = product.getOrdItem();
                    item.setStatus("Ordered");
                    ordItemRepository.save(item);
                }
            }
            so.setStatus("Ordered");
            so.setFinalOTPwithTaxAndDiscount(BigDecimal.ZERO);
            so.setOrderDate(dateFormat.format(date));
            soRepository.save(so);
            paymentBillRepository.save(paymentbill);
            Payment payment = new Payment();
            payment.setPaymentDate(date);
            payment.setPaymentInfo("Payment was succesfull");
            payment.setSo1(so);
            payment.setPaymentbill1(paymentbill);
            payment.setPaymenttype1(paymentTypeRepository.findOne(2L));
            paymentFacade.save(payment);
            so.setPurchaseOrderNumber(payment.getPaymentId().toString());
            soRepository.save(so);
        } else if (so.getAttentionFlag() != null && so.getAttentionFlag().contains("Waiting for payment") && so.getStatus().equals("Ordered")){
            try {
                Paymentbill paymentbill = new Paymentbill();
                List<ProductItems> productItems = productItemsRepository.findAll();
                List<ProductItems> productItemsList = new ArrayList<>();
                for (ProductItems pi : productItems){
                    if (pi.getOrdItem().getStatus().equals("Ordered")  && qw.equals(pi.getSoproduct1().getSo1().getSOId())){
                        CMP += pi.getMPWithTaxandDiscont();
                    }
                }
                paymentbill.setCmp(CMP);
                so.setStatus("Ordered");

                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Date lastdate = formatter.parse(so.getOrderDate());
                Calendar cal = Calendar.getInstance();
                cal.setTime(lastdate);
                cal.add(Calendar.MONTH, 1);
                lastdate = cal.getTime();
                so.setOrderDate(dateFormat.format(lastdate));
                so.setAttentionFlag("");
                soRepository.save(so);
                paymentBillRepository.save(paymentbill);
                Payment payment = new Payment();
                payment.setPaymentDate(date);
                payment.setPaymentInfo("Payment was succesfull");
                payment.setSo1(so);
                payment.setPaymentbill1(paymentbill);
                payment.setPaymenttype1(paymentTypeRepository.findOne(2L));
                paymentFacade.save(payment);
                so.setPurchaseOrderNumber(payment.getPaymentId().toString());
                soRepository.save(so);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/admin/so/list";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllSo(Model model) {
        model.addAttribute("SO_WAIT", soRepository.findByStatus("Wait"));
        model.addAttribute("SO_ORDERED", soRepository.findByStatus("Ordered"));
        model.addAttribute("SOES", soRepository.findAll());
        return "so/list";
    }

}
