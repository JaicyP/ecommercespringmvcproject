package com.jaicy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jaicy.dao.CartItemRepository;
import com.jaicy.dao.OrderItemRepository;
import com.jaicy.dao.OrderRepository;
import com.jaicy.entity.Category;
import com.jaicy.entity.Orders;
import com.jaicy.entity.Product;
import com.jaicy.entity.User;

@Service
public class MailService {
	
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	OrderItemRepository orderItemRepository;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CartItemRepository cartItemRepository;

    public void sendSimpleMessage(String to,int orderId, String subject, String text, Model model) {
        SimpleMailMessage message = new SimpleMailMessage(); 
        message.setTo(to); 
        message.setSubject(subject); 
        message.setText(text);
        message.setFrom("your_email@gmail.com");
        mailSender.send(message);
        model.addAttribute("mailsent", "Mail sent sucessfully");
        Orders order=orderRepository.findById(orderId).get();
		model.addAttribute("orderItems",orderItemRepository.getOrderItemsByOrderId(orderId));
		model.addAttribute("order",order);
		model.addAttribute("dates",orderService.convertingTimeDate(order.getCreatedAt()));
       
    }
    
    public String returnToDashboard(String email,Model model) {
    	User user=userService.getUserByEmail(email);
    	cartItemRepository.deleteCartItemsByCartId(user.getUserId());
        List<Product> products=productService.AllProducts();
		List<Category> categories=categoryService.getAllCategory();
		model.addAttribute("categories", categories);
		model.addAttribute("products", products);
		if(user.getRole().equals("ADMIN")) {
			return "admindashboard";
		}else {
			return "userdashboard";
		}
    }
	

}
