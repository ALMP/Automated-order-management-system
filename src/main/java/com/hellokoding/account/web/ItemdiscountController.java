/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.Itemdiscount;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.ItemdiscountRepository;
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
@RequestMapping(value = {"/admin/itemdiscount"})
@Controller
public class ItemdiscountController {

    @Autowired
    private ItemdiscountRepository itemdiscountRepository;
    @Inject
    private ErrorBean error;

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyItemdiscount() {
        return "/itemdiscount/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createItemdiscount(@Valid
                                @BeanParam Itemdiscount itemdiscount) {
        itemdiscountRepository.save(itemdiscount);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editItemdiscount(Model model, @PathVariable("id") Long id) {
        model.addAttribute("ITEMDISCOUNT", itemdiscountRepository.findOne(id));
        return "itemdiscount/update";
    }



    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateItemdiscount(@Valid
                                @BeanParam Itemdiscount itemdiscount) {
        itemdiscountRepository.save(itemdiscount);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateItemdiscount(@Valid
                                @BeanParam Itemdiscount itemdiscount, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        itemdiscountRepository.save(itemdiscount);
        return "redirect:itemdiscount/list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public RedirectView removeItemdiscount(@PathVariable("id") Long id) {
        itemdiscountRepository.delete(itemdiscountRepository.findOne(id));
        return new RedirectView("/itemdiscount/list");
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findItemdiscount(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("ITEMDISCOUNT", itemdiscountRepository.findOne(Long.valueOf(id)));
        return "itemdiscount/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllItemdiscount(Model model) {
        model.addAttribute("ITEMDISCOUNT_LIST", itemdiscountRepository.findAll());
        return "itemdiscount/list";
    }
    
}
