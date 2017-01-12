package com.drewsullivandma.model.BookCategoryRecord;

import com.drewsullivandma.model.Book.Book;
import com.drewsullivandma.model.Category.Category;

public class BookCategoryRecord {

	private Book book;
	private Category category;
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
