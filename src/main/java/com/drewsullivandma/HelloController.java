package com.drewsullivandma;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class HelloController {

	@RequestMapping({"/", "/homePage"})
	public String displayHomePage() {
		return "homePage";
	}
	
	@RequestMapping("/aboutMe")
	public String displayAboutMe() {
		return "aboutMe";
	}
	
	@RequestMapping("/contact")
	public String displayContact() {
		return "contact";
	}
	
	@RequestMapping("/linkedInAndResume")
	public String displayLinkedInAndResume() {
		return "linkedInAndResume";
	}
	
	@RequestMapping("/bookRecommendations")
	public String displayBookRecommendations() {
		return "bookRecommendations";
	}
	
	@RequestMapping("/pastLife")
	public String displayPastLife() {
		return "pastLife";
	}
	
	@RequestMapping("/resourcesAndLinks")
	public String displayResourcesAndLinks() {
		return "resourcesAndLinks";
	}
}
