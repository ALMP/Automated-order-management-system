package com.hellokoding.account.web;

import com.hellokoding.account.model.User;
import com.hellokoding.account.repository.GroupRepository;
import com.hellokoding.account.repository.ItemGroupRepository;
import com.hellokoding.account.repository.UserRepository;
import com.hellokoding.account.service.SecurityService;
import com.hellokoding.account.service.UserService;
import com.hellokoding.account.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Context;
import java.security.Principal;
import java.util.Collection;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private GroupRepository groupRepository;

    @Autowired
    private ItemGroupRepository itemGroupRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(Model model) {
        model.addAttribute("userForm", new User());

        return "pages/main";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/main";
    }


    @RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
    public String forgottenSands(Model model) {
        model.addAttribute("userForm", new User());
        model.addAttribute("user", false);
        return "resetPassword";
    }

    @RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
    public String forgottenSands(@Context HttpServletResponse httpServletResponse,
                                 @Context HttpServletRequest httpServletRequest,
                                 Model model, User user) {
        if (userService.findByUsername(user.getUsername()) != null && user.getQuestion() == null){
            model.addAttribute("user", true);
            user = userService.findByUsername(user.getUsername());
            model.addAttribute("userForm", user);
            return "resetPassword";
        }
        User real = userService.findByUsername(user.getUsername());
        if (real == null){
            model.addAttribute("message", "There is no such users in the system");
            return "error";
        }
        if (user.getQuestion() == null && user.getAnswer() == null){
            model.addAttribute("message", "You entered uncorrect answer");
            return "error";
        }
        if (!user.getAnswer().equals(real.getAnswer())){
            model.addAttribute("message", "You entered uncorrect answer");
            return "error";
        }
        if (user.getQuestion().equals(real.getQuestion()) && user.getAnswer().equals(real.getAnswer())){
            Cookie cookie = new Cookie("Login", user.getUsername());
            httpServletResponse.addCookie(cookie);
            return "redirect:/changepassword";
        }
        return "redirect:/main";
    }


    @RequestMapping(value = {"/changepassword"}, method = RequestMethod.GET)
    public String getPassword(@Context HttpServletResponse httpServletResponse,
                              @Context HttpServletRequest httpServletRequest, Model model) {

        return "changepassword";
    }

    @RequestMapping(value = {"/changepassword"}, method = RequestMethod.POST)
    public String updatePassword(@Context HttpServletResponse httpServletResponse,
                                 @Context HttpServletRequest httpServletRequest, Model model,
                                 @RequestParam("name2") String name2, @RequestParam("name3") String name3) {
        String login = "";
        for (Cookie cookie : httpServletRequest.getCookies()){
            if (cookie.getName().equals("Login")){
                login = cookie.getValue();
            }
        }
        if (StringUtils.isEmpty(login)){
            return "redirect:/main";
        }
        if (name2.length() < 8 || name2.length() > 32
                || name3.length() < 8 || name3.length() > 32) {
            model.addAttribute("message", "You entered uncorrect password length");
            return "error";
        }
        User u = userService.findByUsername(login);
        User user = new User();
        user.setId(u.getId());
        user.setPassword(bCryptPasswordEncoder.encode(name2));
        user.setPasswordConfirm(bCryptPasswordEncoder.encode(name2));
        user.setQuestion(u.getQuestion());
        user.setAnswer(u.getAnswer());
        user.setRoles(u.getRoles());
        user.setUsername(u.getUsername());
        userRepository.save(user);
        return "redirect:/main";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model, Principal principal) {
        model.addAttribute("us", principal);
        Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>)    SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        Boolean adm = false;
        for (SimpleGrantedAuthority i: authorities) {
            if (String.valueOf(i).equals("ROLE_MODER")) {
                adm = true;
                break;
            }
        }
        model.addAttribute("ADM", adm);
        model.addAttribute("GROUP_LIST", groupRepository.findAll());
        return "pages/main";
    }

    @RequestMapping(value = {"/adm"}, method = RequestMethod.GET)
    public String admin(Model model, Principal principal) {
        return "admin";
    }

}
