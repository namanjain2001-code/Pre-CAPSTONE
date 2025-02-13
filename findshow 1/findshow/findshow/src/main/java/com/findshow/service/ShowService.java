package com.findshow.service;

import com.findshow.model.Show;
import com.findshow.model.Screen;
import com.findshow.repository.ShowRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class ShowService {

    @Autowired
    private ShowRepository showRepository;

    // Fetch show by screen number, movie name, and show date
   
}
