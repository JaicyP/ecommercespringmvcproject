package com.jaicy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jaicy.service.ImageService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/image")
public class ImageController {
	
	@Autowired
	ImageService imageService;
	
	@PostMapping(value = "/landingImages", consumes = {"multipart/form-data"})
	public String storeLandingImages(@RequestParam("name") String name,
			@RequestParam("image") MultipartFile file) {
		
		imageService.storeImages(name,file);
		return "result";
		
	}
	
	@GetMapping("/showproductimage")
	public void showProductImages(@RequestParam("id") int id, HttpServletResponse response) {
		imageService.showProductImages(id,response);
	}
	
	@GetMapping("/showimage")
	public void showLandingImages(@RequestParam("name") String name, HttpServletResponse response) {
		imageService.showLandingImages(name, response);
	}
	
	@GetMapping
	public String imagePage() {
		return "image";
	}

}
