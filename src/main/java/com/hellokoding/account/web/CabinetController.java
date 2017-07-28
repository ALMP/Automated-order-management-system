package com.hellokoding.account.web;

import com.hellokoding.account.Models.*;
import com.hellokoding.account.model.User;
import com.hellokoding.account.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.ws.rs.BeanParam;
import javax.ws.rs.core.Context;
import java.math.BigDecimal;
import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by Admin on 27.11.2016.
 */


@RequestMapping(value = {"/cabinet"})
@Controller
public class CabinetController {


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
    private PaymentBillRepository paymentBillRepository;
    @Autowired
    private PaymentTypeRepository paymentTypeRepository;
    @Autowired
    private SOProductRepository soProductRepository;
    @Autowired
    private OrdItemRepository ordItemRepository;

    @Autowired
    private SORepository soRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @RolesAllowed("ROLE_USER")
    @RequestMapping(value = {"/cabinet"}, method = RequestMethod.GET)
    public String cabinet(Model model, Principal principal) {
        //String qwe = bCryptPasswordEncoder.encode("12345678");
        if (principal==null){
            return "redirect:/";
        }
        model.addAttribute("CUSTOMER_LIST", customerRepository.findByUserId(Long.toString(userRepository.findByUsername(principal.getName()).getId())));
        model.addAttribute("SO_LIST", soRepository.findAll());
        return "/cabinet/list"; //Используется для просмотра главной страницы
    }

    @RequestMapping(value = {"/payments"}, method = RequestMethod.GET)
    public String payments(Model model, Principal principal) {
        //String qwe = bCryptPasswordEncoder.encode("12345678");
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        model.addAttribute("PAYMENTS_LIST", paymentFacade.findBySo1_Customer1_UserId(userid.toString()));
        model.addAttribute("SO_LIST", soRepository.findAll());
        return "/cabinet/paymentslist";
    }

    @RequestMapping(value = {"/customer/update/{id}"}, method = RequestMethod.GET)
    public String editCustomer(Model model, @PathVariable("id") Long id,  Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        if ( customerRepository.findOne(id) == null
                || !customerRepository.findOne(id).getUserId().equals(userid.toString())){
            model.addAttribute("message", "You cannot update others customer information");
            return "error";
        }
        model.addAttribute("CUSTOMER", customerRepository.findOne(id));
        model.addAttribute("ADDRESS", customerRepository.findOne(id).getAddress1());
        return "cabinet/update";
    }

    @RequestMapping(value = {"/customer/update"}, method = RequestMethod.POST)
    public String updateCustomer(@Valid
                                 @BeanParam Customer customer, @Valid @BeanParam Address address) {
        Customer customer1 = customerRepository.findOne(customer.getCustomerId());
        customer1.setContact(customer.getContact());
        customer1.setCountNumber(customer.getCountNumber());
        customer1.setEmail(customer.getEmail());
        customer1.setFirstName(customer.getFirstName());
        customer1.setLastName(customer.getLastName());
        customer1.setPhone(customer.getPhone());
        customer1.getAddress1().setAddressLine(address.getAddressLine());
        customer1.getAddress1().setCity(address.getCity());
        customer1.getAddress1().setCountry(address.getCountry());
        customer1.getAddress1().setPostalCode(address.getPostalCode());
        addressRepository.save(customer1.getAddress1());
        customerRepository.save(customer1);
        return "redirect:/cabinet/customerinfo";
    }

    @RequestMapping(value = {"/myorders"}, method = RequestMethod.GET)
    public String getOrders(Model model, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        model.addAttribute("SO_LIST", soRepository.findByCustomer1_UserId(userid.toString()));
        return "cabinet/orders";
    }

    @RequestMapping(value = {"/mypayments"}, method = RequestMethod.GET)
    public String getPayments(Model model, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        model.addAttribute("PAYMENTS_LIST", paymentFacade.findBySo1_Customer1_UserId(userid.toString()));
        return "cabinet/payments";
    }


    @RequestMapping(value = {"/password"}, method = RequestMethod.GET)
    public String getPassword(Model model, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        return "cabinet/password";
    }

    @RequestMapping(value = {"/password"}, method = RequestMethod.POST)
    public String updatePassword(Model model, Principal principal, @RequestParam("name1") String name1,
                                 @RequestParam("name2") String name2, @RequestParam("name3") String name3) {
        if (principal==null){
            return "redirect:/";
        }
        if (name2.length() < 8 || name2.length() > 32
                || name3.length() < 8 || name3.length() > 32) {
            model.addAttribute("message", "You entered uncorrect password length");
            return "error";
        }
        if (!name2.equals(name3) || userRepository.findByUsername(principal.getName()) == null
                || !bCryptPasswordEncoder.matches(name1, userRepository.findByUsername(principal.getName()).getPassword())){
            model.addAttribute("message", "Passwords didn't matches");
            return "error";
        }
        if (bCryptPasswordEncoder.matches(name2, userRepository.findByUsername(principal.getName()).getPassword())){
            model.addAttribute("message", "You entered wrong password");
            return "error";
        }
        User u = userRepository.findByUsername(principal.getName());
        User user = new User();
        user.setId(u.getId());
        user.setPassword(bCryptPasswordEncoder.encode(name2));
        user.setPasswordConfirm(bCryptPasswordEncoder.encode(name2));
        user.setQuestion(u.getQuestion());
        user.setAnswer(u.getAnswer());
        user.setRoles(u.getRoles());
        user.setUsername(u.getUsername());
        userRepository.save(user);
        return "redirect:/cabinet/cabinet";
    }

    @RequestMapping(value = {"/apply/{sq}"}, method = RequestMethod.GET)
    public String apply(Model model, @PathVariable("sq") Long qw, Principal principal,
                        @Context HttpServletResponse httpServletResponse,
                        @Context HttpServletRequest httpServletRequest) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid = userRepository.findByUsername(principal.getName()).getId();
        if ( soRepository.findOne(qw) == null
                || !soRepository.findOne(qw).getCustomer1().getUserId().equals(userid.toString())){
            model.addAttribute("message", "You cannot process this order");
            return "error";
        }

        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        Float CMP = 0f;
        Float OTP = 0f;
        So so = soRepository.findOne(qw);
        if (!so.getStatus().equals("Ordered")) {
            Paymentbill paymentbill = new Paymentbill();
            List<ProductItems> productItems = productItemsRepository.findAll();
            List<ProductItems> productItemsList = new ArrayList<>();
            for (ProductItems pi : productItems){
                if (pi.getOrdItem().getStatus().equals("Wait")  && qw.equals(pi.getSoproduct1().getSo1().getSOId())){
                    CMP += pi.getMPWithTaxandDiscont();
                    OTP += pi.getOTPWithTaxandDiscont();
                }
            }

            Integer signal = 0;
            for (ProductItems product : productItems) {
                if (product.getOrdItem().getStatus().equals("Wait") && qw.equals(product.getSoproduct1().getSo1().getSOId())) {
                    if (product.getOrdItem().getDefOTP() != 0 || product.getOrdItem().getDefOTP() != null){
                        signal+=1;
                    }
                }
            }
            if (signal != 0){
                paymentbill.setCotp(OTP);
            } else {
                paymentbill.setCmp(CMP);
            }
            for (ProductItems product : productItems) {
                if (product.getOrdItem().getStatus().equals("Wait") && qw.equals(product.getSoproduct1().getSo1().getSOId())) {
                    OrdItem item = product.getOrdItem();
                    item.setStatus("Ordered");
                    ordItemRepository.save(item);
                }
            }
            so.setStatus("Ordered");
            so.setFinalOTPwithTaxAndDiscount(BigDecimal.ZERO);
            so.setOrderDate(dateFormat.format(date));
            soRepository.save(so);
            paymentBillRepository.save(paymentbill);
            Payment payment = new Payment();
            payment.setPaymentDate(date);
            payment.setPaymentInfo("Payment was succesfull");
            payment.setSo1(so);
            payment.setPaymentbill1(paymentbill);
            payment.setPaymenttype1(paymentTypeRepository.findOne(2L));
            paymentFacade.save(payment);
            so.setPurchaseOrderNumber(payment.getPaymentId().toString());
            soRepository.save(so);
        } else if (so.getAttentionFlag() != null && so.getAttentionFlag().contains("Waiting for payment") && so.getStatus().equals("Ordered")){
            try {
                Paymentbill paymentbill = new Paymentbill();
                List<ProductItems> productItems = productItemsRepository.findAll();
                List<ProductItems> productItemsList = new ArrayList<>();
                for (ProductItems pi : productItems){
                    if (pi.getOrdItem().getStatus().equals("Ordered")  && qw.equals(pi.getSoproduct1().getSo1().getSOId())){
                        CMP += pi.getMPWithTaxandDiscont();
                    }
                }
                paymentbill.setCmp(CMP);
                so.setStatus("Ordered");

                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Date lastdate = formatter.parse(so.getOrderDate());
                Calendar cal = Calendar.getInstance();
                cal.setTime(lastdate);
                cal.add(Calendar.MONTH, 1);
                lastdate = cal.getTime();
                so.setOrderDate(dateFormat.format(lastdate));
                so.setAttentionFlag("");
                soRepository.save(so);
                paymentBillRepository.save(paymentbill);
                Payment payment = new Payment();
                payment.setPaymentDate(date);
                payment.setPaymentInfo("Payment was succesfull");
                payment.setSo1(so);
                payment.setPaymentbill1(paymentbill);
                payment.setPaymenttype1(paymentTypeRepository.findOne(2L));
                paymentFacade.save(payment);
                so.setPurchaseOrderNumber(payment.getPaymentId().toString());
                soRepository.save(so);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/application/orderinfo";
    }

    @RequestMapping(value = {"/customer/remove/{id}"}, method = RequestMethod.GET)
    public String deleteCustomer(Model model, Principal principal, @PathVariable("id") Integer id) {
        if (principal==null){
            return "redirect:/";
        }
        Long userid =  userRepository.findByUsername(principal.getName()).getId();
        if (!soRepository.findByCustomer1_CustomerId(Long.valueOf(id)).isEmpty()){
            model.addAttribute("message", "You have more then 0 orders on this customer");
            return "error";
        }
        customerRepository.delete(customerRepository.findOne(Long.valueOf(id)));

        return "redirect:/cabinet/customerinfo";
    }

    @RequestMapping(value = {"/customerinfo"}, method = RequestMethod.GET)
    public String getCustomer(Model model, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        Long id =  userRepository.findByUsername(principal.getName()).getId();
        model.addAttribute("CUSTOMER_LIST", customerRepository.findByUserId(id.toString()));

        return "cabinet/cabinet";
    }

    @RequestMapping(value = {"/newcustomer"}, method = RequestMethod.GET)
    public String emptyCustomer(Model model, Principal principal) {
        if (principal==null){
            return "redirect:/";
        }
        model.addAttribute("ADDRESS_LIST", addressRepository.findAll());
        return "cabinet/create";
    }

    @RequestMapping(value = {"/newcustomer"}, method = RequestMethod.POST)
    public String createCustomer(Model model, Principal principal, Address address, Customer customer,
                                 @RequestParam("firstName") String firstName,
                                 @RequestParam("lastName") String lastName,
                                 @RequestParam("contact") String contact,
                                 @RequestParam("email") String email,
                                 @RequestParam("phone") String phone,
                                 @RequestParam("addressLine") String addressLine,
                                 @RequestParam("city") String city,
                                 @RequestParam("country") String country,
                                 @RequestParam("postalCode") String postalCode) {
        if (principal==null){
            return "redirect:/";
        }
        if (customerRepository.findByEmail(email) != null){
            model.addAttribute("message", "Customer with this e-mail already situated. Please, use another e-mail!");
            return "error";
        }
        customer.setLastName(lastName);
        customer.setFirstName(firstName);
        customer.setContact(contact);
        customer.setEmail(email);
        customer.setPhone(phone);
        Long i = userRepository.findByUsername(principal.getName()).getId();
        String s = String.valueOf(i);
        customer.setUserId(String.valueOf(s));
        customer.setUsername(principal.getName());
        address.setAddressLine(addressLine);
        address.setCity(city);
        address.setCountry(country);
        address.setPostalCode(postalCode);
        addressRepository.save(address);
        customer.setAddress1(address);
        customerRepository.save(customer);
        return "redirect:customerinfo";
    }

    @RequestMapping(value = {"/print/{payid}"}, method = RequestMethod.GET)
    public String print(Model model, Principal principal, @PathVariable("payid") Long payid) {
        if (principal==null){
            return "redirect:/";
        }
        Long id =  userRepository.findByUsername(principal.getName()).getId();
        model.addAttribute("PAY", paymentFacade.findOne(payid));

        return "cabinet/print";
    }
}
