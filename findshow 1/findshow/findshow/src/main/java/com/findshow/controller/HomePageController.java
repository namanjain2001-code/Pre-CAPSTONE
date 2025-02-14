package com.findshow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class HomePageController {

	@GetMapping("/")
	public String showHomePage(Model model) {
		return "home";
	}

	@GetMapping("/movies/{id}")
	public String showMovieDetails(@PathVariable("id") Long id, Model model) {

		return "movieDetails";
	}

	@GetMapping("/showtimings/{movieId}")
	public String showShowtimes(@PathVariable Long movieId, @RequestParam(required = false) String showDate,
			Model model) {
		
		return "showtimings";
	}



	

	@GetMapping("/seatSelection")
	public String getSeatSelectionPage(@RequestParam("theatreName") String theatreName,
			@RequestParam("screenNumber") int screenNumber, @RequestParam("showDate") String showDate,
			@RequestParam("showTime") String showTime, @RequestParam("movieName") String movieName, Model model) {

//		
		return "seatSelection";
	}

}
