package com.jaicy.service;


import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.jaicy.dto.CartDto;
import com.jaicy.entity.Cart;


import jakarta.servlet.http.HttpSession;

public interface CartService {

	String addProductsToCart(CartDto cartDto, HttpSession session,Model model);

    int getQuantityCount(int cartId);
    
    Cart getCartById(int id);

	String cartPage(HttpSession session, Model model);
	
    void deleteCartItem(int cartItemId,HttpSession session,Model model);
    
    Map<String,Object>  getCartCount(int cartId);

	Map<String, Object> getAllCartItems(int cartId);

    void increaseCartQuantity(int cartItemId, Model model, HttpSession session);
    
    void decreaseQuantity(int cartItemId,Model model,HttpSession session);

	Map<String, Object> calculateTotalPrice(int cartId);

	
}
