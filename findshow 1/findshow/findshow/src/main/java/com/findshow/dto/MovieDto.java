package com.findshow.dto;

import java.time.LocalDate;
import java.util.List;

import com.findshow.model.Movie.MovieType;

public class MovieDto {
    private int movieId;
    private String movieName;
    private String movieDescription;
    private int movieDuration;
    private String movieRated;
    private String movieLanguages;
    private String movieGenres;
    public void setMovieLanguages(String movieLanguages) {
		this.movieLanguages = movieLanguages;
	}

	public void setMovieGenres(String movieGenres) {
		this.movieGenres = movieGenres;
	}

	private String movieThumbnail;
    private MovieType movieType;
    private LocalDate movieReleaseDate;

    // Default constructor
    public MovieDto() {}

    // Getters and setters for all fields
    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieDescription() {
        return movieDescription;
    }

    public void setMovieDescription(String movieDescription) {
        this.movieDescription = movieDescription;
    }

    public int getMovieDuration() {
        return movieDuration;
    }

    public void setMovieDuration(int movieDuration) {
        this.movieDuration = movieDuration;
    }

    public String getMovieRated() {
        return movieRated;
    }

    public void setMovieRated(String movieRated) {
        this.movieRated = movieRated;
    }


    public String getMovieThumbnail() {
        return movieThumbnail;
    }

    public void setMovieThumbnail(String movieThumbnail) {
        this.movieThumbnail = movieThumbnail;
    }

    public MovieType getMovieType() {
        return movieType;
    }

    public void setMovieType(MovieType movieType) {
        this.movieType = movieType;
    }

	public LocalDate getMovieReleaseDate() {
		return movieReleaseDate;
	}

	public void setMovieReleaseDate(LocalDate movieReleaseDate) {
		this.movieReleaseDate = movieReleaseDate;
	}

}
