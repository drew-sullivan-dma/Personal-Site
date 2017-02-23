package com.drewsullivandma.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.drewsullivandma.model.Book;
import com.drewsullivandma.model.BookDAO;
import com.drewsullivandma.model.Category;
import com.drewsullivandma.model.CategoryDAO;
import com.drewsullivandma.model.InputParser;

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

	@RequestMapping(path="/bookRecommendations", method=RequestMethod.POST)
	public String processBookSubmission(@RequestParam Map<String, String> formInput) {
		InputParser ip = new InputParser();
		Book bookRecordToSave = ip.getBookRecord(formInput);
		bookDAO.saveNewBook(bookRecordToSave);
		//This redirect reloads the page and prevents parts of the page 
		//from not reloading after form submission
		return "redirect:/bookRecommendations";
	}
	
	@RequestMapping(path="/bookRecommendations", method=RequestMethod.POST)
	public String deleteBookRecordsByBookId(@RequestParam int id) {
		bookDAO.deleteBookRecordsByBookId(id);
		return "redirect:/bookRecommendations";
	}
	
	//TODO: Break out book recs into another controller
	//see http://stackoverflow.com/questions/25268000/handling-multiple-forms-spring
	//for handling multiple posts to the same uri
	//also https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=spring+controller+params
	
	@RequestMapping("/pastLife")
	public String displayPastLife() {
		return "pastLife";
	}
}
