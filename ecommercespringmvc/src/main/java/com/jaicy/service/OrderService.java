package com.jaicy.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.jaicy.dto.PlaceOrderDto;
import com.jaicy.entity.OrderItem;
import com.jaicy.entity.Orders;
import com.jaicy.entity.User;

import jakarta.servlet.http.HttpSession;

public interface OrderService {
	
	void proceedToBuy(HttpSession session,Model model);

	void createOrder(int cartId, HttpSession session,Model model);
	
	List<OrderItem> createOrderItems(User user, Orders order);

	void removeIconFunction(int orderItemId,Model model);
	
	void removeProductFromOrderItem(int orderItemId,Model model,HttpSession session);

	Map<String, Object> calculateTotalPrice(int orderId);

	void placeOrder(PlaceOrderDto placeOrderDto,Model model);

	void checkOut(int orderId, Model model);

	StringBuffer convertingTimeDate(LocalDateTime createdAt);

}
