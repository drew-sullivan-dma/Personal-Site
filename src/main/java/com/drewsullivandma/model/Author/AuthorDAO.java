package com.drewsullivandma.model.Author;

import java.util.List;


public interface AuthorDAO {
	
	public List<Author> getAllAuthors();
	public List<String> getAllAuthorFirstNamesByBookId(int id);
	public List<String> getAllAuthorMiddleInitialsByBookId(int id);
	public List<String> getAllAuthorLastNamesByBookId(int id);
	public List<String> getAllAuthorPostNominalInitialsByBookId(int id);
}
