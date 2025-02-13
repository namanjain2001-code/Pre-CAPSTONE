package com.findshow.repository;

import com.findshow.model.Show;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShowRepository extends JpaRepository<Show, Integer> {
    // You can add custom queries if needed. For example:
    // List<Show> findByScreen(Screen screen);
    // List<Show> findByMovieId(Long movieId);
}
