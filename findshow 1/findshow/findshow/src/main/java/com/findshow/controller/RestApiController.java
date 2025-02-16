package com.findshow.controller;



import java.time.LocalDate;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.findshow.model.Movie;
import com.findshow.model.Screen;
import com.findshow.model.Show;
import com.findshow.model.Theatre;
import com.findshow.repository.MovieRepository;
import com.findshow.repository.ScreenRepository;
import com.findshow.repository.ShowRepository;
import com.findshow.repository.TheatreRepository;

@RestController
public class RestApiController {
    
    @Autowired
    private MovieRepository movieRepository;
    
    @Autowired
    private ScreenRepository screenRepository;
    
    @Autowired
    private TheatreRepository theatreRepository;
    
    @Autowired
    private ShowRepository showRepository;

    @GetMapping("/user/showtimings/user/api/theatres")
    public Map<String, Object> sendData(@RequestParam("movieId") int movieId, @RequestParam("date") String date) {
        Map<String, Object> response = new HashMap<>();
        
        // Parse the date
        LocalDate localDate = LocalDate.parse(date);

        // Fetch all shows for the specific movie and date
        List<Show> shows = showRepository.findAllByMovie_MovieIdAndShowDate(movieId, localDate);
        
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
            Map<String, Object> theatreData = new HashMap<>();
            theatreData.put("theatre", theatreDetails);

            // Add data to the response map
            response.put(theatre.getTheatreId() + "", theatreData);
        }

        return response;
    }
}
