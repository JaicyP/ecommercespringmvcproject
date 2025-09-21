package com.jaicy.serviceimpl;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jaicy.dao.AddressRepository;
import com.jaicy.dao.UserRepository;
import com.jaicy.dto.UserDto;
import com.jaicy.entity.Address;
import com.jaicy.entity.Cart;
import com.jaicy.entity.Category;
import com.jaicy.entity.Product;
import com.jaicy.entity.User;
import com.jaicy.service.CartService;
import com.jaicy.service.CategoryService;
import com.jaicy.service.ProductService;
import com.jaicy.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	AddressRepository addressRepository;
	
	@Autowired
	ProductService  productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	CartService cartService;


	@Override
	public String createUser(UserDto userDto) {
	 
	 try {
		
		User user=new User();
		user.setName(userDto.getName());
		user.setEmail(userDto.getEmail());
		user.setMobile(userDto.getMobile());
		user.setPassword(createPassword() );
		user.setRole(userDto.getRole());
		
		Address address=new Address();
		List<Address> adrList=user.getAddress();
		adrList.add(userDto.getAddress());
		user.setAddress(adrList);
		
		
		Cart cart=new Cart();
		cart.setCreatedAt(LocalDateTime.now());
		cart.setUser(user);
		user.setCart(cart);
		address.setCity(userDto.getAddress().getCity());
		address.setCountry(userDto.getAddress().getCountry());
		address.setPincode(userDto.getAddress().getPincode());
		address.setState(userDto.getAddress().getState());
		
		address.setUser(user);
	     
		addressRepository.save(address);
		userRepository.save(user);
		
		
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
		return "sucess";
	}
	
	
	private static String createPassword() {
		
		String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*";
		StringBuilder passwordGen=new StringBuilder();
		Random random=new Random();
		for(int i=0;i<8;i++) {
			int index=random.nextInt(str.length());
			passwordGen.append(str.charAt(index));
		}
		System.out.println(passwordGen);
		return passwordGen.toString();
	}


	@Override
	public List<String> usersList() {
		List<String> list=new ArrayList<>();
		List<User> user=userRepository.findAll();
		for(User u:user) {
			list.add(u.getEmail());
		}
		return list;
	}


	@Override
	public User getUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}


	@Override
	public String loginUser(String email, String password, Model model,HttpSession session) {
		List<String> users=usersList();
		User user=getUserByEmail(email);
		List<Product> products=productService.AllProducts();
		List<Category> categories=categoryService.getAllCategory();
		if(users.contains(email)) {
			if(password.equals(user.getPassword())) {
				session.setAttribute("user", user);
				model.addAttribute("categories", categories);
				model.addAttribute("products", products);
				if(user.getRole().equals("ADMIN")) {
					return "admindashboard";
				}else {
					return "userdashboard";
				}
			}else{
				model.addAttribute("mess3","Wrong Credentials.Try again later......");
				return "login";
			}
		}else{
			model.addAttribute("mess1", "Haven't Registered Yet?");
			return "register";
		}
	}
	
	
	




}
