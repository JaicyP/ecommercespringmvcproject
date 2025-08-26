package com.jaicy.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jaicy.dao.UserRepository;
import com.jaicy.dto.UserDto;
import com.jaicy.entity.Address;
import com.jaicy.entity.Cart;
import com.jaicy.entity.User;

@Service
public class UserServiceImpl implements UserService{
	
//	@Autowired
//	UserRepository userRepository;


	@Override
	public String createUser(UserDto userDto) {
		
		User user=new User();
		user.setName(userDto.getName());
		user.setEmail(userDto.getEmail());
		user.setMobile(userDto.getMobile());
		user.setPassword(createPassword() );
		user.setRole(userDto.getRole());
		List<Address> adrList=user.getAddress();
		adrList.add(userDto.getAddress());
		user.setAddress(adrList);
		user.setCart(userDto.getCart());
		System.out.println(user);
		return null;
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
