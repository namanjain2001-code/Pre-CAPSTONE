package com.findshow.repository;

import com.findshow.model.Screen;
import com.findshow.model.Theatre;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScreenRepository extends JpaRepository<Screen, Integer> {
    // You can add custom queries if needed. For example:
	List<Screen> findByTheatre(Theatre theatre);
    
}
