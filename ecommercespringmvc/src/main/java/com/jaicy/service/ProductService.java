package com.jaicy.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.jaicy.dto.ProductDto;
import com.jaicy.entity.Product;

public interface ProductService {

	public String createProduct(ProductDto productDto, MultipartFile file);
	
	public Product getProductById(int id);
	
	public List<Product> AllProducts();
	
	public void deleteById(int id);
	
	public Product updateProduct(int id,ProductDto productDto, MultipartFile file);

}
