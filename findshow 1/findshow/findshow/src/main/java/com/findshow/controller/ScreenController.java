package com.findshow.controller;

import com.findshow.model.Screen;
import com.findshow.model.Theatre;
import com.findshow.repository.ScreenRepository;
import com.findshow.repository.TheatreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class ScreenController {

    @Autowired
    private ScreenRepository screenRepository;

    @Autowired
    private TheatreRepository theaterRepository;

    // Show all screens
    @GetMapping("/screens")
    public String listScreens(Model model) {
        model.addAttribute("screens", screenRepository.findAll());
        return "screen-list";  // View name
    }

    // Add new screen
    @GetMapping("/screen/add")
    public String showAddScreenForm(Model model) {
        model.addAttribute("screen", new Screen());
        model.addAttribute("theaters", theaterRepository.findAll());
        return "screen-add";  // View name
    }

    @PostMapping("/screen/add")
    public String addScreen(@ModelAttribute Screen screen) {
        screenRepository.save(screen);
        return "redirect:/admin/screens";  // Redirect to screen list after adding
    }

    // Edit screen
    @GetMapping("/screen/edit/{id}")
    public String showEditScreenForm(@PathVariable("id") int id, Model model) {
        model.addAttribute("screen", screenRepository.findById(id).orElse(null));
        model.addAttribute("theaters", theaterRepository.findAll());
        return "screen-edit";  // View name
    }

    @PostMapping("/screen/edit/{id}")
    public String editScreen(@PathVariable("id") int id, @ModelAttribute Screen screen) {
        screen.setScreenId(id);  // Update the screen id before saving
        screenRepository.save(screen);
        return "redirect:/admin/screens";  // Redirect to screen list after editing
    }

    // Delete screen
    @GetMapping("/screen/delete/{id}")
    public String deleteScreen(@PathVariable("id") int id) {
        screenRepository.deleteById(id);
        return "redirect:/admin/screens";  // Redirect to screen list after deletion
    }
}
