package com.findshow.model;

public class DummyMovie {
	private Long id;
	private String name;
	private String genre;
	private String cast;
	private String description;
	private double rating;

	// Constructor
	public DummyMovie(Long id, String name, String genre, String cast, String description, double rating) {
        this.id = id;
        this.name = name;
        this.genre = genre;
        this.cast = cast;
        this.description = description;
        this.rating = rating;
    }

	// Getters and Setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}
}
