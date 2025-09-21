package com.jaicy.entity;

import java.io.InputStream;

import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer productId;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="category_id")
	private Category category;
	private String name;
	@Column(columnDefinition = "LONGTEXT")
	private String description;
	private double price;
	private Integer stockQuantity;
	@Lob 
	@Column(name = "image_data", columnDefinition = "LONGBLOB")
	@Basic(fetch = FetchType.LAZY)  
	private byte[] prodImage;
	private float ratingAverage;
	

}
