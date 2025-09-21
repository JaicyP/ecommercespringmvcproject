package com.jaicy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jaicy.entity.CartItem;
import com.jaicy.entity.Product;

import jakarta.transaction.Transactional;


@Repository
public interface CartItemRepository extends JpaRepository<CartItem,Integer>{
	
	@Query(value="select sum(quantity) from cartitem where cart_id = :id", nativeQuery = true)
	public Integer getQuantityCount(@Param("id") int cartId);
    
	@Query(value="select product_id from cartitem where cart_id = :id", nativeQuery = true)
	public List<Integer> getAllProductsId(@Param("id") int cartId);
	
	@Query("select ci.product from CartItem ci where ci.cart.cartId = :id")
	public List<Product> getAllProducts(@Param("id") int cartId);
	
	@Query("SELECT ci FROM CartItem ci WHERE ci.cart.cartId = :id")
	public List<CartItem> findCartItemByCartId(@Param("id") int cartId);
	
	@Transactional
	@Modifying
	@Query(value="update cartitem set quantity=quantity+1 where cartItemId = :id", nativeQuery = true)
	public void increaseQuantity(@Param("id") int cartItemId);	
	
	@Transactional
	@Modifying
	@Query(value="update cartitem set quantity=quantity-1 where cartItemId = :id", nativeQuery = true)
	public void decreaseQuantity(@Param("id") int cartItemId);
	
	@Query(value="select quantity from cartitem where cartItemId = :id", nativeQuery = true)
	public int getQuantityCountByCartId(@Param("id") int cartItemId);
	
	
	

}
