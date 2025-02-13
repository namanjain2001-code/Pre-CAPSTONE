package com.findshow.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.findshow.model.DummyMovie;
import com.findshow.model.Seat;

@Controller
@RequestMapping("/user")
public class HomePageController {

	@GetMapping("/")
	public String showHomePage(Model model) {
		List<DummyMovie> movies = Arrays.asList(
				new DummyMovie(1L, "Movie 1", "Action", "Actor 1, Actor 2", "This is an action-packed movie.", 4.5),
				new DummyMovie(2L, "Movie 2", "Comedy", "Actor 3, Actor 4", "A fun-filled comedy movie.", 3.8),
				new DummyMovie(3L, "Movie 3", "Drama", "Actor 5, Actor 6", "An emotional drama movie.", 4.2),
				new DummyMovie(4L, "Movie 4", "Horror", "Actor 7, Actor 8", "A spine-chilling horror movie.", 3.5),
				new DummyMovie(5L, "Movie 5", "Romance", "Actor 9, Actor 10", "A romantic love story.", 4.0));
		model.addAttribute("movies", movies);
		return "home";
	}

	@GetMapping("/movies/{id}")
	public String showMovieDetails(@PathVariable("id") Long id, Model model) {
		List<DummyMovie> movies = Arrays.asList(
				new DummyMovie(1L, "Movie 1", "Action", "Actor 1, Actor 2", "This is an action-packed movie.", 4.5),
				new DummyMovie(2L, "Movie 2", "Comedy", "Actor 3, Actor 4", "A fun-filled comedy movie.", 3.8),
				new DummyMovie(3L, "Movie 3", "Drama", "Actor 5, Actor 6", "An emotional drama movie.", 4.2),
				new DummyMovie(4L, "Movie 4", "Horror", "Actor 7, Actor 8", "A spine-chilling horror movie.", 3.5),
				new DummyMovie(5L, "Movie 5", "Romance", "Actor 9, Actor 10", "A romantic love story.", 4.0));

		Optional<DummyMovie> movie = movies.stream().filter(m -> m.getId().equals(id)).findFirst();
		if (movie.isPresent()) {
			model.addAttribute("movie", movie.get());
		}
		return "movieDetails";
	}

	@GetMapping("/showtimings/{movieId}")
	public String showShowtimes(@PathVariable Long movieId, @RequestParam(required = false) String showDate,
			Model model) {
		DummyMovie movie = getMovieById(movieId);
		List<Map<String, Object>> theaters = getTheatersForMovie(movieId, showDate);
		model.addAttribute("movie", movie);
		model.addAttribute("theaters", theaters);
		return "showtimings";
	}

	// Dummy method to get movie by id
	private DummyMovie getMovieById(Long id) {

		return new DummyMovie(id, "Movie 1", "Action", "Actor 1, Actor 2", "This is an action-packed movie.", 4.5);
	}

	// Dummy method to get theaters
	private List<Map<String, Object>> getTheatersForMovie(Long movieId, String showDate) {
		List<Map<String, Object>> theaters = new ArrayList<>();

		Map<String, Object> theater1 = new HashMap<>();
		theater1.put("name", "Theater 1");
		theater1.put("location", "Location 1");
		theater1.put("showtimes", Arrays.asList(createShowtime("10:00 AM", "IMAX"), createShowtime("2:00 PM", "IMAX"),
				createShowtime("6:00 PM", "Standard"), createShowtime("10:00 PM", "Standard")));
		theaters.add(theater1);

		Map<String, Object> theater2 = new HashMap<>();
		theater2.put("name", "Theater 2");
		theater2.put("location", "Location 2");
		theater2.put("showtimes",
				Arrays.asList(createShowtime("11:00 AM", "Standard"), createShowtime("3:00 PM", "IMAX"),
						createShowtime("7:00 PM", "Standard"), createShowtime("11:00 PM", "IMAX")));
		theaters.add(theater2);

		Map<String, Object> theater3 = new HashMap<>();
		theater3.put("name", "Theater 3");
		theater3.put("location", "Location 3");
		theater3.put("showtimes",
				Arrays.asList(createShowtime("12:00 PM", "IMAX"), createShowtime("4:00 PM", "Standard"),
						createShowtime("8:00 PM", "IMAX"), createShowtime("12:00 AM", "Standard")));
		theaters.add(theater3);

		Map<String, Object> theater4 = new HashMap<>();
		theater4.put("name", "Theater 4");
		theater4.put("location", "Location 4");
		theater4.put("showtimes",
				Arrays.asList(createShowtime("1:00 PM", "Standard"), createShowtime("5:00 PM", "IMAX"),
						createShowtime("9:00 PM", "Standard"), createShowtime("1:00 AM", "IMAX")));
		theaters.add(theater4);

		Map<String, Object> theater5 = new HashMap<>();
		theater5.put("name", "Theater 5");
		theater5.put("location", "Location 5");
		theater5.put("showtimes",
				Arrays.asList(createShowtime("2:00 PM", "IMAX"), createShowtime("6:00 PM", "Standard"),
						createShowtime("10:00 PM", "IMAX"), createShowtime("2:00 AM", "Standard")));
		theaters.add(theater5);

		return theaters;
	}

	private Map<String, String> createShowtime(String time, String screenType) {
		Map<String, String> showtime = new HashMap<>();
		showtime.put("time", time);
		showtime.put("screenType", screenType);
		return showtime;
	}

	// Dummy seat selection
//	@GetMapping("/seat-selection")
//    public String seatSelection(@RequestParam("theater") String theater,
//                                 @RequestParam("movie") String movie,
//                                 @RequestParam("showtime") String showtime,
//                                 @RequestParam("screenType") String screenType,
//                                 Model model) {
//        
//        model.addAttribute("theater", theater);
//        model.addAttribute("movie", movie);
//        model.addAttribute("showtime", showtime);
//        model.addAttribute("screenType", screenType);
//        return "seatSelection";
//    }

	@GetMapping("/seatSelection")
	public String getSeatSelectionPage(@RequestParam("theatreName") String theatreName,
			@RequestParam("screenNumber") int screenNumber, @RequestParam("showDate") String showDate,
			@RequestParam("showTime") String showTime, @RequestParam("movieName") String movieName, Model model) {

//		LocalDateTime showDate = LocalDateTime.parse(showDateStr); // Ensure you pass the correct date format
//		System.out.println(showDate);

		// Fetch the Show based on screen number, movie name, and show date
//		Show show = showService.getShowByScreenNumberAndMovieNameAndShowDate(screenNumber, movieName);

//		
//		if (show != null) {
//			// Generate the seat layout for the show’s screen
//			model.addAttribute("seatLayout", seatService.generateSeatLayout(show.getScreen()));
//
//			// Add the Show object to the model to display show details
//			model.addAttribute("show", show);
//		} else {
//			// If no show found, return an error or a suitable message
//			model.addAttribute("errorMessage", "Show not found for the given criteria.");
//		}
//
//		// Return the view name for the seat selection page
//		model.addAttribute("seatLayout",new ArrayList<ArrayList<Seat>>());
		List<List<Seat>> seatLayout = new ArrayList<>();

		// Example: Creating dummy data for rows and seats
		for (char row = 'A'; row <= 'F'; row++) { // 5 rows
			List<Seat> rows = new ArrayList<>();
			for (int j = 0; j < 10; j++) { // 10 seats per row
				Seat seat = new Seat();
				seat.setSeatNumber(row + String.valueOf(j + 1));
//                seat.setPrice(200 + (j * 10)); // Example price
//                seat.setType("Standard"); // You can customize this
				rows.add(seat);
			}
			seatLayout.add(rows);
		}

		model.addAttribute("seatLayout", seatLayout);
		return "seatSelection";
	}

}
