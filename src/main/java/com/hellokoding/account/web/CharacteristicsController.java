/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.*;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.*;
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
@RequestMapping(value = {"/admin/characteristics"})
@Controller
public class CharacteristicsController {

    @Autowired
    CharacteristicsRepository characteristicsRepository;
    @Autowired
    ItemCharacteristicRepository itemCharacteristicRepository;
    @Autowired
    ItemRepository itemRepository;
    @Inject
    private ErrorBean error;

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyCharacterictics() {
        return "/characteristics/create";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createCharacterictics(@Valid
                                     @BeanParam Characteristics characteristics) {
        characteristicsRepository.save(characteristics);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editCharacterictics(Model model, @PathVariable("id") Long id) {
        model.addAttribute("CHARACTERISTICS", characteristicsRepository.findOne(id));
        return "characteristics/update";
    }

    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateCharacterictics(@Valid
                                     @BeanParam Characteristics characteristics) {
        characteristicsRepository.save(characteristics);
        return "redirect:list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateCharacterictics(@Valid
                                     @BeanParam Characteristics characteristics, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        characteristicsRepository.save(characteristics);
        return "redirect:characteristics/list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public String removeCharacterictics(@PathVariable("id") Long id) {
        itemCharacteristicRepository.delete(itemCharacteristicRepository.findByItemCharacteristic_CharacteristicId(id));
        characteristicsRepository.delete(characteristicsRepository.findOne(id));
        return "redirect:/admin/characteristics/list";
    }

    @RequestMapping(value = {"/removeitem/{id1}/{id2}"}, method = RequestMethod.GET)
    public String removeItemGroup1(@PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemCharacteristicRepository.delete(itemCharacteristicRepository.findByItem_ItemId(id2));
        return "redirect:/admin/characteristics/" + id1;
    }

    @RequestMapping(value = {"/add/{id1}/{id2}"}, method = RequestMethod.GET)
    public String addItemGroup1(ItemCharacteristic itemCharacteristic, @PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemCharacteristic.setItem(itemRepository.findOne(id2));
        itemCharacteristic.setItemCharacteristic(characteristicsRepository.findOne(id1));
        itemCharacteristicRepository.save(itemCharacteristic);
        return "redirect:/admin/characteristics/" + id1;
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findCharacterictics(Model model, @PathVariable("id") Long id) {
        List<ItemCharacteristic> itemCharacteristics = itemCharacteristicRepository.findByItemCharacteristic_CharacteristicId(id);
        List<Item> tempitem = itemRepository.findAll();

        List<Item> item = new ArrayList<Item>();
        List<Item> nitem = new ArrayList<Item>();

        for (Item i: tempitem) {
            Boolean b = false;
            for (ItemCharacteristic idisc: itemCharacteristics) if (i.getItemId().equals(idisc.getItem().getItemId())) b = true;
            if (b) item.add(i);
            else nitem.add(i);
        }

        model.addAttribute("ITEM_LIST", item);
        model.addAttribute("NITEM_LIST", nitem);
        model.addAttribute("CHARACTERISTICS", characteristicsRepository.findOne(id));
        //model.addAttribute("ITEM_LIST", itemdiscountRepository.findByCharacterictics1_DRId(id));

        return "characteristics/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllCharacterictics(Model model) {
        model.addAttribute("CHARACTERISTICS_LIST", characteristicsRepository.findAll());
        return "characteristics/list";
    }

}
