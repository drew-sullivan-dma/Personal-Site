package com.drewsullivandma.model.BookStuff;

import java.util.List;

import com.drewsullivandma.model.AuthorStuff.Author;
import com.drewsullivandma.model.DescriptionStuff.Description;

public class Book {

	private int id;
	private String title;
	private List<Author> authors;
	private List<Description> descriptions;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Author> getAuthors() {
		return authors;
	}
	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}
	public List<Description> getDescriptions() {
		return descriptions;
	}
	public void setDescriptions(List<Description> descriptions) {
		this.descriptions = descriptions;
	}
	
}
