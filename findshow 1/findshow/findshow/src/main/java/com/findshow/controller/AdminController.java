package com.findshow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.findshow.dto.UserDto;
import com.findshow.model.Users;
import com.findshow.service.UserService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserService userService;
	@RequestMapping("/viewadmins")
	public String viewAdmins(Model model) {
		List<UserDto> users=userService.findAllUsers();
		model.addAttribute("users",users);
		return "manageadmins";
	}
}
