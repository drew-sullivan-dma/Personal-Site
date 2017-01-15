package com.drewsullivandma.model.Category;

import java.util.List;

import com.drewsullivandma.model.Book.Book;

public class Category {
	
	private int categoryId;
	private String name;
	private List<Book> books;
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	

}
