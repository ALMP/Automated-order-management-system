/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.Models.Statisticscollector;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.StatisticsCollectorRepository;
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
@RequestMapping(value = {"/admin/statisticscollector"})
@Controller
public class StatisticscollectorController {

    @Autowired
    StatisticsCollectorRepository statisticscollectorRepository;
    @Inject
    private ErrorBean error;


    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyStatisticscollector() {
        return "/statisticscollector/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createStatisticscollector(@Valid
                                @BeanParam Statisticscollector statisticscollector) {
        statisticscollectorRepository.save(statisticscollector);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editStatisticscollector(Model model, @PathVariable("id") Long id) {
        model.addAttribute("STATISTICSCOLLECTOR", statisticscollectorRepository.findOne(id));
        return "statisticscollector/update";
    }



    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateStatisticscollector(@Valid
                                @BeanParam Statisticscollector statisticscollector) {
        statisticscollectorRepository.save(statisticscollector);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.POST)
    public String updateStatisticscollector(@Valid
                                @BeanParam Statisticscollector statisticscollector, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "welcome";
        }
        statisticscollectorRepository.save(statisticscollector);
        return "redirect:statisticscollector/list";
    }

    @RequestMapping(value = {"/remove/{id}"}, method = RequestMethod.GET)
    public RedirectView removeStatisticscollector(@PathVariable("id") Long id) {
        statisticscollectorRepository.delete(statisticscollectorRepository.findOne(id));
        return new RedirectView("/statisticscollector/list");
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String findStatisticscollector(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("STATISTICSCOLLECTOR", statisticscollectorRepository.findOne(Long.valueOf(id)));
        return "statisticscollector/view";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllStatisticscollector(Model model) {
        model.addAttribute("STATISTICSCOLLECTOR_LIST", statisticscollectorRepository.findAll());
        return "statisticscollector/list";
    }

}
