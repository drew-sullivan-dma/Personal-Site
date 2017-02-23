package com.drewsullivandma.model;


public interface BookDAO {
	
	public void saveNewBook(Book book);
	public void deleteBookRecordsByBookId(int id);
}
