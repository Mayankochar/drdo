package com.drdo.project.app.controller;

import com.drdo.project.app.entity.User;
import com.drdo.project.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "/register")
    public String register(Model model){
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping(value = "/doRegister")
    public String registerUser(@ModelAttribute("user")User user, HttpServletRequest request) throws ServletException{
        String message = userService.registerUser(user);
        ModelAndView modelAndView = new ModelAndView();
        if (message.equalsIgnoreCase("success")){
            modelAndView.addObject("message", "Successfully registered user");
            return "redirect:/";
        }
        else {
            modelAndView.addObject("message", "User already exists");
            return "register";
        }
    }

    @GetMapping(value="/logout")
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }
}
