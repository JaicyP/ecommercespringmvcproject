package com.jaicy.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jaicy.dto.UserDto;
import com.jaicy.entity.Address;
import com.jaicy.entity.Category;
import com.jaicy.entity.Product;
import com.jaicy.service.CategoryService;
import com.jaicy.service.ProductService;
import com.jaicy.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/registerpage")
	public String testMapping() {
		return "register";
	}
	
	@GetMapping("/loginpage")
	public String loginPage() {
		return "login";
	}
	
	@GetMapping("/userdashboard")
	public String userDashboard(Model model) {
		List<Product> products=productService.AllProducts();
		List<Category> categories=categoryService.getAllCategory();
		model.addAttribute("categories", categories);
		model.addAttribute("products", products);
		return "userdashboard";
	}
	
	@GetMapping("/admindashboard")
	public String adminDashboard(Model model) {
		List<Product> products=productService.AllProducts();
		List<Category> categories=categoryService.getAllCategory();
		model.addAttribute("categories", categories);
		model.addAttribute("products", products);
		return "admindashboard";
	}
	
	@PostMapping("/create")
	public String createUser(@ModelAttribute UserDto userDto,
			@ModelAttribute Address address,Model model) {
		userDto.setAddress(address);
		System.out.println("after service");
		userService.createUser(userDto);
		System.out.println("before service");
		model.addAttribute("sucess","Registered sucessfully. Login to get unlimited services");
		return "login";
	}
	
	
	@PostMapping("/login")
	public String loginUser(@RequestParam("user") String email,
			@RequestParam("pass") String password,Model model, HttpServletRequest req) {
		HttpSession session=req.getSession();
		return userService.loginUser(email, password, model,session);	
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session,Model model) {
		if(session!=null) {
			session.invalidate();
		}
		List<Product> products=productService.AllProducts();
		List<Category> categories=categoryService.getAllCategory();
		model.addAttribute("categories", categories);
		model.addAttribute("products", products);
		return "index";
	}
	

	
	


}
