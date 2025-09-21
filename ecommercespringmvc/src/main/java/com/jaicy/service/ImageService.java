package com.jaicy.service;

import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletResponse;

public interface ImageService {

	String storeImages(String name, MultipartFile file);

	void showProductImages(int id, HttpServletResponse response);
	
	void showLandingImages(String name, HttpServletResponse response);

}
