//package com.findshow.controller;
//
//import java.time.LocalDate;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.findshow.model.Movie;
//import com.findshow.model.Screen;
//import com.findshow.model.Show;
//import com.findshow.model.Theatre;
//import com.findshow.repository.MovieRepository;
//import com.findshow.repository.ScreenRepository;
//import com.findshow.repository.ShowRepository;
//import com.findshow.repository.TheatreRepository;
//
//
//@RestController
//public class RestApiController {
//	@Autowired
//	private MovieRepository movieRepository;
//	@Autowired
//	private ScreenRepository screenRepository;
//	@Autowired
//	private TheatreRepository theatreRepository;
//	@Autowired
//	private ShowRepository showRepository;
//	@GetMapping("/user/showtimings/user/api/theatres")
//	public Map<Integer, Map<Theatre, Map<Screen, List<Show>>>> sendData(@RequestParam("movieId") int movieId, @RequestParam("date") String date) {
//
//	    LocalDate localDate = LocalDate.parse(date);
//	    Map<Integer, Map<Theatre, Map<Screen, List<Show>>>> data = new HashMap<>();
//
//	    // Fetch all shows for the specific movie and date
//	    List<Show> shows = showRepository.findAllByMovie_MovieIdAndShowDate(movieId, localDate);
//
//	    // Iterate through all the shows
//	    for (Show show : shows) {
//	        Screen screen = screenRepository.findByScreenId(show.getScreen().getScreenId());
//	        Theatre theatre = theatreRepository.findByTheatreId(screen.getTheatre().getTheatreId());
//	        Movie movie = movieRepository.findByMovieId(show.getMovie().getMovieId());
//	        
//	        
//	        // Create show details (Show)
//	        Show showDetails = new Show(
//	                show.getShowId(),
//	                screen.getScreenType()
//	                show.getShowDate(),
//	                show.getShowTime(),
//	                screen.getScreenNumber(),
//	        );
//	        Movie movie=new Movie() {
//	        	
//	        };
//
//	        // Create Theatre and Screen
//	        Theatre Theatre = new Theatre(theatre.getTheatreName(), theatre.getTheatreLocation(),theatre.getNoOfScreens(),theatre.ge);
//	        Screen Screen = new Screen(
//	                screen.getScreenId(),
//	                screen.getScreenNumber(),
//	                screen.getScreenCapacity(),
//	                screen.getScreenType().toString()
//	        );
//
//	        // Insert show into data structure
//	        data.computeIfAbsent(movieId, k -> new HashMap<>())
//	            .computeIfAbsent(Theatre, k -> new HashMap<>())
//	            .computeIfAbsent(Screen, k -> new ArrayList<>())
//	            .add(showDetails);
//	    }
//
//	    return data;
//	}
//
//
//}
