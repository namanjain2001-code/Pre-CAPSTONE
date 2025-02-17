package com.findshow.model;

import java.util.Set;

import jakarta.persistence.*;

@Entity
@Table(name = "seats")
public class Seat {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "seat_id")
	private int seatId;


    @Column(name = "seat_number")
    private String seatNumber;

    @Enumerated(EnumType.STRING)
    @Column(name = "seat_type")
    private SeatType seatType;


	public enum SeatType {
		NORMAL, SOFA, RECLINER
	}


    
    public void setSeatType(SeatType seatType) {
		this.seatType = seatType;
	}

	@ManyToOne
    @JoinColumn(name="user_id")
    private Users user;
    
    
	 @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name = "booking_id")
	    private Booking booking;

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	@ManyToOne
	@JoinColumn(name = "show_id", nullable = false)
	private Show show;

	// Getters and Setters
	public int getSeatId() {
		return seatId;
	}

	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}

	public String getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(String seatNumber) {
		this.seatNumber = seatNumber;
	}

	public SeatType getSeatType() {
		return seatType;
	}

	public Show getShow() {
		return show;
	}

	public void setShow(Show show) {
		this.show = show;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

   

}
