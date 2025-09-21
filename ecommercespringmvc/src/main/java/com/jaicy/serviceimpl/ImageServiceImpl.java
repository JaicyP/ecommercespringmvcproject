package com.jaicy.serviceimpl;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jaicy.dao.ImageRepository;
import com.jaicy.dao.ProductRepository;
import com.jaicy.entity.LandingImage;
import com.jaicy.entity.Product;
import com.jaicy.service.ImageService;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;


@Service
public class ImageServiceImpl implements ImageService{
	
	@Autowired
	ImageRepository imageRepository;
	
	@Autowired
	ProductRepository productRepository;

	@Override
	public String storeImages(String name, MultipartFile file) {
		LandingImage image=new LandingImage();
		if (!file.isEmpty()) {
	        // basic validation
	        if (file.getSize() > 5 * 1024 * 1024) { // 5 MB limit example
	            throw new IllegalArgumentException("Image too large");
	        }
	        String ct = file.getContentType();
	        if (ct == null || !ct.startsWith("image/")) {
	            throw new IllegalArgumentException("Only image files are allowed");
	        }

	        try {
				image.setImages(file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
	    
	    }
		
		image.setName(name);
		imageRepository.save(image);
		
		return "sucess";
	}

	@Override
	public void showProductImages(int id,HttpServletResponse response) {
		
		Product product=productRepository.findById(id).get();
		byte[] imageData = product.getProdImage();

        response.setContentType("image/jpeg"); 
        response.setContentLength(imageData.length);

        try (ServletOutputStream out = response.getOutputStream()) {
            out.write(imageData);
            out.flush();
        } catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public void showLandingImages(String name,HttpServletResponse response) {
		
		byte[] imageData = getImageByName(name).getImages();
        response.setContentType("image/jpeg"); 
        response.setContentLength(imageData.length);
        try (ServletOutputStream out = response.getOutputStream()) {
            out.write(imageData);
            out.flush();
        } catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public LandingImage getImageByName(String name) {
		return imageRepository.findByName(name).get();
	}

}
