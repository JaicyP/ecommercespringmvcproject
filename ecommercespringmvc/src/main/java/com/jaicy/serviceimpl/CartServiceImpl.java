package com.jaicy.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jaicy.dao.CartItemRepository;
import com.jaicy.dao.CartRepository;
import com.jaicy.dao.ProductRepository;
import com.jaicy.dto.CartDto;
import com.jaicy.entity.Cart;
import com.jaicy.entity.CartItem;
import com.jaicy.entity.Product;
import com.jaicy.entity.User;
import com.jaicy.service.CartService;
import com.jaicy.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartItemRepository cartItemRepository;
	
	@Autowired
	ProductRepository productRepository;

	@Override
	public String addProductsToCart(CartDto cartDto, HttpSession session,Model model) {
		User user=null;
		if(session!=null) {
			user=(User) session.getAttribute("user");
		}
	    CartItem cartItem =new CartItem();
	    Cart cart=getCartById(cartDto.getCartId());
	    Product product=productService.getProductById(cartDto.getProductId());
	    List<Integer> productIds=getAllProductsId(cart.getCartId());
	    if(productIds==null||!productIds.contains(product.getProductId())) {
	    cartItem.setProduct(product); 
	    cartItem.setCart(cart);
	    cartItemRepository.save(cartItem);
	    }
	    int count=getQuantityCount(cartDto.getCartId());
	    session.setAttribute("count", count);
	    model.addAttribute("product",product);
		return "addToCartPage";
	}
	
	
	@Override
	public Cart getCartById(int id) {
		return cartRepository.findById(id).get();
	}
	
	@Override
	public int getQuantityCount(int cartId) {
		   return cartItemRepository.getQuantityCount(cartId);
		
	}
	
	public List<Integer> getAllProductsId(int cartId){
		return cartItemRepository.getAllProductsId(cartId);
	}


	@Override
	public String cartPage(HttpSession session, Model model) {
		User user=null;
		if(session!=null) {
			user=(User) session.getAttribute("user");
		}
		int cartId=user.getCart().getCartId();
		List<CartItem> cartItem=cartItemRepository.findCartItemByCartId(cartId);
		model.addAttribute("cartItem", cartItem);
		return "cart";
	}
	


	@Override
	public void deleteCartItem(int cartItemId,HttpSession session,Model model) {
		User user=null;
		if(session!=null) {
			 user=(User) session.getAttribute("user");
		 }
		 int count=getQuantityCount(user.getCart().getCartId());
		 cartItemRepository.deleteById(cartItemId);
		 session.setAttribute("count", count);
		 List<CartItem> cartItem=cartItemRepository.findCartItemByCartId(user.getCart().getCartId());
		 model.addAttribute("cartItem", cartItem);
	}


	@Override
	public Map<String, Object> getCartCount(int cartId) {
		Map<String,Object> map=new HashMap<>();
		int count=0;
		if(cartItemRepository.getQuantityCount(cartId)!=null) {
			count=cartItemRepository.getQuantityCount(cartId);
		}
		map.put("count", count);
		return map;
	}
	
	@Override
	public Map<String,Object> getAllCartItems(int cartId){
		 Map<String,Object> map=new HashMap<>();
		 List<CartItem> cartItem=cartItemRepository.findCartItemByCartId(cartId);
		 map.put("cartItem", cartItem);
		 return map;
	}


	@Override
	public void increaseCartQuantity(int cartItemId, Model model, HttpSession session) {
		User user=null;
		if(session!=null) {
			 user=(User) session.getAttribute("user");
		 }
		 int quantity=cartItemRepository.getQuantityCountByCartId(cartItemId);
		 CartItem ci= cartItemRepository.findById(cartItemId).get();
		 if(ci.getProduct().getStockQuantity()>1) {
		     cartItemRepository.increaseQuantity(cartItemId);
		     productRepository.decrementStockQuantity(ci.getProduct().getProductId());
		 }else {
			     model.addAttribute("addedQuantity", quantity);
		         model.addAttribute("outOfStockMessage", "Available quantity is "+quantity+".\n Above that this item is out of stock! ");
		 }
		 List<CartItem> cartItem=cartItemRepository.findCartItemByCartId(user.getCart().getCartId());
		 model.addAttribute("cartItem", cartItem);
	}


	@Override
	public void decreaseQuantity(int cartItemId, Model model, HttpSession session) {
		User user=null;
		if(session!=null) {
			 user=(User) session.getAttribute("user");
		 }
		CartItem ci= cartItemRepository.findById(cartItemId).get();
		 int quantity=cartItemRepository.getQuantityCountByCartId(cartItemId);
		 if(quantity>1) {
			 cartItemRepository.decreaseQuantity(cartItemId);
			 productRepository.incrementStockQuantity(ci.getProduct().getProductId());
		 }
		 int count=getQuantityCount(user.getCart().getCartId());
		 session.setAttribute("count", count);
		 List<CartItem> cartItem=cartItemRepository.findCartItemByCartId(user.getCart().getCartId());
		 model.addAttribute("cartItem", cartItem);
	}


	@Override
	public Map<String, Object> calculateTotalPrice(int cartId) {
		List<CartItem> cartItem=cartItemRepository.findCartItemByCartId(cartId);
		double totalPrice=0;
		for(CartItem ci:cartItem) {
			if(ci.getProduct().getStockQuantity()==0) {
				ci.setQuantity(0);
			}
			totalPrice +=(ci.getProduct().getPrice()*ci.getQuantity());
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", totalPrice);
		System.out.println(map);
		return map;
	}


	

}
