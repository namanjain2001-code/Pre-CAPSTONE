package com.findshow.repository;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.findshow.model.Users;
@Repository
public interface UserRepository extends JpaRepository<Users,Integer>{
	Users findByEmail(String email);
	Users findByName(String name);

}
