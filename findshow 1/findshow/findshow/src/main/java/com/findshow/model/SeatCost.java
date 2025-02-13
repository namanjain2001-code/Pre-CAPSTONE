//package com.findshow.model;
//
//import jakarta.persistence.*;
//
//import java.math.BigDecimal;
//import com.findshow.model.S;
//
//@Entity
//@Table(name = "seatcost")
//public class SeatCost {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private int seatcostId;
//
//    @Enumerated(EnumType.STRING)
//    @Column(name = "screen_type", nullable = false)
//    private ScreenType screen;
//
//    @Enumerated(EnumType.STRING)
//    @Column(name = "seat_type", nullable = false)
//    private Seat seat;
//
//    @Column(name = "cost", nullable = false)
//    private BigDecimal cost;
//
//    @Column(name = "reduced_cost")
//    private BigDecimal reducedCost;
//
//    @Column(name = "discounted_rows", nullable = false)
//    private int discountedRows;
//
//	public int getSeatcostId() {
//		return seatcostId;
//	}
//
//	public void setSeatcostId(int seatcostId) {
//		this.seatcostId = seatcostId;
//	}
//
//	public Screen getScreen() {
//		return screen;
//	}
//
//	public void setScreen(Screen screen) {
//		this.screen = screen;
//	}
//
//	public Seat getSeat() {
//		return seat;
//	}
//
//	public void setSeat(Seat seat) {
//		this.seat = seat;
//	}
//
//	public BigDecimal getCost() {
//		return cost;
//	}
//
//	public void setCost(BigDecimal cost) {
//		this.cost = cost;
//	}
//
//	public BigDecimal getReducedCost() {
//		return reducedCost;
//	}
//
//	public void setReducedCost(BigDecimal reducedCost) {
//		this.reducedCost = reducedCost;
//	}
//
//	public int getDiscountedRows() {
//		return discountedRows;
//	}
//
//	public void setDiscountedRows(int discountedRows) {
//		this.discountedRows = discountedRows;
//	}
//
//    }
//
