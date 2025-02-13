package com.findshow.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.findshow.model.Movie;
import com.findshow.model.Screen;
import com.findshow.model.Show;
import com.findshow.model.Theatre;



@Repository
public interface ShowRepository extends JpaRepository<Show, Integer> {

	 Show findByScreen_ScreenNumberAndMovie_MovieNameAndShowDate(int screenNumber, String movieName, LocalDateTime showDate);
    Show findByScreen_ScreenId(Screen screenNumber);
}
