package com.jaicy.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jaicy.dao.CategoryRepository;
import com.jaicy.service.LandingService;

import jakarta.servlet.http.HttpSession;

@Service
public class LandingServiceImpl implements LandingService{
	
	@Autowired
	 CategoryRepository categoryRepository;
	
	public void savingData(HttpSession session) {
		List<String> names=categoryRepository.getCategoryNames();
		System.out.println(names);
		session.setAttribute("names",names);
	}

}
