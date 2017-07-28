package com.hellokoding.account.web;

import com.hellokoding.account.Models.*;
import com.hellokoding.account.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 27.11.2016.
 */


@RequestMapping(value = {"/application"})
@Controller
@Transactional
public class AppController {

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
    private OrdItemRepository ordItemRepository;
    @Autowired
    private OrdItemCharacteristicsRepository ordItemCharacteristicsRepository;
    @Autowired
    private OrdItemdiscountRepository ordItemdiscountRepository;
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
    @Autowired
    private CharacteristicsRepository characteristicsRepository;
    @Autowired
    private ItemCharacteristicRepository itemCharacteristicRepository;
    @Autowired
    private ItemLocationRepository itemLocationRepository;


    @RequestMapping(value = {"/main"}, method = RequestMethod.GET)
    public String findAllItem(Model model) {
        model.addAttribute("GROUP_LIST", groupRepository.findAll());
        return "/pages/main"; //Используется для просмотра главной страницы
    }


    @RequestMapping(value = {"/grousadsp/{id}"}, method = RequestMethod.GET)
    public String groupItem(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("ID", id);
        model.addAttribute("ITEM_LIST", itemRepository.findAll());
        model.addAttribute("ITEMGROUP_LIST", itemGroupRepository.findAll());
        model.addAttribute("ITEMDISCOUNT_LIST", itemdiscountRepository.findAll());
        model.addAttribute("GROUP_LIST", groupRepository.findAll());
        model.addAttribute("PRODUCTITEMS_LIST", productItemsRepository.findAll());
        model.addAttribute("PAYMENT_LIST", paymentFacade.findAll());
        return "/pages/group";
    }

    @RequestMapping(value = {"/finalpay"}, method = RequestMethod.GET)
    public String emptyPay(Model model) {
        model.addAttribute("PAYTYPE_LIST", paymentTypeRepository.findAll());
        return "/pages/payment"; //Используется для просмотра главной страницы
    }

    @RequestMapping(value = {"/basket"}, method = RequestMethod.GET)
    public String basket(Model model, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        List<ProductItems> productItems = productItemsRepository.findAll();
        List<ProductItems> finalproducts = new ArrayList<>();
        Float CMP = 0f;
        Float OTP = 0f;
        So so = soRepository.findByStatusAndCustomer1_UserId("Wait", userid.toString()).get(0);
//        for (ProductItems productItem : productItems){
//            if (productItem.getSoproduct1().getSo1().getCustomer1().getUserId().equals(userid.toString()) && productItem.getSoproduct1().getSo1().getStatus().equals("Wait")){
//                CMP+=productItem.getMp();
//                OTP+=productItem.getOtp();
//                finalproducts.add(productItem);
//            }
//        }
        List<ProductItems> pm = so.getSoproducts1().get(0).getProductItemses1();
        for (ProductItems productItems1 : pm){
            CMP+=productItems1.getMp();
            OTP+=productItems1.getOtp();
        }
        model.addAttribute("PRODUCTITEMS_LIST", pm);
        model.addAttribute("ID", userid);

        model.addAttribute("CMP", CMP);
        model.addAttribute("OTP", OTP);
        return "/pages/basket";
    }

    @RequestMapping(value = {"/basket/{customerid}/{soid}"}, method = RequestMethod.GET)
    public String emptyBasket(Model model,
                              @PathVariable("customerid") Long customerid, @PathVariable("soid") Long soid,
                              Principal principal) throws Exception {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        if (customerRepository.findOne(customerid) == null
                || !customerRepository.findOne(customerid).getUserId().equals(userid.toString())
                || soRepository.findOne(soid) == null
                || !soRepository.findOne(soid).getCustomer1().getUserId().equals(userid.toString())){
            throw new NotFoundException(soid);
        }

        List<ProductItems> productItems = productItemsRepository.findAll();
        List<ProductItems> finalproducts = new ArrayList<>();
        Float CMP = 0f;
        Float OTP = 0f;
        Float FFCMP = 0f;
        Float FFOTP = 0f;
        for (ProductItems productItem : productItems){
            if (productItem.getSoproduct1().getSo1().getCustomer1().getCustomerId().equals(customerid) &&
                    productItem.getSoproduct1().getSo1().getSOId().equals(soid)
                    && productItem.getOrdItem().getStatus().equals("Wait")){
                CMP+=productItem.getMp();
                OTP+=productItem.getOtp();
                FFCMP+=productItem.getMPWithTaxandDiscont();
                FFOTP+=productItem.getOTPWithTaxandDiscont();
                finalproducts.add(productItem);
            } else if (productItem.getSoproduct1().getSo1().getCustomer1().getCustomerId().equals(customerid) &&
                    productItem.getSoproduct1().getSo1().getSOId().equals(soid)){
                CMP+=productItem.getMp();
                FFCMP+=productItem.getMPWithTaxandDiscont();
                finalproducts.add(productItem);
            }
        }
        int i=0;
        BigDecimal FCMP = new BigDecimal(Float.toString(FFCMP)).setScale(2, BigDecimal.ROUND_HALF_UP);
        BigDecimal FOTP = new BigDecimal(Float.toString(FFOTP)).setScale(2, BigDecimal.ROUND_HALF_UP);
        for (ProductItems p : finalproducts){
            if (p.getOrdItem().getStatus().equals("Ordered")){
                i++;
            }
        }
        if (i == finalproducts.size() && i != 0){
            soRepository.findOne(soid).setStatus("Ordered");
        }
        model.addAttribute("PRODUCTITEMS_LIST", finalproducts);
        model.addAttribute("CUSTOMERID", customerid);
        model.addAttribute("STATUS", soRepository.findOne(soid).getStatus());
        model.addAttribute("SOID", soid);
        model.addAttribute("USERID", userid);
        model.addAttribute("FCMP", FCMP);
        model.addAttribute("FOTP", FOTP);
        model.addAttribute("CMP", CMP);
        model.addAttribute("OTP", OTP);
        return "/pages/basket";
    }



    @Transactional
    @RequestMapping(value = {"/catalog/{customerid}/{soid}"}, method = RequestMethod.GET)
    public String emptyCatalog(Model model,
                               @PathVariable("customerid") Long customerid, @PathVariable("soid") Long soid,
                               Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        model.addAttribute("CUSTOMERID", customerid);
        model.addAttribute("SOID", soid);

        So so = soRepository.findOne(soid);
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        if (customerRepository.findOne(customerid) == null
                || !customerRepository.findOne(customerid).getUserId().equals(userid.toString())
                || soRepository.findOne(soid) == null
                || !soRepository.findOne(soid).getCustomer1().getUserId().equals(userid.toString())){
            return "error";
        }
        if ("Canceled".equals(so.getStatus())){
            return "error";
        }

        List<ItemLocations> items = itemLocationRepository.findByLocation_Locationname(so.getLocation());
        model.addAttribute("CHARACTERISTICS", itemCharacteristicRepository.findAll());
        model.addAttribute("GROUP_LIST", groupRepository.findAll());
        model.addAttribute("ITEM_LIST", items);
        return "/pages/catalog";
    }

    @RequestMapping(value = {"/itemdescription/{itemid}/{customerid}/{soid}"}, method = RequestMethod.GET)
    public String itemDescription(Model model, ProductItems productItems, @PathVariable("itemid") Long itemid,
                                  @PathVariable("customerid") Long customerid, @PathVariable("soid") Long soid,
                                  Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        if (customerRepository.findOne(customerid) == null
                || !customerRepository.findOne(customerid).getUserId().equals(userid.toString())
                || soRepository.findOne(soid) == null
                || !soRepository.findOne(soid).getCustomer1().getUserId().equals(userid.toString())){
            return "error";
        }
        Item item = itemRepository.findOne(itemid);
        model.addAttribute("ITEM", item);

        model.addAttribute("ITEMCHARACTERISTICS", itemCharacteristicRepository.findByItem_ItemId(itemid));
        model.addAttribute("ITEMDISCOUNTS", itemdiscountRepository.findByItem1_ItemId(itemid));

        model.addAttribute("ITEMID", itemid);
        model.addAttribute("CUSTOMERID", customerid);
        model.addAttribute("SOID", soid);
        return "/pages/itemDesc";
    }

    @RequestMapping(value = {"/itembasket/{itemid}/{customerid}/{soid}"}, method = RequestMethod.GET)
    public String itemBasketDescription(Model model, ProductItems productItems, @PathVariable("itemid") Long itemid,
                                  @PathVariable("customerid") Long customerid, @PathVariable("soid") Long soid,
                                  Principal principal) throws Exception {
        if (principal==null){
            return "redirect:/";
        }
        if (soRepository.findOne(soid) == null || soRepository.findByCustomer1_CustomerId(customerid).isEmpty()
                || soRepository.findByCustomer1_UserId(userRepository.findByUsername(principal.getName()).getId().toString()).isEmpty()){
            throw new NotFoundException(soid);
        }
        OrdItem item = ordItemRepository.findOne(itemid);
        model.addAttribute("ITEM", item);
        List<OrdItemCharacteristic> itemchar = ordItemCharacteristicsRepository.findAll();
        List<OrdItemCharacteristic> basketItemchar = new ArrayList<>();
        for (OrdItemCharacteristic ic : itemchar){
            if (itemid.equals(ic.getOrdItem().getOrditemId())) {
                basketItemchar.add(ic);
            }
        }
        List<OrdItemDiscount> itemdisc = ordItemdiscountRepository.findAll();
        List<OrdItemDiscount> basketItemdisc = new ArrayList<>();
        for (OrdItemDiscount id : itemdisc){
            if (itemid.equals(id.getOrdItem().getOrditemId())) {
                basketItemdisc.add(id);
            }
        }
        model.addAttribute("ITEMCHARACTERISTICS", basketItemchar);
        model.addAttribute("ITEMDISCOUNTS", basketItemdisc);

        model.addAttribute("ITEMID", itemid);
        model.addAttribute("CUSTOMERID", customerid);
        model.addAttribute("SOID", soid);
        return "/pages/itemBasketDesc";
    }

    @RequestMapping(value = {"/order/{customerid}/{soid}"}, method = RequestMethod.GET)
    public String emptyOrder(Model model, @PathVariable("customerid") Long customerid,
                             @PathVariable("soid") Long soid,
                             Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        List<ProductItems> productItems = productItemsRepository.findAll();
        List<ProductItems> finalproducts = new ArrayList<>();


        Float FFCMP = 0f;
        Float FFOTP = 0f;
        for (ProductItems productItem : productItems){
            if (productItem.getSoproduct1().getSo1().getCustomer1().getCustomerId().equals(customerid) &&
                    productItem.getSoproduct1().getSo1().getSOId().equals(soid)
                    && productItem.getOrdItem().getStatus().equals("Wait")){
                FFCMP+=productItem.getMPWithTaxandDiscont();
                FFOTP+=productItem.getOTPWithTaxandDiscont();
                finalproducts.add(productItem);
            } else if (productItem.getSoproduct1().getSo1().getCustomer1().getCustomerId().equals(customerid) &&
                    productItem.getSoproduct1().getSo1().getSOId().equals(soid)){
                FFCMP+=productItem.getMPWithTaxandDiscont();
                finalproducts.add(productItem);
            }
        }

        for (ProductItems productItem : productItems){
            if (productItem.getSoproduct1().getSo1().getCustomer1().getCustomerId().equals(customerid) &&
                    productItem.getSoproduct1().getSo1().getSOId().equals(soid)
                    && productItem.getOrdItem().getStatus().equals("Wait")){
                finalproducts.add(productItem);
            } else if (productItem.getSoproduct1().getSo1().getCustomer1().getCustomerId().equals(customerid) &&
                    productItem.getSoproduct1().getSo1().getSOId().equals(soid)){
                finalproducts.add(productItem);
            }
        }
        BigDecimal FCMP = new BigDecimal(Float.toString(FFCMP)).setScale(2, BigDecimal.ROUND_HALF_UP);
        BigDecimal FOTP = new BigDecimal(Float.toString(FFOTP)).setScale(2, BigDecimal.ROUND_HALF_UP);
        model.addAttribute("ITEM_LIST", finalproducts);
        model.addAttribute("SO_FINAL", soRepository.findOne(soid));
        model.addAttribute("FCMP", FCMP);
        model.addAttribute("FOTP", FOTP);
        model.addAttribute("CUSTOMERID", customerid);
        model.addAttribute("SOID", soid);
        return "/pages/order";
    }

    @RequestMapping(value = {"/stripe"}, method = RequestMethod.GET)
    public String stripe(@RequestParam Map<String, String> request, Model model,
                         Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        model.addAttribute("ITEM_LIST", ordItemRepository.findAll());
        return "/pages/order";
    }

    @RequestMapping(value = {"/orderinfo"}, method = RequestMethod.GET)
    public String emptyOrderInfo(Model model, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();

        model.addAttribute("SO_LIST", soRepository.findByCustomer1_UserId(userid.toString()));
        model.addAttribute("USER_ID", userid);
        return "/pages/orderinfo";
    }

    @RequestMapping(value = {"/add/{itemid}/{customerid}/{soid}"}, method = RequestMethod.GET)
    public String addBasket(Model model, HttpServletRequest request, ItemCharacteristic itemCharacteristic, Itemdiscount itemdiscount,
                            ProductItems productItems, @PathVariable("itemid") Long itemid,
                            @PathVariable("customerid") Long customerid, @PathVariable("soid") Long soid,
                            Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        if (customerRepository.findOne(customerid) == null
                || !customerRepository.findOne(customerid).getUserId().equals(userid.toString())
                || soRepository.findOne(soid) == null
                || !soRepository.findOne(soid).getCustomer1().getUserId().equals(userid.toString())){
            return "error";
        }

        So so = soRepository.findOne(soid);
        if (so.getStatus().equals("Ordered") || so.getStatus().equals("Open")){
            so.setStatus("Wait");
        }
        Soproduct soproduct = so.getSoproducts1().get(0);
        productItems.setSoproduct1(soproduct);
        Item item = itemRepository.findOne(itemid);
        OrdItem ordItem = new OrdItem();
        List<OrdItemCharacteristic> ordItemCharacteristic = new ArrayList<>();
        List<OrdItemDiscount> ordItemDiscount = new ArrayList<>();

        ordItem.setDefMP(item.getDefMP());
        ordItem.setDefOTP(item.getDefOTP());
        ordItem.setDescription(item.getDescription());
        ordItem.setModifiedDate(item.getModifiedDate());
        ordItem.setName(item.getName());
        ordItem.setType(item.getType());
        ordItem.setItemCharacteristic(ordItemCharacteristic);
        ordItem.setItemdiscounts1(ordItemDiscount);
        ordItem.setParentId(item.getItemId());
        ordItem.setStatus("Wait");
        ordItemRepository.save(ordItem);
        String[] characs = request.getParameterValues("characteristics");
        if (characs!=null) {
            for (String charac : characs) {
                OrdItemCharacteristic ordItemChar = new OrdItemCharacteristic();
                ordItemChar.setOrdItem(ordItem);
                ordItemChar.setItemCharacteristic(characteristicsRepository.findOne(Long.valueOf(charac)));
                ordItemCharacteristicsRepository.save(ordItemChar);
            }
        }
        String[] discounts = request.getParameterValues("discounts");
        if (discounts!=null) {
            OrdItemDiscount ordDisc = new OrdItemDiscount();
            for (String disc : discounts) {
                ordDisc.setOrdItem(ordItem);
                ordDisc.setDiscountrule1(discountruleRepository.findOne(Long.valueOf(disc)));
                ordItemdiscountRepository.save(ordDisc);
            }
        }
        OrdItemDiscount ordDisc = new OrdItemDiscount();
        for (Itemdiscount itemdisc : itemdiscountRepository.findByItem1_ItemId(ordItem.getParentId())) {
            if (itemdisc.getDiscountrule1().getType().equals("tax")) {
                ordDisc.setOrdItem(ordItem);
                ordDisc.setDiscountrule1(itemdisc.getDiscountrule1());
                ordItemdiscountRepository.save(ordDisc);
            }
        }
        Float mp = ordItem.getDefMP();
        Float otp = ordItem.getDefOTP();
        List<OrdItemDiscount> itemdisc = ordItemdiscountRepository.findAll();
        List<OrdItemDiscount> basketItemdisc = new ArrayList<>();
        for (OrdItemDiscount id : itemdisc){
            if (ordItem.getOrditemId().equals(id.getOrdItem().getOrditemId())) {
                basketItemdisc.add(id);
            }
        }
        for (OrdItemDiscount discount : basketItemdisc) {
            if (discount.getDiscountrule1().getType().equals("disc") && discount.getDiscountrule1().getDiscountValue() != null){
                otp -= discount.getDiscountrule1().getDiscountValue();
                mp -= discount.getDiscountrule1().getDiscountValue();
            }
            if (discount.getDiscountrule1().getType().equals("disc") && discount.getDiscountrule1().getDiscountProcent() != null){
                otp -= otp*discount.getDiscountrule1().getDiscountProcent()/100.0f;
                mp -= mp*discount.getDiscountrule1().getDiscountProcent()/100.0f;
            }
        }
        List<Itemdiscount> itemdiscounts = itemdiscountRepository.findByItem1_ItemId(itemid);
        for (Itemdiscount discount : itemdiscounts) {
            if (discount.getDiscountrule1().getType().equals("tax") && discount.getDiscountrule1().getDiscountProcent() != null){
                otp += otp*discount.getDiscountrule1().getDiscountProcent()/100.0f;
            }
            if (discount.getDiscountrule1().getType().equals("tax") && discount.getDiscountrule1().getDiscountValue() != null){
                otp += discount.getDiscountrule1().getDiscountValue();
            }
        }
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        so.setDateModified(dateFormat.format(date));
        soRepository.save(so);
        itemRepository.findOne(itemid).setQuantity(item.getQuantity().subtract(BigInteger.ONE));
        productItems.setOrdItem(ordItem);
        productItems.setOTPWithTaxandDiscont(Float.valueOf(String.valueOf(BigDecimal.valueOf(otp).setScale(2, BigDecimal.ROUND_HALF_UP))));
        productItems.setMPWithTaxandDiscont(Float.valueOf(String.valueOf(BigDecimal.valueOf(mp).setScale(2, BigDecimal.ROUND_HALF_UP))));
        productItems.setOtp(Float.valueOf(String.valueOf(BigDecimal.valueOf(item.getDefOTP()).setScale(2, BigDecimal.ROUND_HALF_UP))));
        productItems.setMp(Float.valueOf(String.valueOf(BigDecimal.valueOf(item.getDefMP()).setScale(2, BigDecimal.ROUND_HALF_UP))));
        productItemsRepository.save(productItems);
        priceRecountSO(customerid, soid);
        return "redirect:/application/basket/" + customerid + "/" + soid;
    }

    private void priceRecountSO(Long customerid, Long soid){
        List<ProductItems> productItems = productItemsRepository.findAll();
        Float CMP = 0f, CMPTD = 0f;
        Float OTP = 0f, OTPTD = 0f;
        for (ProductItems productItem : productItems){
            if (productItem.getSoproduct1().getSo1().getCustomer1().getCustomerId().equals(customerid) &&
                    productItem.getSoproduct1().getSo1().getSOId().equals(soid)){
                CMP+=productItem.getMp();
                OTP+=productItem.getOtp();
                CMPTD+=productItem.getMPWithTaxandDiscont();
                OTPTD+=productItem.getOTPWithTaxandDiscont();
            }
        }
        soRepository.findOne(soid).setFinalMP(BigDecimal.valueOf(CMP).setScale(2, BigDecimal.ROUND_HALF_UP));
        soRepository.findOne(soid).setFinalOTP(BigDecimal.valueOf(OTP).setScale(2, BigDecimal.ROUND_HALF_UP));
        soRepository.findOne(soid).setFinalMPwithTaxAndDiscount(BigDecimal.valueOf(CMPTD).setScale(2, BigDecimal.ROUND_HALF_UP));
        soRepository.findOne(soid).setFinalOTPwithTaxAndDiscount(BigDecimal.valueOf(OTPTD).setScale(2, BigDecimal.ROUND_HALF_UP));
    }

    @RequestMapping(value = {"/add"}, method = RequestMethod.POST)
    public String addBasd(Model model, ProductItems productItems) {
        /*Soproduct soproduct = soProductRepository.findOne(Long.valueOf(c));
        productItems.setSoproduct1(soproduct);
        Item item = itemRepository.findOne(Long.valueOf(id));
        productItems.setItem1(item);
        productItemsRepository.save(productItems);
        model.addAttribute("PRODUCTITEMS_LIST", productItemsRepository.findAll());
        model.addAttribute("ID", c);*/
        return "/pages/basket";
    }

    @RequestMapping(value = {"/remove/{itemid}/{customerid}/{soid}"}, method = RequestMethod.GET)
    public String removeBasket(Model model, @PathVariable("itemid") Long itemid,
                               @PathVariable("customerid") Long customerid, @PathVariable("soid") Long soid,
                               Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        if (customerRepository.findOne(customerid) == null
                || !customerRepository.findOne(customerid).getUserId().equals(userid.toString())
                || soRepository.findOne(soid) == null
                || !soRepository.findOne(soid).getCustomer1().getUserId().equals(userid.toString())){
            return "error";
        }
        Long parent = ordItemRepository.findOne(itemid).getParentId();
        Item root = itemRepository.findOne(parent);
        if (root != null){
            itemRepository.findOne(parent).setQuantity(root.getQuantity().add(BigInteger.ONE));
        }
        ordItemRepository.delete(itemid);
        priceRecountSO(customerid, soid);
        return "redirect:/application/basket/" + customerid + "/" + soid;
    }


    @RequestMapping(value = {"/cancel/{customerid}/{soid}"}, method = RequestMethod.GET)
    public String cancel(Model model, @PathVariable("customerid") Long customerid,
                         @PathVariable("soid") Long soid, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        if (customerRepository.findOne(customerid) == null
                || !customerRepository.findOne(customerid).getUserId().equals(userid.toString())
                || soRepository.findOne(soid) == null
                || !soRepository.findOne(soid).getCustomer1().getUserId().equals(userid.toString())){
            return "error";
        }
        List<ProductItems> productItems = productItemsRepository.findAll();
        List<ProductItems> productItemsList = new ArrayList<>();
        for (ProductItems product : productItems){
            if (product.getOrdItem().getStatus().equals("Ordered") && soid.equals(product.getSoproduct1().getSo1().getSOId())){
                OrdItem item = product.getOrdItem();
                item.setStatus("Canceled");
                ordItemRepository.save(item);
            }
        }
        So so = soRepository.findOne(soid);
        so.setStatus("Canceled");
        so.setAttentionFlag("");
        return "redirect:/application/basket/" + customerid + "/" + soid;
    }

    @RequestMapping(value = {"/group/{group}"}, method = RequestMethod.GET)
    public String group(Model model, @PathVariable("group") Long groupid) {
        model.addAttribute("ITEM_LIST", itemGroupRepository.findByGroups1_GroupId(groupid));
        return "pages/list";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String emptySO(Model model, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        model.addAttribute("CUSTOMER_LIST", customerRepository.findByUserId(userid.toString()));
        return "/pages/so";
    }

    @RequestMapping(value = {"/faq"}, method = RequestMethod.GET)
    public String createItemdiscount(Model model) {
        return "/services";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String createItemdiscount(Model model, So so, Soproduct soproduct,
                                     @RequestParam("socustomer") String customer1) {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        Customer customer = customerRepository.findOne(Long.valueOf(customer1));
        so.setStatus("Open");
        so.setFinalMP(BigDecimal.ZERO);
        so.setFinalOTP(BigDecimal.ZERO);
        so.setLocation(customer.getAddress1().getCountry());
        so.setFinalMPwithTaxAndDiscount(BigDecimal.ZERO);
        so.setFinalOTPwithTaxAndDiscount(BigDecimal.ZERO);
        so.setDateCreated(dateFormat.format(date));
//        so.setDateModified(dateFormat.format(date));
        so.setCustomer1(customer);
        soRepository.save(so);
        String s = "";
        for (int i = 0; i < 4-so.getSOId().toString().length(); i++)
            s += '0';
        so.setSONumber(s + so.getSOId().toString());
        soRepository.save(so);
        soproduct.setSOPId(so.getSOId());
        soproduct.setSo1(so);
        soProductRepository.save(soproduct);
        model.addAttribute("SO_LIST", soRepository.findAll());
        return "redirect:/application/orderinfo";
    }

    @RequestMapping(value = {"/print/{customerid}/{soid}"}, method = RequestMethod.GET)
    public String print(Model model,
                        @PathVariable("customerid") Long customerid, @PathVariable("soid") Long soid,
                        Principal principal) throws Exception {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        if (customerRepository.findOne(customerid) == null
                || !customerRepository.findOne(customerid).getUserId().equals(userid.toString())
                || soRepository.findOne(soid) == null
                || !soRepository.findOne(soid).getCustomer1().getUserId().equals(userid.toString())){
            throw new NotFoundException(soid);
        }

        List<ProductItems> productItems = productItemsRepository.findAll();
        List<ProductItems> finalproducts = new ArrayList<>();
        Float CMP = 0f;
        Float OTP = 0f;
        Float FCMP = 0f;
        Float FOTP = 0f;
        for (ProductItems productItem : productItems){
            if (productItem.getSoproduct1().getSo1().getCustomer1().getCustomerId().equals(customerid) &&
                    productItem.getSoproduct1().getSo1().getSOId().equals(soid)
                    && productItem.getOrdItem().getStatus().equals("Wait")){
                CMP+=productItem.getMp();
                OTP+=productItem.getOtp();
                FCMP+=productItem.getMPWithTaxandDiscont();
                FOTP+=productItem.getOTPWithTaxandDiscont();
                finalproducts.add(productItem);
            } else if (productItem.getSoproduct1().getSo1().getCustomer1().getCustomerId().equals(customerid) &&
                    productItem.getSoproduct1().getSo1().getSOId().equals(soid)){
                CMP+=productItem.getMp();
                FCMP+=productItem.getMPWithTaxandDiscont();
                finalproducts.add(productItem);
            }
        }
        int i=0;
        for (ProductItems p : finalproducts){
            if (p.getOrdItem().getStatus().equals("Ordered")){
                i++;
            }
        }
        if (i == finalproducts.size() && i != 0){
            soRepository.findOne(soid).setStatus("Ordered");
        }
        model.addAttribute("PRODUCTITEMS_LIST", finalproducts);
        model.addAttribute("CUSTOMERID", customerid);
        model.addAttribute("STATUS", soRepository.findOne(soid).getStatus());
        model.addAttribute("SOID", soid);
        model.addAttribute("USERID", userid);
        model.addAttribute("FCMP", FCMP);
        model.addAttribute("FOTP", FOTP);
        model.addAttribute("CMP", CMP);
        model.addAttribute("OTP", OTP);
        return "/pages/print";
    }
}
