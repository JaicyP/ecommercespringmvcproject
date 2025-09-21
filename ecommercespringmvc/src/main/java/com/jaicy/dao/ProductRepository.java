package com.jaicy.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jaicy.entity.Product;

import jakarta.transaction.Transactional;

public interface ProductRepository extends JpaRepository<Product,Integer>{
	
	@Transactional
	@Modifying
	@Query(value="update product set stockQuantity=stockQuantity-1 where productId = :id", nativeQuery = true)
	public void decrementStockQuantity(@Param("id") int productId);
	
	@Transactional
	@Modifying
	@Query(value="update product set stockQuantity=stockQuantity+1 where productId = :id", nativeQuery = true)
	public void incrementStockQuantity(@Param("id") int productId);

}
