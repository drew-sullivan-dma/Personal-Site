package com.drewsullivandma.model;

import java.util.List;

public interface BookDAO {
	
	public void saveNewBook(Book book);
	public void deleteBookRecordsByBookId(int id);
	public List<Book> getBooksByCategoryId(int categoryId);
}
