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

import com.findshow.dto.DateMovie;
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
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName();  
            Users user=userService.findByEmail(currentUserName);
            Notification notification=notificationService.loginNotification(user.getName());
            notification.setNotificationId((Integer) null);
            notification.setUser(user);
            notificationRepository.save(notification);
      }
		
		return "home";
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
        
        Map<String, Object> theatreData = new HashMap<>();
        // Process data for each show
        for (Show show : shows) {
            // Get the screen and theatre associated with this show
            Screen screen = screenRepository.findByScreenId(show.getScreen().getScreenId());
            Theatre theatre = theatreRepository.findByTheatreId(screen.getTheatre().getTheatreId());
            Movie movie = movieRepository.findByMovieId(show.getMovie().getMovieId());

            // Create a structure without object references


            Map<String, Object> movieDetails = new HashMap<>();
            movieDetails.put("movieId", movie.getMovieId());
            movieDetails.put("movieName", movie.getMovieName());
            movieDetails.put("movieDescription", movie.getMovieDescription());
            movieDetails.put("movieDuration", movie.getMovieDuration());
            movieDetails.put("movieRated", movie.getMovieRated());
            movieDetails.put("movieLanguages", movie.getMovieLanguages());
            movieDetails.put("movieGenres", movie.getMovieGenres());
            movieDetails.put("movieThumbnail", movie.getMovieThumbnail());
            movieDetails.put("movieType", movie.getMovieType());
            movieDetails.put("movieReleaseDate", movie.getMovieReleaseDate().toString());
            
            
            Map<String, Object> showDetails = new HashMap<>();
            showDetails.put("showId", show.getShowId());
            showDetails.put("showDate", show.getShowDate().toString());
            showDetails.put("showTime", show.getShowTime().toString());
            showDetails.put("movie", movieDetails);
            
            
            Map<String, Object> screenDetails = new HashMap<>();
            screenDetails.put("screenId", screen.getScreenId());
            screenDetails.put("screenNumber", screen.getScreenNumber());
            screenDetails.put("screenCapacity", screen.getScreenCapacity());
            screenDetails.put("screenType", screen.getScreenType());
            screenDetails.put("shows", Collections.singletonList(showDetails));

            Map<String, Object> theatreDetails = new HashMap<>();
            theatreDetails.put("theatreName", theatre.getTheatreName());
            theatreDetails.put("theatreLocation", theatre.getTheatreLocation());
            theatreDetails.put("noOfScreens", theatre.getNoOfScreens());
            theatreDetails.put("screens", Collections.singletonList(screenDetails));

            // Create the final response structure
            
            theatreData.put("theatre", theatreDetails);
        }
        model.addAttribute("allShows", theatreData);
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
