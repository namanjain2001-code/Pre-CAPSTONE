//package com.findshow.service;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.stereotype.Service;
//
//import com.findshow.model.Seat;
//import com.findshow.model.Screen;
//import com.findshow.model.Seat.SeatType;
//
//@Service
//public class SeatService {
//
//    // Generate seat layout for the given screen
//    public List<List<Seat>> generateSeatLayout(Screen screen) {
//        List<List<Seat>> layout = new ArrayList<>();
//
//        // Set the price based on the seat type
//        for (Seat seat : screen.getSeats()) {
//            int price;
//            switch (seat.getSeatType()) {
//                case NORMAL:
//                    price = 200;
//                    break;
//                case SOFA:
//                    price = 500;
//                    break;
//                case RECLINER:
//                    price = 800;
//                    break;
//                default:
//                    price = 200;  // Default to NORMAL if something goes wrong
//            }
//
//            // Set the price for each seat dynamically
//            seat.setSeatCost(price);
//        }
//
//        // Now organize seats into rows based on the `Screen`'s seats
//        List<List<Seat>> seatLayout=new ArrayList();
//        for (char row = 'A'; row <= 'F'; row++) { // Assuming the rows range from A to F
//            List<Seat> seatRow = new ArrayList<>();
//            for (int i = 1; i <= 10; i++) { // Assuming up to 10 seats per row (can be adjusted)
//                // Check if there are seats available for this row and column
//                String seatNumber = row + String.valueOf(i);
//                Seat seat = findSeatInScreen(screen, seatNumber);
//                if (seat != null) {
//                    seatRow.add(seat);
//                }
//            }
//            seatLayout.add(seatRow);
//        }
//
//        return layout;
//    }
//
//    // Helper method to find a seat by seat number
//    private Seat findSeatInScreen(Screen screen, String seatNumber) {
//        for (Seat seat : screen.getSeats()) {
//            if (seat.getSeatNumber().equals(seatNumber)) {
//                return seat;
//            }
//        }
//        return null; // Seat not found
//    }
//}



