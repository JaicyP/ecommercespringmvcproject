package com.jaicy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jaicy.dto.UserDto;
import com.jaicy.entity.Address;
import com.jaicy.entity.Cart;
import com.jaicy.entity.User;
import com.jaicy.service.UserService;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/registerpage")
	public String testMapping() {
		return "register";
	}
	
	@PostMapping("/create")
	public String createUser(@ModelAttribute UserDto userDto,Model model) {
		userService.createUser(userDto);
		return "result";
		
	}
	
	


}
