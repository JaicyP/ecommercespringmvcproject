package com.jaicy.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jaicy.entity.OrderStatus;
import com.jaicy.entity.Orders;
import com.jaicy.entity.PaymentStatus;

import jakarta.transaction.Transactional;



@Repository
public interface OrderRepository extends JpaRepository<Orders,Integer> {
    
	@Query(value="select * from orders where user_id = :id", nativeQuery = true)
	Orders findByUserId(@Param("id") Integer userId);
	
	@Transactional
	@Modifying
	@Query(value="update orders set orderStatus= :status where orderId = :id", nativeQuery = true)
	void updateOrderStatus(@Param("status") OrderStatus orderStatus,@Param("id") Integer orderId);
	
	@Transactional
	@Modifying
	@Query(value="update orders set paymentStatus= :status where orderId = :id", nativeQuery = true)
	void updatePaymentStatus(@Param("status") PaymentStatus paymentStatus,@Param("id") Integer orderId);
	
	@Transactional
	@Modifying
	@Query(value="update orders set paymentMode= :mode where orderId = :id", nativeQuery = true)
	void updatePaymentMode(@Param("mode") String paymentMode,@Param("id") Integer orderId);
}
