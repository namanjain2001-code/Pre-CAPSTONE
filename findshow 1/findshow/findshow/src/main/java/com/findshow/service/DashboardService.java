package com.findshow.service;

import com.findshow.model.Booking;
import com.findshow.repository.DashboardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import java.util.List;
@Service
public class DashboardService {
	
	    @Autowired
	    private DashboardRepository bookingRepository;
	 
	    // Fetch all bookings
	    public List<Booking> getAllBookings() {
	        return bookingRepository.findAll();
	    }
	}

