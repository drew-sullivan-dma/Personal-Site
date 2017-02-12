package com.drewsullivandma.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.drewsullivandma.model.BookDAO;
import com.drewsullivandma.model.Category;
import com.drewsullivandma.model.CategoryDAO;
//import com.drewsullivandma.model.InputParser;

@Controller 
public class SiteController {
	
	CategoryDAO categoryDAO;
	BookDAO bookDAO;
	
	@Autowired
	public SiteController(CategoryDAO categoryDAO, BookDAO bookDAO) {
		this.categoryDAO = categoryDAO;
		this.bookDAO = bookDAO;
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

//	WIP:
//	@RequestMapping(path="/bookRecommendations", method=RequestMethod.POST)
//	public String processBookSubmission(@RequestParam Map<String, String> formInput) {
//		InputParser ip = new InputParser();
//		Book bookRecordToSave = ip.getBookRecord(formInput);
//		bookDAO.saveNewBook(bookRecordToSave);
//		return "bookRecommendations";
//	}
	
	@RequestMapping("/pastLife")
	public String displayPastLife() {
		return "pastLife";
	}
}
