package com.findshow.repository;

import com.findshow.model.Seat;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SeatRepository extends JpaRepository<Seat, Integer> {
    List<Seat> findAllByScreen_ScreenIdAndShow_ShowId(int screenId, int showId);
//    List<Seat> findAllBySeatId(List<Integer> seatId);
}
