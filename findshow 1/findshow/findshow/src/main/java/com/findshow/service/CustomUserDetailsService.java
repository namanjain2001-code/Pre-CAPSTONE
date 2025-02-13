package com.findshow.service;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.findshow.model.Users;
import com.findshow.repository.UserRepository;

/*@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // Retrieve the user from the repository
        Users user = userRepository.findByEmail(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        // Map the roles to authorities
        Set<GrantedAuthority> authorities = new HashSet();
        for(com.findshow.model.Role role:user.getRoles()) {
        	authorities.add(new SimpleGrantedAuthority(role.getRoleName().toString()));
        }

        // Return user details with roles and password
        return new User(user.getEmail(), user.getPasswordHash(), authorities);
    }
}*/
/*package com.findshow.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.findshow.model.Users;
import com.findshow.repository.UserRepository;*/

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // Retrieve user by email
        Users user = userRepository.findByEmail(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with email: " + username);
        }

        // Map roles to authorities
        Set<GrantedAuthority> authorities = new HashSet<>();
        for (com.findshow.model.Role role : user.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getRoleName().name()));  // Assuming RoleName is an enum
        }

        // Return user with authorities
        return new User(user.getEmail(), user.getPasswordHash(), authorities);
    }
}

