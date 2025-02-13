/*package com.findshow.controller;

import java.util.HashSet;
import java.util.List;
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
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import jakarta.validation.Valid;

import com.findshow.dto.UserDto;
import com.findshow.model.Role;
import com.findshow.model.Role.RoleName;
import com.findshow.model.Users;
import com.findshow.service.RoleService;
import com.findshow.service.UserService;


@Controller
@RequestMapping("/api/admin")
public class AdminRegisterController {
    @Autowired
    UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping("/viewadmins")
    public String viewAdmins(Model model) {
        List<UserDto> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "manageadmins";
    }

    @GetMapping("/register")
    public String registerUser(Model model) {
        Users user = new Users();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register")
    public String saveUser(@Valid @ModelAttribute("user") Users user, BindingResult result, Model model) {
        // Check if validation errors exist
        if (result.hasErrors()) {
            return "register"; // Return to the form with errors
        }

        // Check if user with the same email already exists
        Users existing = userService.findByEmail(user.getEmail());
        if (existing != null && existing.getEmail() != null && !existing.getEmail().isEmpty()) {
            model.addAttribute("emailError", "Email is already in use.");
            return "register"; // Return to the form if the email is taken
        }

        // Encrypt the password
        String encodedPassword = passwordEncoder.encode(user.getPasswordHash());
        user.setPasswordHash(encodedPassword);

        // Assign roles
        Set<Role> roles = new HashSet<>();
        roles.add(roleService.getRoleName(RoleName.ROLE_ADMIN));
        user.setRoles(roles);

        // Save user to the database
        userService.saveUser(user);

        return "redirect:/admin/dashboard";
    }

    @GetMapping("/dashboard")
    public String getDashboard(Principal principal) {
        String userName = principal.getName();
        return "dashboard";
    }
}*/

package com.findshow.controller;

import java.util.HashSet;
import java.util.List;
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

import com.findshow.dto.UserDto;
import com.findshow.model.Role;
import com.findshow.model.Role.RoleName;
import com.findshow.model.Users;
import com.findshow.service.RoleService;
import com.findshow.service.UserService;


@Controller
@RequestMapping("/api/admin")
public class AdminRegisterController {
	@Autowired
	UserService userService;
	@Autowired
    private RoleService roleService;
    @Autowired
    private PasswordEncoder passwordEncoder;

	
	
	
	@RequestMapping("/viewadmins")
	public String viewAdmins(Model model) {
		List<UserDto> users=userService.findAllUsers();
		model.addAttribute("users",users);
		return "manageadmins";
	}
    
    @GetMapping("/register")
    public String registerUser(Model model){
    	Users user=new Users();
    	model.addAttribute("user",user);
        return "register";
    }
    @PostMapping("/register")
    public String saveUser(@ModelAttribute("user")Users user){
    	String encodedPassword = passwordEncoder.encode(user.getPasswordHash());
    	System.out.print(passwordEncoder.matches(user.getPasswordHash(),"$2a$10$LmH7M0YDfDRsn0Zrk/8Ese6ee1TNDk9nGI1j1SIRiZvhisgKeN9zm" ));
    	user.setPasswordHash(encodedPassword);
    	Users existing=userService.findByEmail(user.getEmail());
    	if(existing!=null && existing.getEmail()!=null && !existing.getEmail().isEmpty()) {
    		return "register";
    	}
    	Set<Role> roles=new HashSet<>();
    	roles.add(roleService.getRoleName(RoleName.ROLE_ADMIN));
    	user.setRoles(roles);
    	userService.saveUser(user);
        return "redirect:/admin/dashboard";
    }
    @GetMapping("/dashboard")
    public String getDashboard(Principal principal ){
    	String userName=principal.getName();
    	return "dashboard";
    }
}
