package com.findshow.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.findshow.model.Movie;
import com.findshow.model.Screen;
import com.findshow.model.Show;
import com.findshow.model.Theatre;



import com.findshow.model.Show;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShowRepository extends JpaRepository<Show, Integer> {
	List<Show> findAllByScreen_ScreenId(int screenId);
	List<Show> findAllByMovie_MovieId(int movieId);
	List<Show> findAllByMovie_MovieIdAndShowDate(int movieId,LocalDate showDate);

}
