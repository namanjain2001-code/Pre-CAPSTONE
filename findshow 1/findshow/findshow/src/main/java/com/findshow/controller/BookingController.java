package com.findshow.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.endpoint.SecurityContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
 
import com.findshow.model.Booking;
import com.findshow.repository.ShowRepository;
import com.findshow.repository.UserRepository;

 
@Controller
public class BookingController {
 
    @Autowired
    private ShowRepository showRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BookingRepository bookingRepository;
    @PostMapping("/user/booking-summary")
    public String getBookingSummary(@RequestParam("theatreName") String theatreName,
			@RequestParam("screen") int screenNumber,@RequestParam("show") int showId, @RequestParam("seats") String seats,@RequestParam("amount") int amount,Model model) {
        // Retrieve booking details (this can be from a session or database query)
    		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
    		if(auth!=null) {
    			String current=auth.getName();
    			String  customerName=userRepository.findByEmail(current).getName();
    		}
        // Extract data to be displayed in the JSP
 
 
        model.addAttribute("theatreName", theatreName);
        model.addAttribute("seatNumbers", seats);
        model.addAttribute("show",showRepository.findByShowId(showId));
        model.addAttribute("amount", amount);
 
        return "booking-summary"; // This refers to booking-summary.jsp
    }
 
    @GetMapping("/proceed-to-payment")
    public String proceedToPayment(@RequestParam("bookingId") int bookingId, Model model) {
        // Fetch booking and display payment details
        model.addAttribute("booking", bookingId);
        return "payment"; // Redirects to the payment page where user enters payment details
    }
 
    @GetMapping("/payment-success")
    public String handlePaymentSuccess(@RequestParam("bookingId") int bookingId,
                                       @RequestParam("paymentMethod") String paymentMethod,
                                       @RequestParam("amount") double amount,
                                       Model model) {

 
        return "ticket"; // Redirects to the ticket page after successful payment
    }
}
 