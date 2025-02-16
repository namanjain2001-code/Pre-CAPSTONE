package com.findshow.controller;

import com.findshow.model.Screen;
import com.findshow.model.Theatre;
import com.findshow.repository.ScreenRepository;
import com.findshow.repository.TheatreRepository;
import com.findshow.service.ScreenService;
import com.findshow.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class ScreenController {

    @Autowired
    private ScreenRepository screenRepository;
    
    @Autowired
    private UserService UserService;

    @Autowired
    private TheatreRepository theaterRepository;
    
    @Autowired
	private ScreenService screenService;

    // Show all screens
    @GetMapping("/screens")
    public String listScreens(Model model) {
Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName(); 
            int userId=UserService.findByEmail(currentUserName).getUserId();
            model.addAttribute("screens", screenService.getTheatresAndScreensByUserId(userId));
        }
        return "screen-list";  // View name
    }

    // Add new screen
    @GetMapping("/screen/add")
    public String showAddScreenForm(Model model) {
        model.addAttribute("screen", new Screen());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName(); 
            int userId=UserService.findByEmail(currentUserName).getUserId();
            model.addAttribute("theaters", theaterRepository.findAllByUser_userId(userId));
        }

        model.addAttribute("screenTypes",Screen.ScreenType.values());
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
Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName(); 
            int userId=UserService.findByEmail(currentUserName).getUserId();
            model.addAttribute("theaters", theaterRepository.findAllByUser_userId(userId));
        }
        model.addAttribute("screenTypes",Screen.ScreenType.values());
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
