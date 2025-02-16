package com.findshow.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.findshow.model.Screen;
import com.findshow.model.Show;
import com.findshow.model.Theatre;
import com.findshow.repository.MovieRepository;
import com.findshow.repository.ScreenRepository;
import com.findshow.repository.ShowRepository;
import com.findshow.repository.TheatreRepository;

@Controller
@RequestMapping("/user")
public class HomePageController {
	
	@Autowired
	private MovieRepository movieRepository;
	@Autowired
	private ScreenRepository screenRepository;
	@Autowired
	private TheatreRepository theatreRepository;
	@Autowired
	private ShowRepository showRepository;

	@GetMapping("/")
	public String showHomePage(Model model) {
		model.addAttribute("movies",movieRepository.findAll());
		return "home";
	}

	@GetMapping("/movies/{id}")
	public String showMovieDetails(@PathVariable("id") int id, Model model) {
		System.out.print(id);
		model.addAttribute("movie", movieRepository.findByMovieId(id));
		return "movieDetails";
	}

	@GetMapping("/showtimings/{movieId}")
	public String showShowtimes(@PathVariable int movieId, @RequestParam(required = false) String showDate,
			Model model) {
		List<Show> shows=showRepository.findAllByMovie_MovieId(movieId);
		
		model.addAttribute("theatres", theatreRepository.findAll());
		
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
