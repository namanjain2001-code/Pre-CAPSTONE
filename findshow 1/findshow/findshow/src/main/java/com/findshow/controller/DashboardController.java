package com.findshow.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class DashboardController {
 
    // Mapping to the dashboard page
    @GetMapping("/admin/dashboard")
    public String showDashboard() {
        return "dashboard"; // This will resolve to dashboard.jsp
    }
}