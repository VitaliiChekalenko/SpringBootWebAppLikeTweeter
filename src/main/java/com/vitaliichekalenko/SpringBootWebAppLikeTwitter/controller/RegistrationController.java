package com.vitaliichekalenko.SpringBootWebAppLikeTwitter.controller;

import com.vitaliichekalenko.SpringBootWebAppLikeTwitter.domain.Role;
import com.vitaliichekalenko.SpringBootWebAppLikeTwitter.domain.User;
import com.vitaliichekalenko.SpringBootWebAppLikeTwitter.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registration(){
        System.out.println("Get/registration");
        return "/registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model){
        System.out.println("POST/registration");
        User userFromDB = userRepo.findByUsername(user.getUsername());

        if(userFromDB != null){
            model.put("message", "User exist!");
            System.out.println("User exist!");
            return "registration";
        }

        user.setActive(true);
        System.out.println("USer saved");
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);

        return"redirect:/login";
    }

}
