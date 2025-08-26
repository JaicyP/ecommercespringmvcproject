package com.jaicy.dto;



import com.jaicy.entity.Address;
import com.jaicy.entity.Cart;
import com.jaicy.entity.Role;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
	
	private Integer userId;
	private String name;
	private String email;
	private String mobile;
	private Role role;
	private String password;
	private Address address;
	private Cart cart;
}
