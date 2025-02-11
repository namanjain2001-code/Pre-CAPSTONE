package com.findshow.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.findshow.model.Users;
import com.findshow.service.UserService;
import com.findshow.repository.UserRepository;

@Controller
public class RegisterController {
    @Autowired
    private UserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/register")
    public String registerUser(Model model){
    	Users user=new Users();
    	model.addAttribute("user",user);
        return "register";
    }
    @PostMapping("/register")
    public String saveUser(@ModelAttribute("user")Users user){
    	String encodedPassword = passwordEncoder.encode(user.getPasswordHash());
    	user.setPasswordHash(encodedPassword);
    	
//    	System.out.println(user.getPasswordHash());
    	Users existing=userService.findByEmail(user.getEmail());
    	if(existing!=null && existing.getEmail()!=null && !existing.getEmail().isEmpty()) {
    		return "register";
    	}
    	
    	userService.saveUser(user);
        return "redirect:/register/dashboard";
    }
    @GetMapping("/admin")
    public String getDashboard() {
    	return "dashboard";
    }
//    @GetMapping("/register/dashboard")
//    @ResponseBody
//    public List<User> getUsers() {
//    	return userRepository.findAll();
//    }
}
