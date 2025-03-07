package com.findshow.controller;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.findshow.model.Booking;
import com.findshow.model.Seat;
import com.findshow.model.Seat.SeatType;
import com.findshow.model.Show;
import com.findshow.model.Users;
import com.findshow.repository.BookingRepository;
import com.findshow.repository.DashboardRepository;
import com.findshow.repository.SeatRepository;
import com.findshow.repository.ShowRepository;
import com.findshow.repository.UserRepository;
import com.findshow.service.SeatService;
import com.findshow.service.UserService;

import jakarta.servlet.http.HttpSession;

 
@Controller
public class BookingController {
 
    @Autowired
    private ShowRepository showRepository;
    @Autowired
    private SeatRepository seatRepository;
    @Autowired
    private SeatService seatService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private UserService userService;
    
  
    
    @PostMapping("/user/booking-summary")
    public String submitBookingSummary(@ModelAttribute("seats") Seat seatDetails,@Param("amount")int amount,Model model
    		,HttpSession session) {
Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName();  
            Users user=userService.findByEmail(currentUserName);

            

    		String[] seatArray = seatDetails.getSeatNumber().split(",");
    		List<Seat> persistedSeats = new ArrayList<>();

    		// Convert the array to a list
    		Show show=showRepository.findByShowId(seatDetails.getShow().getShowId());
    		List<String> seatNumberList = Arrays.asList(seatArray);
    		
    		for (String seat : seatNumberList) {
    		    // Create a new Seat object for each iteration
    		    Seat newSeat = new Seat();

    		    // Set the properties for the new seat
    		    newSeat.setSeatNumber(seat);  // Set the seat number
    		    newSeat.setSeatType(SeatType.NORMAL);  // Set the seat type (assuming it’s NORMAL)
    		    newSeat.setShow(show);  // Set the show (already fetched in your code)
    		    newSeat.setUser(user);  // Set the user (from the logged-in user)

    		    // Add the new seat to the persistedSeats list
    		    persistedSeats.add(newSeat);
    		}
    		String seatNumbersall="";
    		for(Seat seat:persistedSeats) {
    			seatNumbersall+=seat.getSeatNumber()+",";
    		}
    		System.out.println(seatNumbersall);

    		session.setAttribute("persistedSeats", persistedSeats);
    		model.addAttribute("persistedSeats", persistedSeats);
    		model.addAttribute("seatNumbers", seatNumbersall.substring(0, seatNumbersall.length()-1));
    		model.addAttribute("movieName",show.getMovie().getMovieName());
    		model.addAttribute("theatreName",show.getScreen().getTheatre().getTheatreName() );
    		model.addAttribute("show", show);
    		model.addAttribute("amount", amount);
        }
        return "booking-summary"; // This refers to booking-summary.jsp
    		
    }
 
    @PostMapping("/user/payment")
    public String getpayment(Model model,@Param("amount")int amount) {
    	int  x = 100;
    	model.addAttribute("amount",amount);
    	return "payment";
    }
    
    
    @PostMapping("/user/ticket")
    @Transactional
    public String proceedToPayment( Model model, HttpSession session,@Param("amount")int amount) {
    	List<Seat> persistedSeats = (List<Seat>) session.getAttribute("persistedSeats");
Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName();  
            Users user=userService.findByEmail(currentUserName);
            model.addAttribute("customerName", user.getName());
            }
        if (persistedSeats != null) {
            model.addAttribute("persistedSeats", persistedSeats);
            // Add additional details (like customer name, etc.)
            Booking booking = new Booking();
            booking.setBookingTime(LocalDateTime.now());
            booking.setStatus(Booking.BookingStatus.BOOKED);
            Set<Seat> seatsB=new HashSet();
            for(Seat seats:persistedSeats) {
            	seats.setBooking(booking);
            	seatsB.add(seats);
            }
            String seatNumbersall="";
    		for(Seat seat:persistedSeats) {
    			seatNumbersall+=seat.getSeatNumber()+",";
    		}
    		Show show=showRepository.findByShowId(persistedSeats.get(0).getShow().getShowId());
    		model.addAttribute("seatNumbers", seatNumbersall.substring(0, seatNumbersall.length()-1));
    		model.addAttribute("movieName",show.getMovie().getMovieName());
    		model.addAttribute("theatreName",show.getScreen().getTheatre().getTheatreName() );
    		model.addAttribute("show", show);
    		model.addAttribute("amount",amount);
            bookingRepository.save(booking);
            seatRepository.saveAll(seatsB);
        }
        return "ticket"; // Redirects to the payment page where user enters payment details
    }
 
    
}
 