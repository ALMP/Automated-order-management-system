package com.hellokoding.account.web;

import com.hellokoding.account.Models.Itemdiscount;
import com.hellokoding.account.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Admin on 23.12.2016.
 */
@Controller
public class OneMoreController {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private DiscountruleRepository discountruleRepository;
    @Autowired
    private AddressRepository addressRepository;
    @Autowired
    private ItemRepository itemRepository;
    @Autowired
    private ItemGroupRepository itemGroupRepository;
    @Autowired
    private ItemdiscountRepository itemdiscountRepository;
    @Autowired
    private GroupRepository groupRepository;
    @Autowired
    private ProductItemsRepository productItemsRepository;
    @Autowired
    private PaymentRepository paymentFacade;
    @Autowired
    private PaymentTypeRepository paymentTypeRepository;
    @Autowired
    private SOProductRepository soProductRepository;
    @Autowired
    private SORepository soRepository;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = {"/disconts"}, method = RequestMethod.GET)
    public String emptyCustomer(Model model) {
        List<Itemdiscount> itemdiscounts = itemdiscountRepository.findAll();
        List<Itemdiscount> finaldisc = new ArrayList<>();
        for (Itemdiscount item: itemdiscounts){
            if (item.getDiscountrule1().getDiscountProcent() != null && item.getDiscountrule1().getDiscountProcent() <= 50){
                finaldisc.add(item);
            }
        }
        model.addAttribute("DISC_ITEMS", finaldisc);
        return "pages/discitems";
    }
}
