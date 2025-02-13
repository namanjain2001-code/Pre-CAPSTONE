package com.findshow.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.findshow.model.Theatre;

@Repository

public interface TheatreRepository extends JpaRepository<Theatre, Integer> {
    Theatre findByTheatreName(String theatreName);
}

