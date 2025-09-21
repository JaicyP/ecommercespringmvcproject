package com.jaicy.dto;

import com.jaicy.entity.Product;
import com.jaicy.entity.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
	
	private int cartId;
	private int productId;

}
