package com.findshow.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.findshow.model.Role;
import com.findshow.model.Role.RoleName;
import com.findshow.repository.RoleRepository;

@Service
public class RoleService {
	@Autowired
	private RoleRepository roleRepository;
	
	@Transactional
	public Role getRoleName(RoleName roleName) {
		
		String roleNameString = roleName.name();
		return roleRepository.findByRoleName(roleNameString);
	}
}
