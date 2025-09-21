package com.jaicy.dto;

import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class ProductDto {
	
	private String name;
	private String categoryName;
	private String description;
	private double price;
	private int stockQuantity;
	private float ratingAverage;
}
