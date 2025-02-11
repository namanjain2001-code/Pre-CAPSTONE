package com.findshow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/superadmin")
public class SuperAdminController {
	@RequestMapping("/dashboard")
	public String getUserdashboard() {
		return "admin";
	}
}
