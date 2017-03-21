package com.drewsullivandma.model;

import java.util.List;

public interface AuthorDAO {

	public List<Author> getAuthorsByBookId(int bookId);
}
