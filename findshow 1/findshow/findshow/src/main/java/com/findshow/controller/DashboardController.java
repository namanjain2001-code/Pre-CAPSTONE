package com.findshow.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.findshow.repository.BookingRepository;
 
@Controller
public class DashboardController {
 
    // Mapping to the dashboard page
    @GetMapping("/admin/dashboard")
    public String showDashboard() {
        return "dashboard"; // This will resolve to dashboard.jsp
    }
    @Autowired
    private BookingRepository bookingService;
 
    // Add a method to show all bookings in the dashboard
    @GetMapping("/admin/bookings")
    public String getAllBookings(Model model) {
        // Fetch all bookings from the service
        model.addAttribute("bookings", bookingService.findAll());
        return "booking-list";  // Display bookings on the dashboard page
    }
}