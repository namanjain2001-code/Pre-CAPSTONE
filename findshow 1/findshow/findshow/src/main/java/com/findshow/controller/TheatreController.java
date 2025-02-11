package com.findshow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.findshow.model.Theatre;
import com.findshow.service.TheatreService;

@Controller
public class TheatreController {
	@Autowired
	TheatreService theatreService;
	@GetMapping("/theatre")
	public String getTheatrePage(Model model) {
		Theatre theatre=new Theatre();
		model.addAttribute(theatre);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		System.out.print(authentication.getPrincipal());
		return "theatre";
	}
	@PostMapping("/theatre")
	public String addTheatre(@ModelAttribute("theatre")Theatre theatre,Model model) {
//		theatreService.saveTheatre(theatre);
		return "theatre";
	}
}
