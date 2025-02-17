package com.findshow.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.findshow.dto.DateMovie;
import com.findshow.dto.MovieDto;
import com.findshow.dto.ScreenDto;
import com.findshow.dto.ShowDto;
import com.findshow.dto.TheatreDto;
import com.findshow.model.Booking;
import com.findshow.model.Movie;
import com.findshow.model.Notification;

import com.findshow.model.Screen;
import com.findshow.model.Seat;
import com.findshow.model.Show;
import com.findshow.model.Theatre;
import com.findshow.model.Users;
import com.findshow.repository.MovieRepository;
import com.findshow.repository.NotificationRepository;
import com.findshow.repository.ScreenRepository;
import com.findshow.repository.SeatRepository;
import com.findshow.repository.ShowRepository;
import com.findshow.repository.TheatreRepository;

import com.findshow.service.NotificationService;
import com.findshow.service.UserService;

import com.findshow.service.SeatService;


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
	@Autowired

	private NotificationService notificationService;
	@Autowired
	private NotificationRepository notificationRepository;
	
	@Autowired
	private UserService userService;

	private SeatRepository seatRepository;
	@Autowired
	private SeatService seatService;


	@GetMapping("/")
	public String showHomePage(Model model) {
		model.addAttribute("movies",movieRepository.findAll());
		
		
		return "home";
	}
	@GetMapping("/searchMovie")
	public String showSearchMovie(@RequestParam("movieName") String movieName, RedirectAttributes redirectAttributes) {
	   
		if (movieName == null || movieName.trim().isEmpty()) {
	        redirectAttributes.addFlashAttribute("errorMessage", "Movie name cannot be empty");
	        return "redirect:/user/dashboard";
	    }
 
	    // Find the movie by its name
	    Movie movie = movieRepository.findByMovieName(movieName);
	    if (movie != null) {
	    	redirectAttributes.addFlashAttribute("movie", movie);
	    	System.out.print(movie);
	        return "redirect:/user/movies/" + movie.getMovieId();
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "Movie not found");
	        return "redirect:/user/dashboard";
	    }
	}

	@GetMapping("/movies/{id}")
	public String showMovieDetails(@PathVariable("id") int id, Model model) {
		model.addAttribute("movie", movieRepository.findByMovieId(id));
		model.addAttribute("dateMovie", new DateMovie());
		return "movieDetails";
		
	}
	
	@PostMapping("/showtimings/{id}")
	public String showMovieDetailss(@ModelAttribute("dateMovie") DateMovie dateMovie,@PathVariable("id") int id, Model model) {
		
		model.addAttribute("movie", movieRepository.findByMovieId(id));
		model.addAttribute("dateMovie", new DateMovie(id,dateMovie.getDate()));
Map<String, Object> response = new HashMap<>();
        
        // Parse the date

        // Fetch all shows for the specific movie and date
        List<Show> shows = showRepository.findAllByMovie_MovieIdAndShowDate(id, dateMovie.getDate());
        
        List<TheatreDto> theaterList = new ArrayList<>();

        for (Show show : shows) {
            Screen screen = screenRepository.findByScreenId(show.getScreen().getScreenId());
            Theatre theatre = theatreRepository.findByTheatreId(screen.getTheatre().getTheatreId());
            Movie movie = movieRepository.findByMovieId(show.getMovie().getMovieId());

            // Create movie
            MovieDto movieDetails = new MovieDto();
            movieDetails.setMovieName(movie.getMovieName());
            movieDetails.setMovieDescription(movie.getMovieDescription());
            movieDetails.setMovieDuration(movie.getMovieDuration());
            movieDetails.setMovieRated(movie.getMovieRated());
            movieDetails.setMovieLanguages(movie.getMovieLanguages());
            movieDetails.setMovieGenres(movie.getMovieGenres());
            movieDetails.setMovieThumbnail(movie.getMovieThumbnail());
            movieDetails.setMovieType(movie.getMovieType());
            movieDetails.setMovieReleaseDate(movie.getMovieReleaseDate());
            movieDetails.setMovieId(movie.getMovieId());
            
            // Create theater


            ScreenDto screenDetails = new ScreenDto();
            screenDetails.setScreenId(screen.getScreenId());
            screenDetails.setScreenNumber(screen.getScreenNumber());
            screenDetails.setScreenCapacity(screen.getScreenCapacity());
            screenDetails.setScreenType(screen.getScreenType());
            screenDetails.setTheatre(screen.getTheatre()); // Assuming the Screen has a Theatre object

           

            
            // Create show
            TheatreDto theater = new TheatreDto();
            theater.setTheatreName(theatre.getTheatreName());
            theater.setTheatreLocation(theatre.getTheatreLocation());
            theater.setNoOfScreens(theatre.getNoOfScreens());
            theater.setScreens(Collections.singletonList(screenDetails));
            
            ShowDto showDetails = new ShowDto();
            showDetails.setShowTime(show.getShowTime());
            showDetails.setShowDate(show.getShowDate());
            showDetails.setMovie(movieDetails);
            showDetails.setScreen(screenDetails);
            showDetails.setShowId(show.getShowId());

            // Create screen
            screenDetails.setShows(Collections.singletonList(showDetails));

            // Add the theater to the list
            theaterList.add(theater);
        }

        model.addAttribute("allShows", theaterList);

		return "showtimings";
		
	}

	@GetMapping("/showtimings/{movieId}")
	public String showShowtimes(@ModelAttribute("dateMovie") DateMovie dateMovie,@PathVariable int movieId,
			Model model) {
		List<Show> shows=showRepository.findAllByMovie_MovieId(movieId);
		
		model.addAttribute("theatres", theatreRepository.findAll());
		model.addAttribute("movie", movieRepository.findByMovieId(movieId));

		
		return "showtimings";
	}
	

	@GetMapping("/seatSelection")
	public String getSeatSelectionPage(@RequestParam("theater") String theaterName,
			@RequestParam("screen") int screenNumber, @RequestParam("show") int showId, Model model) {
		List<List<Seat>> seats=seatService.generateSeatLayout(showId);
		model.addAttribute("seatLayout",seats);
		model.addAttribute("theatreName",theaterName);
		model.addAttribute("screenNumber",screenNumber);
		
		model.addAttribute("show",showRepository.findByShowId(showId));
		model.addAttribute("seats", new Seat());


		
		return "seatSelection";
	}

	
	@GetMapping("/notifications")
    public String getNotifications(Model model) {
        
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName();  
            Users user=userService.findByEmail(currentUserName);
            
            List<Notification> notifications = notificationService.getNotificationsByUserId(user.getUserId());
            model.addAttribute("notifications", notifications);
            
            
      }
		
        
        
   

       
        return "notifications";  
    }

	@PostMapping("/seatSelection")
	public String submitSeats(@RequestParam("theater") String theaterName,
			@RequestParam("screen") int screenNumber, @RequestParam("show") int showId,@RequestParam("seats") String selectedSeats, Model model) {
		
		return "redirect:/booking-summary";
		
	}


}
