package com.jaicy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jaicy.dto.ProductDto;
import com.jaicy.entity.Product;
import com.jaicy.service.ProductService;

import jakarta.servlet.annotation.MultipartConfig;


@Controller
@RequestMapping("/product")
@MultipartConfig
public class ProductController {
	
	@Autowired
	 ProductService productService;
	
	@GetMapping("/registerproduct")
	public String registerPage() {
		return "product";
	}
	
	@PostMapping(value = "/create", consumes = {"multipart/form-data"})
	public String createProduct(
			@RequestParam("categoryName") String cat, 
			@RequestParam("name") String nam, 
			@RequestParam("description") String des, 
			@RequestParam("price") double pri, 
			@RequestParam("stockQuantity") int stock, 
			@RequestParam("ratingAverage") float rat , 
			@RequestParam("image") MultipartFile file,
			Model model) {
		
		ProductDto productDto=new ProductDto();
		     productDto.setCategoryName(cat);
		     productDto.setName(nam);
		     productDto.setDescription(des);
		     productDto.setPrice(pri);
		     productDto.setStockQuantity(stock);
		     productDto.setRatingAverage(rat);
		     System.out.println(productDto);
	         productService.createProduct(productDto,file);
	         List<Product> products=productService.AllProducts();
	         model.addAttribute("products", products);
		     return "displayProduct";
	
	}
	
	@PostMapping(value = "/update", consumes = {"multipart/form-data"})
	public String updateProduct(@RequestParam("id") int id,
			@RequestParam("categoryName") String cat, 
			@RequestParam("name") String nam, 
			@RequestParam("description") String des, 
			@RequestParam("price") double pri, 
			@RequestParam("stockQuantity") int stock, 
			@RequestParam("ratingAverage") float rat , 
			@RequestParam("image") MultipartFile file,
			Model model) {
		System.out.println(cat);
		ProductDto productDto=new ProductDto();
	     productDto.setCategoryName(cat);
	     productDto.setName(nam);
	     productDto.setDescription(des);
	     productDto.setPrice(pri);
	     productDto.setStockQuantity(stock);
	     productDto.setRatingAverage(rat);
		Product prod= productService.updateProduct(id, productDto,file);
		System.out.println(prod);
		model.addAttribute("products", prod);
	    return "displaySingleProduct";
	}
	
	
	@GetMapping("/all")
	public String getAllProducts(Model model){
		List<Product> products= productService.AllProducts();
		model.addAttribute("products", products);
		return "displayProduct";
	}
	
	@GetMapping("/singleproduct")
	public String getProductById(@RequestParam("id") int id,Model model) {
		Product product=productService.getProductById(id);
		model.addAttribute("products", product);
		return "displaySingleProduct";
	}
	
	@GetMapping("/updateproductpage")
	public String updateProductPage(@RequestParam("id") int id,Model model) {
		Product product=productService.getProductById(id);
		model.addAttribute("product", product);
		return "updateProduct";
	}
	
	@GetMapping("/removeproduct")
	public String deleteProduct(@RequestParam("id") int id,Model model) {
		   List<Product> products= productService.AllProducts();
		   model.addAttribute("products", products);
		     productService.deleteById(id);
		     return "displayProduct";
	}
	
	@GetMapping("/productDescription")
	public String productDescriptionPage(@RequestParam("id") int id,Model model) {
		Product product=productService.getProductById(id);
		model.addAttribute("product", product);
		return "prodDescri";
	}
	
	
	

}
