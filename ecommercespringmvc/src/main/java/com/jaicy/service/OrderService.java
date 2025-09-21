package com.jaicy.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

public interface OrderService {
	
	void proceedToBuy(HttpSession session,Model model);

}
