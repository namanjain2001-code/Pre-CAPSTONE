package com.findshow.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.findshow.model.Movie;
import com.findshow.model.Notification;
import com.findshow.model.Role;
import com.findshow.model.Role.RoleName;
import com.findshow.repository.BookingRepository;
import com.findshow.repository.MovieRepository;
import com.findshow.repository.NotificationRepository;
import com.findshow.model.Users;
import com.findshow.service.NotificationService;
import com.findshow.service.RoleService;
import com.findshow.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private MovieRepository movieRepository;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
	private NotificationService notificationService;
	@Autowired
	private NotificationRepository notificationRepository;
	@Autowired
	private BookingRepository bookingService;
    
    @GetMapping("/register")
    public String registerUser(Model model) {
        Users user = new Users();
        model.addAttribute("user", user);
        return "register";  // Return the registration page
    }
    @GetMapping("/user/dashboard")
    public String getDashboard(Model model) {
    	Users user = new Users();
    	model.addAttribute("user", user);
    	model.addAttribute("movies",movieRepository.findAll());
    	return "home";  // Return the registration page
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
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.isAuthenticated()) {
            Notification notification = notificationService.welcomeNotification(user.getName());
            notification.setNotificationId((Integer) null);
            System.out.println(user.getUserId());
            notification.setUser(user);
            notificationRepository.save(notification);
		}
        return "redirect:/user/dashboard";  // Redirect to dashboard after successful registration
    }
    @GetMapping("/user/bookings")
    public String getAllBookings(Model model) {
        // Fetch all bookings from the service
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName();  
            int userId=userService.findByEmail(currentUserName).getUserId();

            model.addAttribute("bookings", bookingService.findAllBySeats_UserUserId(userId));
            model.addAttribute("currentUserId", userId);
        }
        return "booking-list";  // Display bookings on the dashboard page
    }

    
    
    // Custom Login Page
//    @RequestMapping("/login")
//    public String showLoginPage() {
//        return "login";  // Return the login page
//    }


}
