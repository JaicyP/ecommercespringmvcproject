package com.jaicy.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jaicy.dto.CartDto;
import com.jaicy.service.CartService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	CartService cartService;

	
	@PostMapping("/addtocart")
	public String addProductsToCart(@ModelAttribute CartDto cartDto,HttpSession session,Model model) {
		return cartService.addProductsToCart(cartDto,session,model);
	}
	
	@GetMapping("/cartpage")
	public String cartPage(HttpSession session,Model model) {
		cartService.cartPage(session,model);
		return "cart";
	}
	
	@GetMapping("/deletecartitem")
	public String deleteCartItem(@RequestParam("id") int cartId,HttpSession session,Model model) {
		 cartService.deleteCartItem(cartId,session,model);
		 return "cart";
	}
    
	@GetMapping("/cartcount")
	@ResponseBody
	public Map<String,Object>  getCartCount(@RequestParam("id") int cartId){
		return cartService.getCartCount(cartId);
	}
	
	@GetMapping("/increasequantity")
	public String increaseQuantity(@RequestParam("id") int cartItemId,Model model,HttpSession session) {
		 cartService.increaseCartQuantity(cartItemId,model,session);
		 return "cart";
		 
	}
	
	@GetMapping("/decreasequantity")
	public String decreaseQuantity(@RequestParam("id") int cartItemId,Model model,HttpSession session) {
		 cartService.decreaseQuantity(cartItemId,model,session);
		 return "cart";
		 
	}
	
	@GetMapping("/totalPrice")
	@ResponseBody
	public Map<String,Object> calculateTotalPrice(@RequestParam("id") int cartId){
		return cartService.calculateTotalPrice(cartId);
		
	}
	
}
