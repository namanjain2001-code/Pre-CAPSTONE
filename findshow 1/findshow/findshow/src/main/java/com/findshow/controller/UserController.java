package com.findshow.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.web.exchanges.HttpExchange.Principal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.findshow.model.Role;
import com.findshow.model.Users;
import com.findshow.service.RoleService;
import com.findshow.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
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
    	Users existing=userService.findByEmail(user.getEmail());
    	if(existing!=null && existing.getEmail()!=null && !existing.getEmail().isEmpty()) {
    		return "register";
    	}
    	Set<Role> roles=new HashSet<>();
    	roles.add(roleService.getRoleName("ROLE_USER"));
    	user.setRoles(roles);
    	userService.saveUser(user);
        return "redirect:/user/dashboard";
    }
    @GetMapping("/dashboard")
    public String getDashboard(Principal principal ){
    	String userName=principal.getName();
    	return "dashboard";
    }
    
}
