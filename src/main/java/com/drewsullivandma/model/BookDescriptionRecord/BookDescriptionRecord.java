package com.drewsullivandma.model.BookDescriptionRecord;

import com.drewsullivandma.model.Book.Book;
import com.drewsullivandma.model.Description.Description;

public class BookDescriptionRecord {

	private Book book;
	private Description description;
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Description getDescription() {
		return description;
	}
	public void setDescription(Description description) {
		this.description = description;
	}
}
