package com.jaicy.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jaicy.entity.LandingImage;



public interface ImageRepository extends JpaRepository<LandingImage,Integer>{
	
	Optional<LandingImage> findByName(String name);

}
