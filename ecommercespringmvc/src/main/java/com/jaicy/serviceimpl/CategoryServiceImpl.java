package com.jaicy.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.jaicy.dao.CategoryRepository;
import com.jaicy.dto.CategoryDto;
import com.jaicy.entity.Category;
import com.jaicy.service.CategoryService;




@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private Category category;
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public String addCategory(CategoryDto categoryDto) {
		
		try {
		category.setName(categoryDto.getName());
		category.setDescription(categoryDto.getDescription());
		categoryRepository.save(category);
		return "sucess";
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Not added.Try again";
	}

	@Override
	public List<Category> getAllCategory() {
		try {
		  return categoryRepository.findAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ArrayList<>();
	}

	@Override
	public Category getCategoryById(Integer id) {
		try {
		   Optional<Category> category=categoryRepository.findById(id);
		   if(category.isPresent()) {
			   return category.get();
		   }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String deleteCategory(Integer id) {
		try {
			categoryRepository.deleteById(id);
			return "sucess";
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Try again";
	}

	@Override
	public List<String> getCategoryNames() {
		try {
			List<String> categoryNames=categoryRepository.getCategoryNames();
			return categoryNames;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Category updateCategory(Category category, Integer categoryId) {
		try {
		Optional<Category> oldCategory=categoryRepository.findById(categoryId);
		if(oldCategory.isPresent()) {
		   oldCategory.get().setName(category.getName());
		   oldCategory.get().setDescription(category.getDescription());
		}
		categoryRepository.save(oldCategory.get());
		return oldCategory.get();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	


	
	

}
