package com.jaicy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jaicy.entity.Category;
import com.jaicy.entity.Product;
import com.jaicy.service.CategoryService;
import com.jaicy.service.LandingService;
import com.jaicy.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/")
public class LandingController {
	
	@Autowired
	 LandingService landingService;
	 
	 @Autowired
	 ProductService productService;
	 
	 @Autowired
	 CategoryService categoryService;

	@GetMapping("")
	public String savingData(HttpServletRequest request,Model model) {
		List<Product> products=productService.AllProducts();
		List<Category> categories=categoryService.getAllCategory();
		model.addAttribute("products", products);
		model.addAttribute("categories",categories);
		HttpSession session=request.getSession();
		landingService.savingData(session);
		return "index";
	}
	

}
