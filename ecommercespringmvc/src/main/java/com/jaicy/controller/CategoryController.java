package com.jaicy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jaicy.dto.CategoryDto;
import com.jaicy.entity.Category;
import com.jaicy.service.CategoryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/registercategory")
	public String registerPage() {
		return "category";
	}
	
	@GetMapping("/updatepage")
	public String updatePage(@RequestParam("id") Integer categoryId,Model model) {
		Category category= categoryService.getCategoryById(categoryId);
		model.addAttribute("category",category);
		return "updateCategory";
	}
	
	@PostMapping("/add")
	public String addCategory(@ModelAttribute CategoryDto categoryDto,HttpServletRequest request,Model model) {
		
		
		String str=categoryService.addCategory(categoryDto);
		model.addAttribute("msg",str);
		List<Category> list=categoryService.getAllCategory();
		model.addAttribute("list", list);
		return "displayCategories";
	}
	
	
	@GetMapping("/all")
	public String getAllCategory(Model model) {
		List<Category> list=categoryService.getAllCategory();
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
			return "displayCategories";
		}
		model.addAttribute("msg","Failed");
		return "result";
	}
	
	@GetMapping("/single")
	public String getCategoryById(@RequestParam("id") Integer categoryId,Model model) {
		Category category= categoryService.getCategoryById(categoryId);
		//System.out.println(category);
		if(category!=null) {
			model.addAttribute("category",category);
			return "displayCategory";
		}
		model.addAttribute("msg","Failed");
		return "result";
	}
	
	@GetMapping("/delete")
	public String deleteCategory(@RequestParam("id") Integer categoryId,Model model) {
		String str=categoryService.deleteCategory(categoryId);
		model.addAttribute("msg",str);
		return "result";
	}
	
	@PostMapping("/update")
	public String updateCategory(@ModelAttribute Category category,@RequestParam("id") Integer categoryId,Model model ) {
		Category updatedCategory=categoryService.updateCategory(category,categoryId);
		model.addAttribute("category",category);
		return "displayCategory";
		
	}
	
	

}
