package com.findshow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.web.exchanges.HttpExchange.Principal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.findshow.dto.UserDto;
import com.findshow.service.RoleService;
import com.findshow.service.UserService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserService userService;
	@Autowired
    private RoleService roleService;
    @Autowired
    private PasswordEncoder passwordEncoder;

	
	
	
	@RequestMapping("/revenuedashboard")
	public String viewAdmins(Model model) {
		List<UserDto> users=userService.findAllUsers();
		model.addAttribute("users",users);
		return "adminrevenue";
	}
    
    

}
