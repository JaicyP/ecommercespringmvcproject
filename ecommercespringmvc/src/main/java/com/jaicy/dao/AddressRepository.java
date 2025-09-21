package com.jaicy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jaicy.entity.Address;


public interface AddressRepository extends JpaRepository<Address,Integer>{

	@Query(value="select * from address where user_id = :id",nativeQuery = true)
	public List<Address> addressByUserId(@Param("id") int userId);
}
