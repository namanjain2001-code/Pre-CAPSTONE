package com.findshow.repository;

import com.findshow.model.Seat;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SeatRepository extends JpaRepository<Seat, Integer> {

	List<Seat> findAllByShow_ShowId(int showId);

}
