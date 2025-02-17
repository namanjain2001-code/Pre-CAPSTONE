package com.findshow.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class ShowDto {
    private LocalTime showTime;  // Store the show time (using LocalDateTime for precise time handling)
    private LocalDate showDate;        // The date of the show (can be String or LocalDate depending on your needs)
    private MovieDto movie;         // DTO to store movie details
    private ScreenDto screen;       // DTO to store screen details
    private int showId;

    public int getShowId() {
		return showId;
	}

	public void setShowId(int showId) {
		this.showId = showId;
	}

	// Default constructor
    public ShowDto() {}

	public ShowDto(LocalTime showTime, LocalDate showDate, MovieDto movie, ScreenDto screen) {
		super();
		this.showTime = showTime;
		this.showDate = showDate;
		this.movie = movie;
		this.screen = screen;
	}

	public LocalTime getShowTime() {
		return showTime;
	}

	public void setShowTime(LocalTime showTime) {
		this.showTime = showTime;
	}

	public LocalDate getShowDate() {
		return showDate;
	}

	public void setShowDate(LocalDate showDate) {
		this.showDate = showDate;
	}

	public MovieDto getMovie() {
		return movie;
	}

	public void setMovie(MovieDto movie) {
		this.movie = movie;
	}

	public ScreenDto getScreen() {
		return screen;
	}

	public void setScreen(ScreenDto screen) {
		this.screen = screen;
	}

    // Constructor with all fields
    
}
