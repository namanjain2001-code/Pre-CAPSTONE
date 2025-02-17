package com.findshow.dto;

import java.time.LocalDate;

public class DateMovie {
	
	private LocalDate date;
	private int movieId;
	public DateMovie(){};
	public DateMovie(int id, LocalDate date2) {
		// TODO Auto-generated constructor stub
		this.movieId=id;
		this.date=date2;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
}
