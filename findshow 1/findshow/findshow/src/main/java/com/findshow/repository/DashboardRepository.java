package com.findshow.repository;
import com.findshow.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
	@Repository
	public interface DashboardRepository extends JpaRepository<Booking, Integer> {
	    // Add any custom query methods if necessary
	}

