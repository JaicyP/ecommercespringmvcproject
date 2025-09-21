package com.jaicy.entity;


import org.hibernate.annotations.DynamicInsert;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@DynamicInsert
public class CartItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int cartItemId;
	@ManyToOne
	@JoinColumn(name="cart_id")
	private Cart cart;
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;
	@Column(name="quantity",columnDefinition = "int default 1")
	private Integer quantity;

}
