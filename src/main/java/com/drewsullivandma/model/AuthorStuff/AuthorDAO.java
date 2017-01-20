package com.drewsullivandma.model.AuthorStuff;

import java.util.List;


public interface AuthorDAO {
	
	public List<Author> getAllAuthorsByBookId(int id);
}
