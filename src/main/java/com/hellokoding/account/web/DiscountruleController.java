/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.Discountrule;
import com.hellokoding.account.Models.Itemdiscount;
import com.hellokoding.account.Models.Item;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.DiscountruleRepository;
import com.hellokoding.account.repository.ItemdiscountRepository;
import com.hellokoding.account.repository.ItemRepository;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.BeanParam;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dzni0816
 */
@RequestMapping(value = {"/admin/discountrule"})
@Controller
public class DiscountruleController {

    @Autowired
    DiscountruleRepository discountruleRepository;
    @Autowired
    ItemdiscountRepository itemdiscountRepository;
    @Autowired
    ItemRepository itemRepository;
    @Inject
    private ErrorBean error;

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyDiscountrule() {
        return "/discountrule/create";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createDiscountrule(@Valid
            @BeanParam Discountrule discountrule) {
        discountruleRepository.save(discountrule);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editDiscountrule(Model model, @PathVariable("id") Long id) {
        model.addAttribute("DISCOUNTRULE", discountruleRepository.findOne(id));
        return "discountrule/update";
    }

    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateDiscountrule(@Valid
            @BeanParam Discountrule discountrule) {
        discountruleRepository.save(discountrule);
        return "redirect:list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateDiscountrule(@Valid
            @BeanParam Discountrule discountrule, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        discountruleRepository.save(discountrule);
        return "redirect:discountrule/list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public String removeDiscountrule(@PathVariable("id") Long id) {
        itemdiscountRepository.delete(itemdiscountRepository.findByDiscountrule1_DRId(id));
        discountruleRepository.delete(discountruleRepository.findOne(id));
        return "redirect:/admin/discountrule/list";
    }

    @RequestMapping(value = {"/removeitem/{iid}/{gid}"}, method = RequestMethod.GET)
    public String removeItemGroup1(@PathVariable("iid") Long iid, @PathVariable("gid") Long gid) {
        itemdiscountRepository.delete(itemdiscountRepository.findByItem1_ItemId(iid));
        return "redirect:/admin/discountrule/" + gid + "";
    }

    @RequestMapping(value = {"/add/{iid}/{gid}"}, method = RequestMethod.GET)
    public String addItemGroup1(Itemdiscount itemdiscount, @PathVariable("iid") Long iid, @PathVariable("gid") Long gid) {
        itemdiscount.setItem1(itemRepository.findOne(iid));
        itemdiscount.setDiscountrule1(discountruleRepository.findOne(gid));
        itemdiscountRepository.save(itemdiscount);
        return "redirect:/admin/discountrule/" + gid + "";
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findDiscountrule(Model model, @PathVariable("id") Long id) {
        List<Itemdiscount> itemdiscounts = itemdiscountRepository.findByDiscountrule1_DRId(id);
        List<Item> tempitem = itemRepository.findAll();

        List<Item> item = new ArrayList<Item>();
        List<Item> nitem = new ArrayList<Item>();

        for (Item i: tempitem) {
            Boolean b = false;
            for (Itemdiscount idisc: itemdiscounts) {
                if (i.getItemId().equals(idisc.getItem1().getItemId())) {
                    b = true;
                }
            }
            if (b) {
                item.add(i);
            }
            else {
                nitem.add(i);
            }
        }
        //cascade = CascadeType.REMOVE

        model.addAttribute("ITEM_LIST", item);
        model.addAttribute("NITEM_LIST", nitem);
        model.addAttribute("DISCOUNTRULE", discountruleRepository.findOne(id));
        //model.addAttribute("ITEM_LIST", itemdiscountRepository.findByDiscountrule1_DRId(id));

        return "discountrule/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllDiscountrule(Model model) {
        model.addAttribute("DISCOUNTRULE_LIST", discountruleRepository.findAll());
        return "discountrule/list";
    }
    
}
