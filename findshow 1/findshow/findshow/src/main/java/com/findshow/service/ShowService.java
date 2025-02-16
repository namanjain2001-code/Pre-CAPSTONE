package com.findshow.service;

import com.findshow.model.Show;
import com.findshow.model.Theatre;
import com.findshow.model.Screen;
import com.findshow.repository.ShowRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShowService {

    @Autowired
    private ShowRepository showRepository;
    
    @Autowired
    private ScreenService screenService;
    
    @Transactional
    public Map<Screen, List<Show>> getShowsAndTheatresAndScreensByUserId(int userId) {
        // Step 1: Retrieve theatres and their associated screens using the method you already have
        Map<Theatre, List<Screen>> theatreScreenMap = screenService.getTheatresAndScreensByUserId(userId);

        // Step 2: Create a map to hold the Screen as key and a list of Shows as value
        Map<Screen, List<Show>> screenShowsMap = new HashMap<>();

        // Step 3: Iterate through each theatre and its screens
        for (Map.Entry<Theatre, List<Screen>> entry : theatreScreenMap.entrySet()) {
            List<Screen> screens = entry.getValue();  // Screens from each theatre

            // For each screen, retrieve the associated shows
            for (Screen screen : screens) {
                // Fetch the shows associated with this screen
                List<Show> shows = showRepository.findAllByScreen_ScreenId(screen.getScreenId());

                // Put the screen and its shows into the map
                screenShowsMap.put(screen, shows);
            }
        }

        // Return the map where each screen is associated with its list of shows
        return screenShowsMap;
    }
   
}
