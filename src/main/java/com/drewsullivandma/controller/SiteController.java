package com.drewsullivandma.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.drewsullivandma.model.Author;
import com.drewsullivandma.model.AuthorDAO;
//import com.drewsullivandma.model.AuthorFormatter;
import com.drewsullivandma.model.Book;
import com.drewsullivandma.model.BookDAO;
import com.drewsullivandma.model.Category;
import com.drewsullivandma.model.CategoryDAO;
import com.drewsullivandma.model.InputParser;
import com.drewsullivandma.model.LoginBean;

@Controller 
public class SiteController {
	
	CategoryDAO categoryDAO;
	BookDAO bookDAO;
	AuthorDAO authorDAO;
	
	@Autowired
	public SiteController(CategoryDAO categoryDAO, BookDAO bookDAO) {
		this.categoryDAO = categoryDAO;
		this.bookDAO = bookDAO;
	}
	
	@RequestMapping(path={"/", "/homePage"}, method=RequestMethod.GET)
		public String displayHomePage() {
		return "homePage";
	}
	
	@RequestMapping(path="/aboutMe")
	public String displayAboutMe() {
		return "aboutMe";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.GET)
    public String init(ModelMap model) {
        model.addAttribute("welcomeMessage", "Please Enter Your Username and Password");
        return "login";
    }
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
    public String submit(ModelMap model, @ModelAttribute("loginBean") LoginBean loginBean) {
        if (loginBean != null && loginBean.getUserName() != null & loginBean.getPassword() != null) {
            if (loginBean.getUserName().toLowerCase().equals("drew") && loginBean.getPassword().equals("4rLsHMW@UW97JvVT*=ACyVww")) {
                return "redirect:/bookInputForm";
            } else {
                model.addAttribute("error", "Incorrect Username or Password");
                return "login";
            }
        } else {
            model.addAttribute("error", "Incorrect Username or Password");
            return "login";
        }
    }
	
	@RequestMapping("/bookRecommendations")
	public String displayBookRecommendations(ModelMap model) {
		List<Category> categoryList = new ArrayList<>();
		categoryList = categoryDAO.getAllCategories();
		model.put("categories", categoryList);
		return "bookRecommendations";
	}

	@RequestMapping("/bookInputForm")
	public String displayBookInputForm(ModelMap model) {
		List<Category> categoryList = new ArrayList<>();
		List<Book> bookList = new ArrayList<>();
		categoryList = categoryDAO.getAllCategories();
		bookList = bookDAO.getAllBooks();
		model.put("categories", categoryList);
		model.put("books", bookList);
		return "bookInputForm";
	}
	
	@RequestMapping(path="/bookInputForm", method=RequestMethod.POST, params="newBook")
	public String processBookSubmission(@RequestParam Map<String, String> formInput) {
		InputParser ip = new InputParser();
		Book bookRecordToSave = ip.getBookRecord(formInput);
		bookDAO.saveNewBook(bookRecordToSave);
		return "redirect:/bookInputForm";
	}
	
	@RequestMapping(path="/bookRecommendations", method=RequestMethod.POST)
	public String deleteBookRecordsByBookId(@RequestParam int id) {
		bookDAO.deleteBookRecordsByBookId(id);
		return "redirect:/bookInputForm";
	}
	
	@RequestMapping(path="/bookRecommendations/{categoryId}", method=RequestMethod.GET)
	public String displayCategoryPage(@PathVariable int categoryId, ModelMap model) {
		List<Category> categoryList = new ArrayList<>();
		List<Book> bookList = new ArrayList<>();
		categoryList = categoryDAO.getAllCategories();
		String categoryName = categoryDAO.getCategoryNameByCategoryId(categoryId);
		bookList = bookDAO.getBooksByCategoryId(categoryId);
		model.put("categoryName", categoryName);
		model.put("categoryId", categoryId);
		model.put("categories", categoryList);
		model.put("books", bookList);
		return "bookCategoryTemplate";
	}
}
