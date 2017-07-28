/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.Itemgroup;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.ItemGroupRepository;
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
@RequestMapping(value = {"/itemgroup"})
@Controller
public class ItemgroupController {

    @Autowired
    ItemGroupRepository itemGroupRepository;
    @Inject
    private ErrorBean error;


    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyItemGroup() {
        return "/itemgroup/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createItemGroup(@Valid
                                @BeanParam Itemgroup itemGroup) {
        itemGroupRepository.save(itemGroup);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editItemGroup(Model model, @PathVariable("id") Long id) {
        model.addAttribute("ITEMGROUP", itemGroupRepository.findOne(id));
        return "itemgroup/update";
    }



    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateItemGroup(@Valid
                                @BeanParam Itemgroup itemGroup) {
        itemGroupRepository.save(itemGroup);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateItemGroup(@Valid
                                @BeanParam Itemgroup itemGroup, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        itemGroupRepository.save(itemGroup);
        return "redirect:itemgroup/list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public RedirectView removeItemGroup(@PathVariable("id") Long id) {
        itemGroupRepository.delete(itemGroupRepository.findOne(id));
        return new RedirectView("/itemgroup/list");
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findItemGroup(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("ITEMGROUP", itemGroupRepository.findOne(Long.valueOf(id)));
        return "itemgroup/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllItemGroup(Model model) {
        model.addAttribute("ITEMGROUP_LIST", itemGroupRepository.findAll());
        return "itemgroup/list";
    }
    
}
