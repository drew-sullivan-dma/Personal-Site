package com.drewsullivandma.model.Author;

import java.util.List;

public class Author {
	
	private int id;
	private int bookId;
	private List<String> authorFirstNames;
	private List<String> authorMiddleInitials;
	private List<String> authorLastNames;
	private List<String> authorPostNominalInitials;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public List<String> getAuthorFirstNames() {
		return authorFirstNames;
	}
	public void setAuthorFirstNames(List<String> authorFirstNames) {
		this.authorFirstNames = authorFirstNames;
	}
	public List<String> getAuthorMiddleInitials() {
		return authorMiddleInitials;
	}
	public void setAuthorMiddleInitials(List<String> authorMiddleInitials) {
		this.authorMiddleInitials = authorMiddleInitials;
	}
	public List<String> getAuthorLastNames() {
		return authorLastNames;
	}
	public void setAuthorLastNames(List<String> authorLastNames) {
		this.authorLastNames = authorLastNames;
	}
	public List<String> getAuthorPostNominalInitials() {
		return authorPostNominalInitials;
	}
	public void setAuthorPostNominalInitials(List<String> authorPostNominalInitials) {
		this.authorPostNominalInitials = authorPostNominalInitials;
	}
	
}
