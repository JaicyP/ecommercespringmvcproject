package com.jaicy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jaicy.entity.Category;

public interface CategoryRepository extends JpaRepository<Category,Integer>{
	
	
	@Query(value="select name from category",nativeQuery=true)
	List<String> getCategoryNames();
	
	Category findByName(String name);

}
