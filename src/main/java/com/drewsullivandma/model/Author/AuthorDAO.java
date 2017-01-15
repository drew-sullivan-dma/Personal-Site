package com.drewsullivandma.model.Author;

import java.util.List;


public interface AuthorDAO {
	
	public List<Author> getAllAuthorsByBookId(int id);
}
