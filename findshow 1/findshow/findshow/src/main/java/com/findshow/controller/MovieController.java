package com.findshow.controller;
import com.findshow.model.Movie;
import com.findshow.repository.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class MovieController {

    @Autowired
    private MovieRepository theatreRepository;

    // Show all movies
    @GetMapping("/movies")
    public String listMovies(Model model) {
        model.addAttribute("movies", theatreRepository.findAll());
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
        theatreRepository.save(movie);
        return "redirect:/admin/movies";
    }

    // Edit movie
    @GetMapping("/movie/edit/{id}")
    public String showEditMovieForm(@PathVariable("id") int id, Model model) {
        model.addAttribute("movie", theatreRepository.findById(id).orElse(null));
        return "movie-edit";
    }

    @PostMapping("/movie/edit/{id}")
    public String editMovie(@PathVariable("id") int id, @ModelAttribute Movie movie) {
        movie.setMovieId(id);
        theatreRepository.save(movie);
        return "redirect:/admin/movies";
    }

    // Delete movie
    @GetMapping("/movie/delete/{id}")
    public String deleteMovie(@PathVariable("id") int id) {
        theatreRepository.deleteById(id);
        return "redirect:/admin/movies";
    }
}


