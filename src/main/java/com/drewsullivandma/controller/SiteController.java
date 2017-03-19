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
	
	@Autowired
	public SiteController(CategoryDAO categoryDAO, BookDAO bookDAO) {
		this.categoryDAO = categoryDAO;
		this.bookDAO = bookDAO;
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
            if (loginBean.getUserName().equals("drew") && loginBean.getPassword().equals("1")) {
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
	
	@RequestMapping({"/", "/bookRecommendations"})
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
		List<Book> bookList = new ArrayList<>();
		String categoryName = categoryDAO.getCategoryNameByCategoryId(categoryId);
		bookList = bookDAO.getBooksByCategoryId(categoryId);
		model.put("categoryName", categoryName);
		model.put("categoryId", categoryId);
		model.put("books", bookList);
		return "bookCategoryTemplate";
	}
	
}
