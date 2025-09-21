package com.jaicy.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jaicy.dao.AddressRepository;
import com.jaicy.dao.CartItemRepository;
import com.jaicy.entity.Address;
import com.jaicy.entity.CartItem;
import com.jaicy.entity.User;
import com.jaicy.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	AddressRepository addressRepository;
	
	
	@Autowired
	CartItemRepository cartItemRepository;
	
	@Override
	public void proceedToBuy(HttpSession session, Model model) {
		User user=null;
		if(session!=null) {
			user=(User) session.getAttribute("user");
		}
		List<Address> addressList=addressRepository.addressByUserId(user.getUserId());
		List<CartItem> cartItem = cartItemRepository.findCartItemByCartId(user.getCart().getCartId());
		Address address=null;
		for(Address adr:addressList) {
			if(adr.isDefault()) address=adr;
		}
		model.addAttribute("address",address);
		model.addAttribute("cartItem",cartItem);
	}

}
