package com.findshow.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

// Booking POJO class
@Entity
@Table(name = "bookings")
public class Booking {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "booking_id")
	private int bookingId;


    @OneToMany
    @JoinColumn(name = "seat_id")
    private Set<Seat> seats;

    @Column(name = "booking_time", updatable = false)
    private LocalDateTime bookingTime;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private BookingStatus status;


	public enum BookingStatus {
		BOOKED, CANCELLED
	}

	
	// Getters and Setters
	public int getBookingId() {
		return bookingId;
	}


   


    public Set<Seat> getSeats() {
		return seats;
	}

	public void setSeats(Set<Seat> seats) {
		this.seats = seats;
	}


	public void setBookingTime(LocalDateTime bookingTime) {
		this.bookingTime = bookingTime;
	}

	public BookingStatus getStatus() {
		return status;
	}

	public void setStatus(BookingStatus status) {
		this.status = status;
	}

	
}
