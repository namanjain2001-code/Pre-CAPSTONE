package com.findshow.controller;
import java.lang.String;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.findshow.model.Theatre;
import com.findshow.repository.TheatreRepository;
import com.findshow.service.TheatreService;
import java.lang.Object;
@Controller
@RequestMapping("/admin")
public class TheatreController {
	//@Autowired
//	private TheatreService theatreService;
//	@GetMapping("/theatre")
//	public String getTheatrePage(Model model) {
//		Theatre theatre=new Theatre();
//		model.addAttribute(theatre);
//		return "theatre";
//	}
//	@PostMapping("/theatre")
//	public String addTheatre(@ModelAttribute("theatre")Theatre theatre,Model model) {
////		theatreService.saveTheatre(theatre);
//		return "theatre";
//	}
	@Autowired
    private TheatreRepository theatreRepository;

    // Show all theatres
    @GetMapping("/theatres")
    public String listTheatres( Model model ) {
    	model.addAttribute("theatres", theatreRepository.findAll());
        return "theatre-list";  // View name
    }

    // Add new theatre
    @RequestMapping("/theatre/add")
    public String showAddTheatreForm(Model model) {
        model.addAttribute("theatre", new Theatre());
        return "theatre-add";  // View name
    }

    @PostMapping("/theatre/add")
    public String addTheatre(@ModelAttribute Theatre theatre) {
        theatreRepository.save(theatre);
        return "redirect:/admin/theatres";  // Redirect to theatre list after adding
    }

    // Edit theatre
    @GetMapping("/theatre/edit/{id}")
    public String showEditTheatreForm(@PathVariable("id") int id, Model model) {
        model.addAttribute("theatre", theatreRepository.findById(id).orElse(null));
        return "theatre-edit";  // View name
    }

    @PostMapping("/theatre/edit/{id}")
    public String editTheatre(@PathVariable("id") int id, @ModelAttribute Theatre theatre) {
        theatre.setTheatreId(id);  // Update the theatre id before saving
        theatreRepository.save(theatre);
        return "redirect:/admin/theatres";  // Redirect to theatre list after editing
    }

    // Delete theatre
    @GetMapping("/theatre/delete/{id}")
    public String deletetheatre(@PathVariable("id") int id) {
        theatreRepository.deleteById(id);
        return "redirect:/admin/theatres";  // Redirect to theatre list after deletion
    }
}

