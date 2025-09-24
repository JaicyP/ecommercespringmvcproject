package com.jaicy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jaicy.entity.Orders;
import com.jaicy.service.MailService;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Autowired
	MailService mailService;
	
	@PostMapping("/sendmail")
    public String sendMail(@RequestParam("useremail") String email,@RequestParam("id") int orderId,Model model) {
		  mailService.sendSimpleMessage(email, orderId,"Payment sucessful", "Your order has been placed sucessfully",model);
		  return "PaymentSucess";
    }
	
	@PostMapping("/gotohome")
	public String returnToHome(@RequestParam("useremail") String email,Model model) {
		return mailService.returnToDashboard(email, model);
	}

	
	
}
