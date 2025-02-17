package com.findshow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.findshow.model.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking,Integer> {

	List<Booking> findAllBySeats_UserUserId(int userId);

	List<Booking> findAllBySeats_Show_Screen_Theatre_User_UserId(int userId);

}
