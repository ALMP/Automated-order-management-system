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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.BeanParam;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author dzni0816
 */
@RequestMapping(value = {"/admin/item"})
@Controller
public class ItemController {

    @Autowired
    DiscountruleRepository discountruleRepository;
    @Autowired
    GroupRepository groupRepository;
    @Autowired
    CharacteristicsRepository characteristicsRepository;
    @Autowired
    ItemCharacteristicRepository itemCharacteristicRepository;
    @Autowired
    LocationRepository locationsRepository;
    @Autowired
    ItemLocationRepository itemLocationRepository;
    @Autowired
    ItemdiscountRepository itemdiscountRepository;
    @Autowired
    ItemGroupRepository itemGroupRepository;
    @Autowired
    ItemRepository itemRepository;
    @Inject
    private ErrorBean error;

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyItem() {
        return "item/create";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createItem(@Valid
            @BeanParam Item item) {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        item.setModifiedDate(dateFormat.format(date));
        itemRepository.save(item);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editItem(Model model, @PathVariable("id") Long id) {
        model.addAttribute("ITEM", itemRepository.findOne(id));
        return "item/update";
    }

    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateItem(@Valid
                                @BeanParam Item item) {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        item.setModifiedDate(dateFormat.format(date));
        itemRepository.save(item);
        return "redirect:list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public String removeItem(@PathVariable("id") Long id) {
        itemRepository.delete(itemRepository.findOne(id));
        return "redirect:/admin/item/list";
    }

    @RequestMapping(value = {"/removegroup/{id1}/{id2}"}, method = RequestMethod.GET)
    public String removeItemGroup1(@PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemGroupRepository.delete(itemGroupRepository.findByGroups1_GroupId(id2));
        return "redirect:/admin/item/" + id1;
    }

    @RequestMapping(value = {"/add/{id1}/{id2}"}, method = RequestMethod.GET)
    public String addItemGroup1(Itemgroup itemgroup, @PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemgroup.setItem1(itemRepository.findOne(id1));
        itemgroup.setGroups1(groupRepository.findOne(id2));
        itemGroupRepository.save(itemgroup);
        return "redirect:/admin/item/" + id1;
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findItem(Model model, @PathVariable("id") Long id) {

        List<Itemgroup> itemgroups = itemGroupRepository.findByItem1_ItemId(id);
        List<Group1> tempgroup1s = groupRepository.findAll();

        List<Group1> group1s = new ArrayList<Group1>();
        List<Group1> ngroup1s = new ArrayList<Group1>();

        for (Group1 i: tempgroup1s) {
            Boolean b = false;
            for (Itemgroup idisc: itemgroups)
                if (i.getGroupId().equals(idisc.getGroups1().getGroupId()))
                    b = true;
            if (b) group1s.add(i);
            else ngroup1s.add(i);
        }

        model.addAttribute("GROUP_LIST", group1s);
        model.addAttribute("NGROUP_LIST", ngroup1s);
        model.addAttribute("ITEM", itemRepository.findOne(id));

        return "item/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllItem(Model model) {
        model.addAttribute("ITEM_LIST", itemRepository.findAll());
        return "item/list";
    }

    @RequestMapping(value = {"/discountrule/{id}"}, method = RequestMethod.GET)
    public String findDiscountrule(Model model, @PathVariable("id") Long id) {
        List<Itemdiscount> itemdiscounts = itemdiscountRepository.findByItem1_ItemId(id);
        List<Discountrule> tempdiscountrule = discountruleRepository.findAll();

        List<Discountrule> discountrule = new ArrayList<Discountrule>();
        List<Discountrule> ndiscountrule = new ArrayList<Discountrule>();

        for (Discountrule i: tempdiscountrule) {
            Boolean b = false;
            for (Itemdiscount idisc: itemdiscounts) if (i.getdRId().equals(idisc.getDiscountrule1().getdRId())) b = true;
            if (b) discountrule.add(i);
            else ndiscountrule.add(i);
        }

        model.addAttribute("DISCOUNTRULE_LIST", discountrule);
        model.addAttribute("NDISCOUNTRULE_LIST", ndiscountrule);
        model.addAttribute("ITEM", itemRepository.findOne(id));

        return "item/discountrule";
    }

    @RequestMapping(value = {"/removediscountrule/{id1}/{id2}"}, method = RequestMethod.GET)
    public String removeDiscountrule(@PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemdiscountRepository.delete(itemdiscountRepository.findByDiscountrule1_DRId(id2));
        return "redirect:/admin/item/discountrule/" + id1;
    }

    @RequestMapping(value = {"/adddiscountrule/{id1}/{id2}"}, method = RequestMethod.GET)
    public String addDiscountrule(Itemdiscount itemdiscount, @PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemdiscount.setItem1(itemRepository.findOne(id1));
        itemdiscount.setDiscountrule1(discountruleRepository.findOne(id2));
        itemdiscountRepository.save(itemdiscount);
        return "redirect:/admin/item/discountrule/" + id1;
    }

    @RequestMapping(value = {"/locations/{id}"}, method = RequestMethod.GET)
    public String findLocation(Model model, @PathVariable("id") Long id) {
        List<ItemLocations> itemLocationses = itemLocationRepository.findByItem_ItemId(id);
        List<Locations> templocation = locationsRepository.findAll();

        List<Locations> locations = new ArrayList<Locations>();
        List<Locations> nlocations = new ArrayList<Locations>();



        for (Locations i: templocation) {
            Boolean b = false;
            for (ItemLocations idisc: itemLocationses) if (i.getLocationId().equals(idisc.getLocation().getLocationId())) b = true;
            if (b) locations.add(i);
            else nlocations.add(i);
        }

        model.addAttribute("LOCATIONS_LIST", locations);
        model.addAttribute("NLOCATIONS_LIST", nlocations);
        model.addAttribute("ITEM", itemRepository.findOne(id));

        return "item/locations";
    }

    @RequestMapping(value = {"/removelocations/{id1}/{id2}"}, method = RequestMethod.GET)
    public String removeLocations(@PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemLocationRepository.delete(itemLocationRepository.findByLocation_LocationId(id2));
        return "redirect:/admin/item/locations/" + id1;
    }

    @RequestMapping(value = {"/addlocations/{id1}/{id2}"}, method = RequestMethod.GET)
    public String addLocations(ItemLocations itemLocations, @PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemLocations.setItem(itemRepository.findOne(id1));
        itemLocations.setLocation(locationsRepository.findOne(id2));
        itemLocationRepository.save(itemLocations);
        return "redirect:/admin/item/locations/" + id1;
    }

    @RequestMapping(value = {"/characteristicses/{id}"}, method = RequestMethod.GET)
    public String findCharacteristics(Model model, @PathVariable("id") Long id) {
        List<ItemCharacteristic> itemCharacteristics = itemCharacteristicRepository.findByItem_ItemId(id);
        List<Characteristics> tempcharacteristicses = characteristicsRepository.findAll();

        List<Characteristics> characteristicses = new ArrayList<Characteristics>();
        List<Characteristics> ncharacteristicses = new ArrayList<Characteristics>();

        for (Characteristics i: tempcharacteristicses) {
            Boolean b = false;
            for (ItemCharacteristic idisc: itemCharacteristics) if (i.getCharacteristicId().equals(idisc.getItemCharacteristic().getCharacteristicId())) b = true;
            if (b) characteristicses.add(i);
            else ncharacteristicses.add(i);
        }

        model.addAttribute("CHARACTERISTICS_LIST", characteristicses);
        model.addAttribute("NCHARACTERISTICS_LIST", ncharacteristicses);
        model.addAttribute("ITEM", itemRepository.findOne(id));

        return "item/characteristicses";
    }

    @RequestMapping(value = {"/removecharacteristicses/{id1}/{id2}"}, method = RequestMethod.GET)
    public String removeCharacteristicses(@PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemCharacteristicRepository.delete(itemCharacteristicRepository.findByItemCharacteristic_CharacteristicId(id2));
        return "redirect:/admin/item/characteristicses/" + id1;
    }

    @RequestMapping(value = {"/addcharacteristicses/{id1}/{id2}"}, method = RequestMethod.GET)
    public String addCharacteristicses(ItemCharacteristic itemCharacteristic, @PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        itemCharacteristic.setItem(itemRepository.findOne(id1));
        itemCharacteristic.setItemCharacteristic(characteristicsRepository.findOne(id2));
        itemCharacteristicRepository.save(itemCharacteristic);
        return "redirect:/admin/item/characteristicses/" + id1;
    }
    
}
