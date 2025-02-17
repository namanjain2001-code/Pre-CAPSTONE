package com.findshow.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.findshow.repository.BookingRepository;
import com.findshow.service.UserService;
 
@Controller
public class DashboardController {
 
    // Mapping to the dashboard page
    @GetMapping("/admin/dashboard")
    public String showDashboard() {
        return "dashboard"; // This will resolve to dashboard.jsp
    }
    @Autowired
    private BookingRepository bookingService;
    @Autowired
    private UserService userService;
 
    // Add a method to show all bookings in the dashboard
    @GetMapping("/admin/bookings")
    public String getAllBookings(Model model) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName();  
            int userId=userService.findByEmail(currentUserName).getUserId();

            model.addAttribute("currentUserId", userId);
            model.addAttribute("bookings", bookingService.findAllBySeats_Show_Screen_Theatre_User_UserId(userId));
        }
        // Fetch all bookings from the service
        return "booking-list";  // Display bookings on the dashboard page
    }
}