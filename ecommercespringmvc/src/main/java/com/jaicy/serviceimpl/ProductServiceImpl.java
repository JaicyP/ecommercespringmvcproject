package com.jaicy.serviceimpl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jaicy.dao.CategoryRepository;
import com.jaicy.dao.ProductRepository;
import com.jaicy.dto.ProductDto;
import com.jaicy.entity.Category;
import com.jaicy.entity.Product;
import com.jaicy.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	 ProductRepository productRepository;
	
	@Autowired
	CategoryRepository categoryRepository;

	@Override
	public String createProduct(ProductDto productDto, MultipartFile image) {
		Product product=new Product();
		Category category=categoryRepository.findByName(productDto.getCategoryName());
		
		if (!image.isEmpty()) {
	        // basic validation
	        if (image.getSize() > 5 * 1024 * 1024) { // 5 MB limit example
	            throw new IllegalArgumentException("Image too large");
	        }
	        String ct = image.getContentType();
	        if (ct == null || !ct.startsWith("image/")) {
	            throw new IllegalArgumentException("Only image files are allowed");
	        }

	        try {
				product.setProdImage(image.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
	    
	    }
		product.setDescription(productDto.getDescription());
		product.setName(productDto.getName());
		product.setPrice(productDto.getPrice());
		product.setRatingAverage(productDto.getRatingAverage());
		product.setStockQuantity(productDto.getStockQuantity());
		product.setCategory(category);
		productRepository.save(product);
		return "sucess";
	}

	@Override
	public List<Product> AllProducts() {
		return productRepository.findAll();
	}

	@Override
	public Product getProductById(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public void deleteById(int id) {
		productRepository.deleteById(id);
	}

	@Override
	public Product updateProduct(int id, ProductDto productDto, MultipartFile image) {
		Category category=categoryRepository.findByName(productDto.getCategoryName());
         Product prod=productRepository.findById(id).get();
         prod.setName(productDto.getName());
         prod.setDescription(productDto.getDescription());
         prod.setPrice(productDto.getPrice());
         prod.setCategory(category);
         prod.setRatingAverage(productDto.getRatingAverage());
         prod.setStockQuantity(productDto.getStockQuantity());
         if (!image.isEmpty()) {
 	        // basic validation
 	        if (image.getSize() > 5 * 1024 * 1024) { // 5 MB limit example
 	            throw new IllegalArgumentException("Image too large");
 	        }
 	        String ct = image.getContentType();
 	        if (ct == null || !ct.startsWith("image/")) {
 	            throw new IllegalArgumentException("Only image files are allowed");
 	        }

 	        try {
 				prod.setProdImage(image.getBytes());
 			} catch (IOException e) {
 				e.printStackTrace();
 			}
 	    
 	    }else {
 	    	prod.setProdImage(prod.getProdImage());
 	    }
		 return productRepository.save(prod);
	}

}
