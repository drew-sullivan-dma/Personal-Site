package com.drewsullivandma.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.drewsullivandma.model.Category;
import com.drewsullivandma.model.CategoryDAO;

@Controller 
public class SiteController {
	
	CategoryDAO categoryDAO;
	
	@Autowired
	public SiteController(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	@RequestMapping({"/", "/homePage"})
	public String displayHomePage() {
		return "homePage";
	}

	@RequestMapping("/aboutMe")
	public String displayAboutMe() {
		return "aboutMe";
	}
	
	@RequestMapping("/bookRecommendations")
	public String displayBookRecommendations(ModelMap model, @RequestParam int categoryId) {
		List<Category> categoryList = new ArrayList<>();
		categoryList = categoryDAO.getAllCategories();
		model.put("categories", categoryList);
		return "bookRecommendations";
	}
	
	@RequestMapping("/pastLife")
	public String displayPastLife() {
		return "pastLife";
	}
}
