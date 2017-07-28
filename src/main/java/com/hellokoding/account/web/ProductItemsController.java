/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.OrdItem;
import com.hellokoding.account.Models.ProductItems;
import com.hellokoding.account.Models.Soproduct;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.OrdItemRepository;
import com.hellokoding.account.repository.ProductItemsRepository;
import com.hellokoding.account.repository.SOProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.BeanParam;

/**
 *
 * @author dzni0816
 */
@RequestMapping(value = {"/productitems"})
@Controller
public class ProductItemsController {

    @Autowired
    private OrdItemRepository itemRepository;
    @Autowired
    private SOProductRepository soProductRepository;
    @Autowired
    private ProductItemsRepository productItemsRepository;
    @Inject
    private ErrorBean error;

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyProductItems(Model model) {
        model.addAttribute("ITEM_LIST", itemRepository.findAll());
        model.addAttribute("SOPRODUCT_LIST", soProductRepository.findAll());
        return "/productitems/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createProductItems(@Valid
        @BeanParam ProductItems productItems, @RequestParam(value = "Soproduct", required = false) String soproduct1, @RequestParam(value = "Item", required = false) String item1) {
        Soproduct soproduct = soProductRepository.findOne(Long.valueOf(soproduct1));
        productItems.setSoproduct1(soproduct);
        OrdItem item = itemRepository.findOne(Long.valueOf(item1));
        productItems.setOrdItem(item);
        productItemsRepository.save(productItems);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editProductItems(Model model, @PathVariable("id") Long id) {
        model.addAttribute("PRODUCTITEMS", productItemsRepository.findOne(id));
        return "productitems/update";
    }



    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateProductItems(@Valid
                                @BeanParam ProductItems productItems) {
        productItemsRepository.save(productItems);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateProductItems(@Valid
                                @BeanParam ProductItems productItems, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        productItemsRepository.save(productItems);
        return "redirect:productitems/list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public RedirectView removeProductItems(@PathVariable("id") Long id) {
        productItemsRepository.delete(productItemsRepository.findOne(id));
        return new RedirectView("/productitems/list");
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findProductItems(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("PRODUCTITEMS", productItemsRepository.findOne(Long.valueOf(id)));
        return "productitems/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllProductItems(Model model) {
        model.addAttribute("PRODUCTITEMS_LIST", productItemsRepository.findAll());
        return "productItems/list";
    }
    
}
