/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.Soproduct;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.SOProductRepository;
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
import javax.ws.rs.*;

/**
 *
 * @author dzni0816
 */
@RequestMapping(value = {"/admin/soproduct"})
@Controller
public class SoproductController {

    @Autowired
    SOProductRepository soproductRepository;
    @Inject
    private ErrorBean error;


    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptySoproduct() {
        return "/soproduct/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createSoproduct(@Valid
                                @BeanParam Soproduct soproduct) {
        soproductRepository.save(soproduct);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editSoproduct(Model model, @PathVariable("id") Long id) {
        model.addAttribute("SOPRODUCT", soproductRepository.findOne(id));
        return "soproduct/update";
    }



    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateSoproduct(@Valid
                                @BeanParam Soproduct soproduct) {
        soproductRepository.save(soproduct);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateSoproduct(@Valid
                                @BeanParam Soproduct soproduct, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        soproductRepository.save(soproduct);
        return "redirect:soproduct/list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public RedirectView removeSoproduct(@PathVariable("id") Long id) {
        soproductRepository.delete(soproductRepository.findOne(id));
        return new RedirectView("/soproduct/list");
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findSoproduct(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("SOPRODUCT", soproductRepository.findOne(Long.valueOf(id)));
        return "soproduct/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllSoproduct(Model model) {
        model.addAttribute("SOPRODUCT_LIST", soproductRepository.findAll());
        return "soproduct/list";
    }

}
