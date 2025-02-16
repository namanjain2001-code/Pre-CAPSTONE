package com.findshow.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.findshow.model.Screen;
import com.findshow.model.Theatre;
import com.findshow.repository.ScreenRepository;
import com.findshow.repository.TheatreRepository;

@Service
public class ScreenService {
	@Autowired
    private TheatreRepository theatreRepository;

    @Autowired
    private ScreenRepository screenRepository;
    @Transactional
    public Map<Theatre, List<Screen>> getTheatresAndScreensByUserId(int userId) {
        List<Theatre> theatres = theatreRepository.findAllByUser_userId(userId);

        Map<Theatre, List<Screen>> theatreScreenMap = new HashMap<>();

        for (Theatre theatre : theatres) {
            List<Screen> screens = screenRepository.findAllByTheatre_TheatreId(theatre.getTheatreId());
            theatreScreenMap.put(theatre, screens);
        }

        return theatreScreenMap;
    }
}
