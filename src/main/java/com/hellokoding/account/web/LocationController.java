/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.*;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.*;
import com.hellokoding.account.repository.ItemRepository;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author dzni0816
 */
@RequestMapping(value = {"/admin/locations"})
@Controller
public class LocationController {

    @Autowired
    LocationRepository locationRepository;
    @Autowired
    ItemLocationRepository itemLocationRepository;
    @Autowired
    ItemRepository itemRepository;
    @Inject
    private ErrorBean error;

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyCharacterictics() {
        return "/locations/create";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createCharacterictics(@Valid
                                        @BeanParam Locations locations) {
        locationRepository.save(locations);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editCharacterictics(Model model, @PathVariable("id") Long id) {
        model.addAttribute("LOCATIONS", locationRepository.findOne(id));
        return "locations/update";
    }

    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateCharacterictics(@Valid
                                        @BeanParam Locations locations) {
        locationRepository.save(locations);
        return "redirect:list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateCharacterictics(@Valid
                                        @BeanParam Locations locations, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        locationRepository.save(locations);
        return "redirect:locations/list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public String removeCharacterictics(@PathVariable("id") Long id) {
        itemLocationRepository.delete(itemLocationRepository.findByLocation_LocationId(id));
        locationRepository.delete(locationRepository.findOne(id));
        return "redirect:/admin/locations/list";
    }

    @RequestMapping(value = {"/removeitem/{id1}/{id2}"}, method = RequestMethod.GET)
    public String removeItemGroup1(@PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemLocationRepository.delete(itemLocationRepository.findByItem_ItemId(id2));
        return "redirect:/admin/locations/" + id1;
    }

    @RequestMapping(value = {"/add/{id1}/{id2}"}, method = RequestMethod.GET)
    public String addItemGroup1(ItemLocations itemLocations, @PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemLocations.setItem(itemRepository.findOne(id2));
        itemLocations.setLocation(locationRepository.findOne(id1));
        itemLocationRepository.save(itemLocations);
        return "redirect:/admin/locations/" + id1;
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findCharacterictics(Model model, @PathVariable("id") Long id) {
        List<ItemLocations> itemLocationses = itemLocationRepository.findByLocation_LocationId(id);
        List<Item> tempitem = itemRepository.findAll();

        List<Item> item = new ArrayList<Item>();
        List<Item> nitem = new ArrayList<Item>();

        for (Item i: tempitem) {
            Boolean b = false;
            for (ItemLocations idisc: itemLocationses) if (i.getItemId().equals(idisc.getItem().getItemId())) b = true;
            if (b) item.add(i);
            else nitem.add(i);
        }

        model.addAttribute("ITEM_LIST", item);
        model.addAttribute("NITEM_LIST", nitem);
        model.addAttribute("LOCATIONS", locationRepository.findOne(id));
        //model.addAttribute("ITEM_LIST", itemdiscountRepository.findByCharacterictics1_DRId(id));

        return "locations/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllCharacterictics(Model model) {
        model.addAttribute("LOCATIONS_LIST", locationRepository.findAll());
        return "locations/list";
    }

}
