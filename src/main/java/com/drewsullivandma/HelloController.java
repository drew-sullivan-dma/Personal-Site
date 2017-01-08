package com.drewsullivandma;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.drewsullivandma.DAO.BookDAO;
import com.drewsullivandma.model.Book;

@Controller 
public class HelloController {
	
	BookDAO bookDAO;
	List<Book> bookList = new ArrayList<>();
	
	@Autowired
	public HelloController(BookDAO bookDAO) {
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
	public String displayBookRecommendations() {
		return "bookRecommendations";
	}
	
	@RequestMapping("/pastLife")
	public String displayPastLife() {
		return "pastLife";
	}
}
