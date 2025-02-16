package com.findshow.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.findshow.dto.UserDto;
//import com.findshow.service.ConnDb;
import com.findshow.model.Users;
import com.findshow.repository.UserRepository;

@Service
public class UserService{
	private final UserRepository userRepository;
	@Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
	@Transactional
	public void saveUser(Users user) {
		userRepository.save(user);
	}
	@Transactional
	public Users findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	@Transactional
	public Users findByUsername(String name){
		return userRepository.findByName(name);
	}
	@Transactional
	public List<UserDto> findAllUsers() {
		
		List<Users>users=userRepository.findAll();
		List<UserDto> usersDtoLists=new ArrayList<>();
		for (Users user : users) {
            UserDto userDTO = new UserDto();
            userDTO.setName(user.getName());
            userDTO.setEmail(user.getEmail());
            userDTO.setPhone(user.getPhone());
            usersDtoLists.add(userDTO);
        }
		return  usersDtoLists;
	}
	
	
	
	
}