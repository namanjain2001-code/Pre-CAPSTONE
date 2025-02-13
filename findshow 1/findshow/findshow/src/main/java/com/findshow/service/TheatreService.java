package com.findshow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.findshow.model.Theatre;
import com.findshow.repository.TheatreRepository;

@Service
public class TheatreService {
	@Autowired
	private TheatreRepository theatreRepository;

	@Autowired
	public TheatreService(TheatreRepository theatreRepository) {
		this.theatreRepository = theatreRepository;
	}

	@Transactional
	public void saveTheatre(Theatre theatre) {
		theatreRepository.save(theatre);
	}

	@Transactional
	public List<Theatre> listAllTheatres() {
		return theatreRepository.findAll();
	}

	public Theatre findByName(String theatreName) {
		return theatreRepository.findByTheatreName(theatreName);
	}

	public List<Theatre> findAll() {
		return theatreRepository.findAll();
	}

}
