package com.jaicy.service;



import java.util.List;

import org.springframework.ui.Model;

import com.jaicy.dto.UserDto;
import com.jaicy.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



public interface UserService {
	
	String createUser(UserDto userDto);
	
	List<String> usersList();

	User getUserByEmail(String email);
	
	String loginUser(String email,String password, Model model, HttpSession session);

}
