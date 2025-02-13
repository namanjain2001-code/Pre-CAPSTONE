package com.findshow.model;
import com.findshow.model.Screen.ScreenType;
import com.findshow.model.Seat.SeatType;

import jakarta.persistence.*;

@Entity
@Table(name = "seatcost")
public class SeatCost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "seatcost_id")
    private int seatCostId;

    @Enumerated(EnumType.STRING)
    @Column(name = "screen_type")
    private ScreenType screenType;


    @Enumerated(EnumType.STRING)
    @Column(name = "seat_type")
    private SeatType seatType;

    @Column(name = "cost", columnDefinition = "DECIMAL(10,2)")
    private double cost;  // Regular cost of the seat

    @Column(name = "reduced_cost", columnDefinition = "DECIMAL(10,2)")
    private double reducedCost;  // Discounted price for the last rows

    @Column(name = "discounted_rows")
    private int discountedRows;

    // Default constructor
    public SeatCost() {}

    // Constructor to initialize all fields
    public SeatCost(int seatCostId, ScreenType screenType, SeatType seatType, double cost, double reducedCost, int discountedRows) {
        this.seatCostId = seatCostId;
        this.screenType = screenType;
        this.seatType = seatType;
        this.cost = cost;
        this.reducedCost = reducedCost;
        this.discountedRows = discountedRows;
    }

    // Getters and Setters
    public int getSeatCostId() {
        return seatCostId;
    }

    public void setSeatCostId(int seatCostId) {
        this.seatCostId = seatCostId;
    }

    public ScreenType getScreenType() {
        return screenType;
    }

    public void setScreenType(ScreenType screenType) {
        this.screenType = screenType;
    }

    public SeatType getSeatType() {
        return seatType;
    }

    public void setSeatType(SeatType seatType) {
        this.seatType = seatType;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public double getReducedCost() {
        return reducedCost;
    }

    public void setReducedCost(double reducedCost) {
        this.reducedCost = reducedCost;
    }

    public int getDiscountedRows() {
        return discountedRows;
    }

    public void setDiscountedRows(int discountedRows) {
        this.discountedRows = discountedRows;
    }

    @Override
    public String toString() {
        return "SeatCost{" +
                "seatCostId=" + seatCostId +
                ", screenType=" + screenType +
                ", seatType=" + seatType +
                ", cost=" + cost +
                ", reducedCost=" + reducedCost +
                ", discountedRows=" + discountedRows +
                '}';
    }
}
