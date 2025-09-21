package com.jaicy.service;

import java.util.List;


import com.jaicy.dto.CategoryDto;
import com.jaicy.entity.Category;


public interface CategoryService {
	
	String addCategory(CategoryDto categoryDto);

	List<Category> getAllCategory();

	Category getCategoryById(Integer id);

	String deleteCategory(Integer id);

	List<String> getCategoryNames();

	Category updateCategory(Category category, Integer categoryId);

}
