package com.findshow.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.findshow.model.Role;
import com.findshow.model.Role.RoleName;

@Repository
public interface RoleRepository extends JpaRepository<Role,Integer> {
	Role findByRoleName(String roleNameString);
}
