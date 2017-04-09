package com.drewsullivandma.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.drewsullivandma.model.BookDAO;
import com.drewsullivandma.model.CategoryDAO;
import com.drewsullivandma.model.LoginBean;

@Controller
public class AuthenticationController {

	CategoryDAO categoryDAO;
	BookDAO bookDAO;
	
	@Autowired
	public AuthenticationController(CategoryDAO categoryDAO, BookDAO bookDAO) {
		this.categoryDAO = categoryDAO;
		this.bookDAO = bookDAO;
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
	
}
