package com.findshow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.findshow.model.Movie;
import com.findshow.repository.MovieRepository;

@Service
public class MovieService {

    @Autowired
    private MovieRepository movieRepository;

    public Movie findByMovieName(String movieName) {
        return movieRepository.findByMovieName(movieName);
    }

    public List<Movie> findAll() {
        return movieRepository.findAll();
    }
	public Movie getmovie(int movieId) {
		return movieRepository.findByMovieId(movieId);
	}
}

