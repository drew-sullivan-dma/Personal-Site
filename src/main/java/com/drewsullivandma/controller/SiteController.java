package com.drewsullivandma.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.drewsullivandma.model.Author;
import com.drewsullivandma.model.Book;
import com.drewsullivandma.model.BookDAO;
import com.drewsullivandma.model.Category;
import com.drewsullivandma.model.CategoryDAO;
import com.drewsullivandma.model.Description;

@Controller 
public class SiteController {
	
	CategoryDAO categoryDAO;
	BookDAO bookDAO;
	
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

//	WIP:
//	@RequestMapping(path="/bookRecommendations", method=RequestMethod.POST)
//	public String processBookSubmission(@RequestParam Map<String, String> formInput) {
//		Book b = new Book();
//		List<String> authorInformation = new ArrayList<>();
//		List<String> descriptions = new ArrayList<>();
//		List<String> categories = new ArrayList<>();
//		for (Map.Entry<String, String> entry : formInput.entrySet()) {
//			System.out.println(entry.getKey() + " : " + entry.getValue());
//			Author a = new Author();
//			if(entry.getKey().substring(0, 1).toLowerCase().equals("t")){
//				b.setTitle(entry.getValue());
//			}
//			if(entry.getKey().substring(0, 1).toLowerCase().equals("a")){
//				a.setFirstName(entry.getValue());
//				authorInformation.add(entry.getValue());
//			}
//			if(entry.getKey().substring(0, 1).toLowerCase().equals("d")) {
//				descriptions.add(entry.getValue());
//			}
//			if(entry.getKey().substring(0, 1).toLowerCase().equals("c")) {
//				categories.add(entry.getValue());
//			}
//		}
//		for(int i = 0; i < authorInformation.size(); i += 4)
//			if(i <= 3) {
//				Author a = new Author();
//				a.setFirstName(authorInformation.get(0));
//				a.setMiddleInitials(authorInformation.get(1));
//				a.setLastName(authorInformation.get(2));
//				a.setPostNominalInitials(authorInformation.get(3));
//			}
//			Author a = new Author();
//			if(i == 0 || i % 4 == 0) {
//				a.setFirstName(authorInformation.get(i));
//			}
//		for(String bitOfAuthorInfo : authorInformation) {
//			System.out.println(bitOfAuthorInfo);
//		}
//		for(String description : descriptions) {
//			System.out.println(description);
//		}
//		for(String category : categories) {
//			System.out.println(category);
//		}
//		return "bookRecommendations";
//	}
	
	@RequestMapping("/pastLife")
	public String displayPastLife() {
		return "pastLife";
	}
}
