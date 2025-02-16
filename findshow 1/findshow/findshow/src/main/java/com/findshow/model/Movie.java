package com.findshow.model;

import java.time.LocalDate;

import jakarta.persistence.*;

// Movie POJO class
@Entity
@Table(name = "movies")
public class Movie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "movie_id")
    private int movieId;

    

	@Column(name = "movie_name", nullable = false)
    private String movieName;

    @Column(name = "movie_description", nullable = false)
    private String movieDescription;

    @Column(name = "movie_duration", nullable = false)
    private int movieDuration;

    @Column(name = "movie_rated", nullable = false)
    private String movieRated;

    @Column(name = "movie_languages", nullable = false)
    private String movieLanguages;

    @Column(name = "movie_genres", nullable = false)
    private String movieGenres;

    @Column(name = "movie_thumbnail")
    private String movieThumbnail;

    @Enumerated(EnumType.STRING)
    @Column(name = "movie_type", nullable = false)
    private MovieType movieType;

    @Column(name = "movie_release_date", nullable = false)
    private LocalDate movieReleaseDate;

    public enum MovieType {
        IMAX, REGULAR
    }
    public Movie() {};

    public Movie(int movieId, String movieName, String movieDescription, int movieDuration, String movieRated,
			String movieLanguages, String movieGenres, String movieThumbnail, MovieType movieType,
			LocalDate movieReleaseDate) {
		super();
		this.movieId = movieId;
		this.movieName = movieName;
		this.movieDescription = movieDescription;
		this.movieDuration = movieDuration;
		this.movieRated = movieRated;
		this.movieLanguages = movieLanguages;
		this.movieGenres = movieGenres;
		this.movieThumbnail = movieThumbnail;
		this.movieType = movieType;
		this.movieReleaseDate = movieReleaseDate;
	}
	// Getters and Setters
    public int getMovieId(){
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

    public String getMovieLanguages() {
        return movieLanguages;
    }

    public void setMovieLanguages(String movieLanguages) {
        this.movieLanguages = movieLanguages;
    }

    public String getMovieGenres() {
        return movieGenres;
    }

    public void setMovieGenres(String movieGenres) {
        this.movieGenres = movieGenres;
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
