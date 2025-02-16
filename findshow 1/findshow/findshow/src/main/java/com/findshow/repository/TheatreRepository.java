package com.findshow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.findshow.model.Theatre;

@Repository

public interface TheatreRepository extends JpaRepository<Theatre, Integer> {
    Theatre findByTheatreName(String theatreName);

	List<Theatre> findAllByUser_userId(int userId);

	Theatre findByTheatreId(int theatreId);
}

