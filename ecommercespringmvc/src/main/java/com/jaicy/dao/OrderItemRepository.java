package com.jaicy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jaicy.entity.OrderItem;
import com.jaicy.entity.Orders;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem,Integer> {

	
	@Query(value="select * from orderitem where order_id = :id", nativeQuery = true)
	List<OrderItem> getOrderItemsByOrderId(@Param("id") Integer orderId);

	@Query("select oi.orders from OrderItem oi where oi.orderItemId = :id")
	Orders getOrderByOrderId(@Param("id") Integer orderId);
    
	@Query("select oi from OrderItem oi where oi.orders.orderId = :id")
	List<OrderItem> findOrderItemByOrderId(@Param("id") int orderId);

}
