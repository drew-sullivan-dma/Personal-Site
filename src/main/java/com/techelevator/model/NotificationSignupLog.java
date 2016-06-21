package com.techelevator.model;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;

public class NotificationSignupLog {
	
	private PrintWriter writer;

	public NotificationSignupLog(OutputStream outputDestination) {
		this.writer = new PrintWriter(outputDestination);
	}
	
	public void saveNotificationSignup(String firstName, String lastName, int age, String emailAddress) {
		LocalDateTime now = LocalDateTime.now();
		writer.println(now+"|"+lastName+", "+firstName+"|"+age+"|"+emailAddress);
	}
}
