package com.findshow.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.findshow.model.Seat;
import com.findshow.model.Screen;
import com.findshow.model.Seat.SeatType;
import com.findshow.repository.SeatRepository;
import com.findshow.repository.ShowRepository;
import com.findshow.repository.UserRepository;

@Service
public class SeatService {
	@Autowired
    private SeatRepository seatRepository;
	@Autowired
	private ShowRepository showRepository;
	@Autowired
	private UserRepository userRepository;

	// Generate seat layout for the given screen
    public List<List<Seat>> generateSeatLayout(int showId) {



        // Now organize seats into rows based on the `Screen`'s seats
        List<List<Seat>> seatLayout=new ArrayList();
        List<Seat> bookedSeats=seatRepository.findAllByShow_ShowId(showId);
        for (char row = 'A'; row <= 'F'; row++) { // Assuming the rows range from A to F
            List<Seat> seatRow = new ArrayList<>();
            for (int i = 1; i <= 10; i++) { // Assuming up to 10 seats per row (can be adjusted)
                // Check if there are seats available for this row and column
                String seatNumber = row + String.valueOf(i);
                Seat seat = new Seat();
                for(Seat booked:bookedSeats) {
                	if(seatNumber.equals(booked.getSeatNumber())) {
                		seat.setUser(booked.getUser());
                	}
                }
                seat.setSeatNumber(seatNumber);
                seat.setSeatType(SeatType.NORMAL);
                if (seat != null) {
                    seatRow.add(seat);
                }
            }
            seatLayout.add(seatRow);
        }

        return seatLayout;
    }
    @Transactional
	public void saveSeats(Seat seats) {
    	seatRepository.save(seats);
    }
   
}



