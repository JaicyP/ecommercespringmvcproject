package com.jaicy.serviceimpl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jaicy.dao.AddressRepository;
import com.jaicy.dao.UserRepository;
import com.jaicy.dto.UserDto;
import com.jaicy.entity.Address;
import com.jaicy.entity.Cart;
import com.jaicy.entity.User;
import com.jaicy.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	AddressRepository addressRepository;


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

}
