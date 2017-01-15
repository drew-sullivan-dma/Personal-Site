package com.drewsullivandma.model.Book;

import java.util.List;

public interface BookDAO {

	public List<Book> getAllBooksByCategoryId(int id);
}
