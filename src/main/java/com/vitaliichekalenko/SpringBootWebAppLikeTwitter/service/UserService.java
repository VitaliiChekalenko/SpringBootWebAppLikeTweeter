package com.vitaliichekalenko.SpringBootWebAppLikeTwitter.service;

import com.vitaliichekalenko.SpringBootWebAppLikeTwitter.domain.Role;
import com.vitaliichekalenko.SpringBootWebAppLikeTwitter.domain.User;
import com.vitaliichekalenko.SpringBootWebAppLikeTwitter.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MailSender mailSender;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public boolean addUser(User user){

        User userFromDB = userRepo.findByUsername(user.getUsername());
        if(userFromDB != null){
            return false;
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        userRepo.save(user);

        if(StringUtils.isEmpty(user.getEmail())){
            String message = String.format("Hello, %s! \n"+ "Welcome to Sweater. Please confirm your email. "
                    +"Use: http://localhost:8090/activation/%s", user.getUsername(), user.getActivationCode());
            mailSender.send(user.getEmail(), "Activation code", message);
        }
        return true;
    }

    public boolean activateUser(String code) {

        User user = userRepo.findByActivationCode(code);

        if(user == null)
            return false;

        user.setActivationCode(null);
        userRepo.save(user);

        return true;
    }
}
