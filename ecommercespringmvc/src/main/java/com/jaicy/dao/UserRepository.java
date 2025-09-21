package com.jaicy.dao;

import org.springframework.data.jpa.repository.JpaRepository;


import com.jaicy.entity.User;


public interface UserRepository extends JpaRepository<User,Integer>{
	
	User findByEmail(String email);

}
