/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hellokoding.account.web;

import com.hellokoding.account.model.Role;
import com.hellokoding.account.model.User;
import com.hellokoding.account.controller.util.ErrorBean;
import com.hellokoding.account.repository.RoleRepository;
import com.hellokoding.account.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.inject.Inject;
import javax.validation.Valid;
import javax.ws.rs.*;
import java.security.Principal;
import java.util.*;

/**
 *
 * @author dzni0816
 */
@Transactional
@RequestMapping(value = {"/superadmin/role"})
@Controller
public class RoleController {

    @Autowired
    RoleRepository roleRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Inject
    private ErrorBean error;

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptyRole() {
        return "/role/create";
    }


    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createRole(@Valid
                                @BeanParam Role role) {
        roleRepository.save(role);
        return "redirect:list";
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.GET)
    public String editRole(Model model, @PathVariable("id") Long id) {
        model.addAttribute("ROLE", roleRepository.findOne(id));
        return "role/update";
    }



    @RequestMapping(value = {"/update"}, method = RequestMethod.POST)
    public String updateRole(@Valid
                                @BeanParam Role role) {
        roleRepository.save(role);
        return "redirect:list";
    }


    @RequestMapping(value = {"/remove/{id1}/{id2}"}, method = RequestMethod.GET)
    public String removeRole(User user, @PathVariable("id1") Long id1, @PathVariable("id2") Long id2) {
        user = userRepository.findById(id1);
        List<Role> new_r = new ArrayList<Role>();
        Set<Role> cur_r = userRepository.findOne(id1).getRoles();
        for (Role r: cur_r) {
            if ((id2.equals(1l)) && (!r.getName().equals("ROLE_ADMIN")))
                new_r.add(r);
            else
                if ((id2.equals(2l)) && ((!r.getName().equals("ROLE_MODER")) && (!r.getName().equals("ROLE_ADMIN"))))
                    new_r.add(r);
        }
        user.setRoles(new HashSet<>(new_r));
        userRepository.save(user);
        return "redirect:/superadmin/role/list";
    }

    @RequestMapping(value = {"/setadm/{id}"}, method = RequestMethod.GET)
    public String setAdm(User user, @PathVariable("id") Long id) {
        user = userRepository.findById(id);
        List<Role> rl = roleRepository.findAll();
        List<Role> rq = new ArrayList<Role>();
        for (Role r: rl) rq.add(r);
        user.setRoles(new HashSet<>(rq));
        userRepository.save(user);
        return "redirect:/superadmin/role/list";
    }

    @RequestMapping(value = {"/setmod/{id}"}, method = RequestMethod.GET)
    public String setMod(User user, @PathVariable("id") Long id) {
        user = userRepository.findById(id);
        List<Role> rl = roleRepository.findAll();
        List<Role> rq = new ArrayList<Role>();
        for (Role r: rl) if (!r.getName().equals("ROLE_ADMIN")) rq.add(r);
        user.setRoles(new HashSet<>(rq));
        userRepository.save(user);
        return "redirect:/superadmin/role/list";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public String findAllRole(Model model, Principal principal) {
        List<User> all = userRepository.findAll();
        List<User> users = new ArrayList<User>();
        for (User u: all) if (!u.getId().equals(userRepository.findByUsername(principal.getName()).getId())) users.add(u);
        List<User> adms = new ArrayList<User>();
        List<User> mods = new ArrayList<User>();

        Role ra = roleRepository.findOne(2L);
        Role rm = roleRepository.findOne(3L);
        for (User u: all) {
            if ((u.getRoles().contains(ra)) && (!u.getId().equals(userRepository.findByUsername(principal.getName()).getId()))) adms.add(u);
            if ((u.getRoles().contains(rm)) && (!u.getId().equals(userRepository.findByUsername(principal.getName()).getId()))) mods.add(u);
        }

        model.addAttribute("USER_LIST", users);
        model.addAttribute("USER_ADMIN", adms);
        model.addAttribute("USER_MODER", mods);
        return "role/list";
    }
    
}
