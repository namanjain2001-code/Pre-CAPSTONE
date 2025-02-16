package com.findshow.controller;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.findshow.model.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking,Integer> {

}
