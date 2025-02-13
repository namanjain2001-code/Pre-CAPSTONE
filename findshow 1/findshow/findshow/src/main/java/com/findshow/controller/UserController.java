/*package com.findshow.controller;

import com.findshow.model.Users;
import com.findshow.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.validation.Valid;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/register")
    public String registerUser(Model model) {
        Users user = new Users();
        model.addAttribute("user", user);
        return "register";  // Return the registration page
    }

    @PostMapping("/register")
    public String saveUser(@ModelAttribute("user") @Valid Users user, BindingResult result) {
        // Check for validation errors
        if (result.hasErrors()) {
            return "register";  // If there are validation errors, show the form again
        }

        // Encode password before saving
        String encodedPassword = passwordEncoder.encode(user.getPasswordHash());
        user.setPasswordHash(encodedPassword);

        // Check if the email already exists in the database
        Users existing = userService.findByEmail(user.getEmail());
        if (existing != null) {
            result.rejectValue("email", "email.exists", "Email already in use");
            return "register";  // Return to registration page if email exists
        }

        // Save the user to the database
        userService.saveUser(user);
        return "redirect:/user/dashboard";  // Redirect to dashboard after successful registration
    }
}*/

package com.findshow.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.findshow.model.Role;
import com.findshow.model.Role.RoleName;
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
    public String registerUser(Model model) {
        Users user = new Users();
        model.addAttribute("user", user);
        return "register";  // Return the registration page
    }

    @PostMapping("/register")
    public String saveUser(@ModelAttribute("user") Users user) {
        String encodedPassword = passwordEncoder.encode(user.getPasswordHash());
        user.setPasswordHash(encodedPassword);
        
        Users existing = userService.findByEmail(user.getEmail());
        if (existing != null) {
            return "register";  // Return the registration page if user exists
        }
        
        Set<Role> roles = new HashSet<>();
        roles.add(roleService.getRoleName(RoleName.ROLE_USER));
        user.setRoles(roles);
        userService.saveUser(user);
        return "redirect:/user/dashboard";  // Redirect to dashboard after successful registration
    }

//<<<<<<< HEAD
//    @GetMapping("/dashboard")
//    public String getDashboard(Principal principal ){
//    	String userName=principal.getName();
//    	return "dashboard";
//=======
//    @GetMapping("/user/dashboard")
//    public String getDashboard() {
//        return "dashboard";  // Return the dashboard page
//>>>>>>> 93c8e3ed851606b401030f7005618187264cb3a0
//    }
    
    // Custom Login Page
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";  // Return the login page
    }
}

