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
	public String displayBookRecommendations(ModelMap model) {
		List<Category> categoryList = new ArrayList<>();
		categoryList = categoryDAO.getAllCategories();
		model.put("categories", categoryList);
		return "bookRecommendations";
	}
	
//	TODO: This one is a WIP
//	1. Be able to pass in nothing to each
//	2. Be able to pass in multiples where the dynamic inputs are
//	3. Turn those into lists
//	4. Set these in their classes
	@RequestMapping("/bookRecommendations")
	public String processBookSubmission(@RequestParam String title,
										@RequestParam String firstName,
										@RequestParam String middleInitials,
										@RequestParam String lastName, 
										@RequestParam String postNominalInitials,
										@RequestParam String description,
										@RequestParam int id) {
		return "bookRecommendations";
	}
	
	@RequestMapping("/pastLife")
	public String displayPastLife() {
		return "pastLife";
	}
}
