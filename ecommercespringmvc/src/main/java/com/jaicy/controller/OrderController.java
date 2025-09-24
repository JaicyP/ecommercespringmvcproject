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

import com.jaicy.dto.PlaceOrderDto;
import com.jaicy.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	OrderService orderService;

	
	@PostMapping("/createorder")
	public String createOrder(HttpSession session,@RequestParam("id") int cartId,Model model) {
		orderService.createOrder(cartId,session,model);
		return "order";
	}
	
	@GetMapping("/removeicon")
	public String removeIconFunction(@RequestParam("id") int orderItemId,Model model) {
		 orderService.removeIconFunction(orderItemId,model);
		 return "order";
	}
	
	@PostMapping("/removeproduct")
	public String removeProductFromOrderItem(@RequestParam("id") int orderItemId,Model model,HttpSession session) {
		orderService.removeProductFromOrderItem(orderItemId, model,session);
		return "order";
	}
	
	
	@GetMapping("/totalPrice")
	@ResponseBody
	public Map<String,Object> calculateTotalPrice(@RequestParam("id") int orderId){
		return orderService.calculateTotalPrice(orderId);
		
	}
	
	@PostMapping("/placingorder")
	public String placeOrder(@ModelAttribute PlaceOrderDto placeOrderDto,Model model) {
		orderService.placeOrder(placeOrderDto,model);
		return "payment";
	}

	@GetMapping("/paymentsucess")
	public String paymentSucessPage(@RequestParam("id") int orderId,Model model) {
		orderService.checkOut(orderId,model);
		return "PaymentSucess";
	}
}
