package com.jaicy.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer orderItemId;
	@ManyToOne
	@JoinColumn(name="order_id")
	private Orders orders;
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;
	private int quantity;
	private double price;

}
