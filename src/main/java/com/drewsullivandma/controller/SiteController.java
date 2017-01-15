package com.drewsullivandma.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.drewsullivandma.model.Author.Author;
import com.drewsullivandma.model.Author.AuthorDAO;
import com.drewsullivandma.model.Book.Book;
import com.drewsullivandma.model.Book.BookDAO;
import com.drewsullivandma.model.Category.Category;
import com.drewsullivandma.model.Category.CategoryDAO;
import com.drewsullivandma.model.Description.Description;
import com.drewsullivandma.model.Description.DescriptionDAO;

@Controller 
public class SiteController {
	
	CategoryDAO categoryDAO;
	BookDAO bookDAO;
	AuthorDAO authorDAO;
	DescriptionDAO descriptionDAO;
	
	@Autowired
	public SiteController(CategoryDAO categoryDAO, BookDAO bookDAO, AuthorDAO authorDAO, DescriptionDAO descriptionDAO) {
		this.categoryDAO = categoryDAO;
		this.bookDAO = bookDAO;
		this.authorDAO = authorDAO;
		this.descriptionDAO = descriptionDAO;
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
		List<Book> bookList = new ArrayList<>();
		List<Author> authorList = new ArrayList<>();
		List<Description> descriptionList = new ArrayList<>();
		
		categoryList = categoryDAO.getAllCategories();
		bookList = bookDAO.getAllBooksByCategoryId(categoryId);
		authorList = authorDAO.getAllAuthorsByBookId(id);
		descriptionList = descriptionDAO.getAllDescriptionsByBookId(id);
		
		model.put("categories", categoryList);
		model.put("books", bookList);
		model.put("authors", authorList);
		model.put("descriptions", descriptionList);
		
		return "bookRecommendations";
	}
	
	@RequestMapping("/pastLife")
	public String displayPastLife() {
		return "pastLife";
	}
}
