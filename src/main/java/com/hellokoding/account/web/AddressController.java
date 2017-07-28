/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.Address;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.AddressRepository;
import com.hellokoding.account.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.BeanParam;

/**
 *
 * @author dzni0816
 */
@RequestMapping(value = {"/admin/address"})
@Controller
public class AddressController {

    @Autowired
    private AddressService addressService;
    @Autowired
    AddressRepository addressRepository;
    @Inject
    private ErrorBean error;


    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyAddress() {
        return "/address/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createAddress(@Valid
            @BeanParam Address address) {
        addressService.save(address);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editAddress(Model model, @PathVariable("id") Long id) {
        model.addAttribute("ADDRESS", addressRepository.findOne(id));
        return "address/update";
    }

    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateAddress(@Valid
                                @BeanParam Address address) {
        addressRepository.save(address);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateAddress(@Valid
            @BeanParam Address address, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        addressService.save(address);
        return "address/list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public String removeAddress(@PathVariable("id") Long id) {
        addressRepository.delete(addressRepository.findOne(id));
        return "redirect:/admin/address/list";
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findAddress(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("ADDRESS", addressRepository.findOne(Long.valueOf(id)));
        return "address/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllAddress(Model model) {
        model.addAttribute("ADDRESS_LIST", addressRepository.findAll());
        return "address/list";
    }

}
