package com.findshow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.findshow.model.Booking;
import com.findshow.model.Movie;
import com.findshow.model.Screen;
import com.findshow.model.Show;
import com.findshow.model.Theatre;
import com.findshow.repository.BookingRepository;
import com.findshow.repository.MovieRepository;
import com.findshow.repository.ScreenRepository;
import com.findshow.repository.ShowRepository;
import com.findshow.repository.TheatreRepository;
import com.findshow.service.ScreenService;
import com.findshow.service.ShowService;
import com.findshow.service.UserService;

@Controller
@RequestMapping("/superadmin")
public class SuperAdminController {
	@Autowired
	private BookingRepository bookingService;
	@Autowired
	private ShowService showService;
	@Autowired
	private ScreenService screenService;
	 @Autowired
	    private MovieRepository movieRepository;
	 @Autowired
	 private ShowRepository showRepository;
	@RequestMapping("/dashboard")
	public String getUserdashboard() {
		return "sdashboard";
	}
    
    // Add a method to show all bookings in the dashboard
    @GetMapping("/bookings")
    public String getAllBookings(Model model) {
        // Fetch all bookings from the service
        model.addAttribute("bookings", bookingService.findAll());
        return "booking-list";  // Display bookings on the dashboard page
    }
    
    @Autowired
    private TheatreRepository theatreRepository;
	@Autowired
    private UserService userService;
	@Autowired
	private ScreenRepository screenRepository;

    // Show all theatres
    @GetMapping("/theatres")
    public String listTheatres( Model model ) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName();  
            int userId=userService.findByEmail(currentUserName).getUserId();

            model.addAttribute("currentUserId", userId);
            model.addAttribute("theatres", theatreRepository.findAll());
            }
        return "theatre-list";  // View name
    }

    // Add new theatre
    @RequestMapping("/theatre/add")
    public String showAddTheatreForm(Model model) {
    	 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
         
         if (authentication != null && authentication.isAuthenticated()) {
             String currentUserName = authentication.getName();  // This is the username (email or username based on your setup)
             int userId=userService.findByEmail(currentUserName).getUserId();

             model.addAttribute("currentUserId", userId);
             }
        model.addAttribute("theatre", new Theatre());
        return "theatre-add";  // View name
    }

    @PostMapping("/theatre/add")
    public String addTheatre(@ModelAttribute Theatre theatre) {
        theatreRepository.save(theatre);
        return "redirect:/admin/theatres";  // Redirect to theatre list after adding
    }

    // Edit theatre
    @GetMapping("/theatre/edit/{id}")
    public String showEditTheatreForm(@PathVariable("id") int id, Model model) {
 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
         
         if (authentication != null && authentication.isAuthenticated()) {
             String currentUserName = authentication.getName();  // This is the username (email or username based on your setup)
             int userId=userService.findByEmail(currentUserName).getUserId();

             model.addAttribute("currentUserId", userId);
             }
        model.addAttribute("theatre", theatreRepository.findById(id).orElse(null));
        return "theatre-edit";  // View name
    }

    @PostMapping("/theatre/edit/{id}")
    public String editTheatre(@PathVariable("id") int id, @ModelAttribute Theatre theatre) {
        theatre.setTheatreId(id);  // Update the theatre id before saving
        theatreRepository.save(theatre);
        return "redirect:/admin/theatres";  // Redirect to theatre list after editing
    }

    // Delete theatre
    @GetMapping("/theatre/delete/{id}")
    public String deletetheatre(@PathVariable("id") int id) {
        theatreRepository.deleteById(id);
        return "redirect:/admin/theatres";  // Redirect to theatre list after deletion
    }
    @GetMapping("/movies")
    public String listMovies(Model model) {
        model.addAttribute("movies", movieRepository.findAll());
        return "movie-list";
    }

    // Add new movie
    @GetMapping("/movie/add")
    public String showAddMovieForm(Model model) {
        model.addAttribute("movie", new Movie());
        return "movie-add";
    }

    @PostMapping("/movie/add")
    public String addMovie(@ModelAttribute Movie movie) {
    	System.out.println("Hellooo");
        movieRepository.save(movie);
        return "redirect:/admin/movies";
    }

    // Edit movie
    @GetMapping("/movie/edit/{id}")
    public String showEditMovieForm(@PathVariable("id") int id, Model model) {
        model.addAttribute("movie", movieRepository.findById(id).orElse(null));
        return "movie-edit";
    }

    @PostMapping("/movie/edit/{id}")
    public String editMovie(@PathVariable("id") int id, @ModelAttribute Movie movie) {
        movie.setMovieId(id);
        movieRepository.save(movie);
        return "redirect:/admin/movies";
    }

    // Delete movie
    @GetMapping("/movie/delete/{id}")
    public String deleteMovie(@PathVariable("id") int id) {
        movieRepository.deleteById(id);
        return "redirect:/admin/movies";
    }
    @GetMapping("/screens")
    public String listScreens(Model model) {
Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName(); 
            int userId=userService.findByEmail(currentUserName).getUserId();
            model.addAttribute("screens", screenService.getTheatresAndScreensByUserId(userId));
        }
        return "screen-list";  // View name
    }

    // Add new screen
    @GetMapping("/screen/add")
    public String showAddScreenForm(Model model) {
        model.addAttribute("screen", new Screen());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName(); 
            int userId=userService.findByEmail(currentUserName).getUserId();
            model.addAttribute("theaters", theatreRepository.findAll());
        }

        model.addAttribute("screenTypes",Screen.ScreenType.values());
        return "screen-add";  // View name
    }

    @PostMapping("/screen/add")
    @Transactional
    public String addScreen(@ModelAttribute Screen screen) {
        screenRepository.save(screen);
        return "redirect:/admin/screens";  // Redirect to screen list after adding
    }

    // Edit screen
    @GetMapping("/screen/edit/{id}")
    public String showEditScreenForm(@PathVariable("id") int id, Model model) {
        model.addAttribute("screen", screenRepository.findById(id).orElse(null));
Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName(); 
            int userId=userService.findByEmail(currentUserName).getUserId();
            model.addAttribute("theaters", theatreRepository.findAllByUser_userId(userId));
        }
        model.addAttribute("screenTypes",Screen.ScreenType.values());
        return "screen-edit";  // View name
    }

    @PostMapping("/screen/edit/{id}")
    public String editScreen(@PathVariable("id") int id, @ModelAttribute Screen screen) {
        screen.setScreenId(id);  // Update the screen id before saving
        screenRepository.save(screen);
        return "redirect:/admin/screens";  // Redirect to screen list after editing
    }

    // Delete screen
    @GetMapping("/screen/delete/{id}")
    public String deleteScreen(@PathVariable("id") int id) {
        screenRepository.deleteById(id);
        return "redirect:/admin/screens";  // Redirect to screen list after deletion
    }
    @GetMapping("/shows")
    public String listShows(Model model) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        if (authentication != null && authentication.isAuthenticated()) {
            String currentUserName = authentication.getName(); 
            int userId=userService.findByEmail(currentUserName).getUserId();
            
            System.out.print( showService.getShowsAndTheatresAndScreensByUserId(userId));
        }
        model.addAttribute("shows", showRepository.findAll());
        
        
        return "show-list";  // View name
    }

    // Add new show
    @GetMapping("/show/add")
    public String showAddShowForm(Model model) {
        model.addAttribute("show", new Show());
        model.addAttribute("screens", screenRepository.findAll());
        model.addAttribute("movies", movieRepository.findAll());
        return "show-add";  // View name
    }

    @PostMapping("/show/add")
    public String addShow(@ModelAttribute Show show) {
        showRepository.save(show);
        return "redirect:/admin/shows";  // Redirect to show list after adding
    }

    // Edit show
    @GetMapping("/show/edit/{id}")
    public String showEditShowForm(@PathVariable("id") int id, Model model) {
        model.addAttribute("show", showRepository.findById(id).orElse(null));
        model.addAttribute("screens", screenRepository.findAll());
        return "show-edit";  // View name
    }

    @PostMapping("/show/edit/{id}")
    public String editShow(@PathVariable("id") int id, @ModelAttribute Show show) {
        show.setShowId(id);  // Update the show id before saving
        showRepository.save(show);
        return "redirect:/admin/shows";  // Redirect to show list after editing
    }

    // Delete show
    @GetMapping("/show/delete/{id}")
    public String deleteShow(@PathVariable("id") int id) {
        showRepository.deleteById(id);
        return "redirect:/admin/shows";  // Redirect to show list after deletion
    }
}
