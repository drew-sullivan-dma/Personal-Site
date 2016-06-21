package com.techelevator.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.NotificationSignupLog;

@Controller
public class NotificationController {

	@RequestMapping(path="/notificationSignup", method=RequestMethod.GET)
	public String showNotificationSignupForm() {
		
		return "notificationSignup";
	}
	
	@RequestMapping(path="/notificationSignup", method=RequestMethod.POST)
	public String processNotificationSignupSubmission(@RequestParam String firstName,
													 @RequestParam String lastName,
													 @RequestParam String emailAddress,
													 @RequestParam int age) throws FileNotFoundException, IOException {
		
		File f = new File("notificationSignups.dat");
		System.out.println(f.getAbsolutePath());
		try(FileOutputStream out = new FileOutputStream(f, true)) {
			NotificationSignupLog log = new NotificationSignupLog(out);
			log.saveNotificationSignup(firstName, lastName, age, emailAddress);
			out.flush();
		}
		
		return "redirect:/";
	}
	
	
}
