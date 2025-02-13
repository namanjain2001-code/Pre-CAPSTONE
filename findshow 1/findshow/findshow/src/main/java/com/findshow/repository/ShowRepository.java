package com.findshow.repository;

import java.time.LocalDateTime;
import java.util.List;

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
    // You can add custom queries if needed. For example:
    // List<Show> findByScreen(Screen screen);
    // List<Show> findByMovieId(Long movieId);

}
