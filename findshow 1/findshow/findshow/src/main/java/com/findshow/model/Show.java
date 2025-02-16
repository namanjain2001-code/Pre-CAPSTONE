package com.findshow.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

// Show POJO class
@Entity
@Table(name = "shows")

public class Show {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "show_id")
    private int showId;

    @ManyToOne
    @JoinColumn(name = "screen_id", nullable = false)
    private Screen screen;

    @ManyToOne
    @JoinColumn(name = "movie_id", nullable = true)
    private Movie movie;

    @Column(name = "show_date", nullable = false)
    private LocalDate showDate; // You can use a `Date` type or `LocalDateTime` if needed
    
    @Column(name = "show_time", nullable = false)
    private LocalTime showTime; // You can use a `Date` type or `LocalDateTime` if needed

    public LocalTime getShowTime() {
		return showTime;
	}
    public Show(){};
	public Show(int showId, Screen screen, Movie movie, LocalDate showDate, LocalTime showTime) {
		super();
		this.showId = showId;
		this.screen = screen;
		this.movie = movie;
		this.showDate = showDate;
		this.showTime = showTime;
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

	// Getters and Setters
    public int getShowId() {
        return showId;
    }

    public void setShowId(int showId) {
        this.showId = showId;
    }

    public Screen getScreen() {
        return screen;
    }

    public void setScreen(Screen screen) {
        this.screen = screen;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }



}
