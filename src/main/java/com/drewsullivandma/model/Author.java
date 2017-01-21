package com.drewsullivandma.model;

public class Author {
	
	private int id;
	private String firstName;
	private String middleInitials;
	private String lastName;
	private String postNominalInitials;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleInitials() {
		return middleInitials;
	}
	public void setMiddleInitials(String middleInitials) {
		this.middleInitials = middleInitials;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPostNominalInitials() {
		return postNominalInitials;
	}
	public void setPostNominalInitials(String postNominalInitials) {
		this.postNominalInitials = postNominalInitials;
	}

}
