package com.drewsullivandma.model;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCBookDAO implements BookDAO {

	private JdbcTemplate jdbcTemplate;
	
	
	@Autowired
	public JDBCBookDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}
	
	@Override
	public void saveNewBook(Book book) {
		insertBook(book);
		int latestBookId = getLatestBookId();
		List<Category> categories = book.getCategories();
		List<Author> authors = book.getAuthors();
		List<Description> descriptions = book.getDescriptions();
		insertBookCategoryRelationship(categories, latestBookId);
		insertAuthorBookRelationship(authors, latestBookId);
		insertBookDescriptionRelationship(descriptions, latestBookId);
	}

	@Override
	public void deleteBookRecordsByBookId(int id) {
		deleteBookCategoryRecord(id);
		deleteAuthorBookRecord(id);
		deleteBookDescriptionRecord(id);
		deleteBookRecord(id);
	}
	
	private void deleteBookRecord(int id) {
		String sqlDeleteBook = "DELETE FROM book "
				 			 + "WHERE book_id = ?;";
		jdbcTemplate.update(sqlDeleteBook, id);
	}
	
	private void deleteAuthorBookRecord(int id) {
		String sqlDeleteAuthorBookRecord = "DELETE FROM author_book ab "
	 			 						 + "WHERE ab.book_id = ?;";
		jdbcTemplate.update(sqlDeleteAuthorBookRecord, id);
	}
	
	private void deleteBookDescriptionRecord(int id) {
		String sqlDeleteBookDescriptionRecord = "DELETE FROM book_description bd "
		 								      + "WHERE bd.book_id = ?;";
		jdbcTemplate.update(sqlDeleteBookDescriptionRecord, id);
	}
	
	private void deleteBookCategoryRecord(int id) {
		String sqlDeleteBookBookCategoryRecord = "DELETE FROM book_category bc "
 			 			 					   + "WHERE bc.book_id = ?;";
		jdbcTemplate.update(sqlDeleteBookBookCategoryRecord, id);
	}

	private void insertBook(Book book) {
		String sqlSaveNewBook = "INSERT INTO book(title) "
							  + "VALUES(?)";
		jdbcTemplate.update(sqlSaveNewBook, book.getTitle());
	}
	
	private void insertBookCategoryRelationship(List<Category> categories, int newBookId) {
		for(Category category : categories) {
			String sqlSaveNewBookCategoryRelationship = "INSERT INTO book_category(book_id, category_id) "
							  						  + "VALUES(?,?)";
			jdbcTemplate.update(sqlSaveNewBookCategoryRelationship, newBookId, category.getCategoryId());
		}
	}
	
	private void insertAuthorBookRelationship(List<Author> authors, int latestBookId) {
		for(Author author : authors) {
			String sqlSaveNewAuthor = "INSERT INTO author(first_name, middle_initials, last_name, post_nominal_initials) "
								    + "VALUES(?,?,?,?)";
			jdbcTemplate.update(sqlSaveNewAuthor, author.getFirstName(), author.getMiddleInitials(), author.getLastName(), author.getPostNominalInitials());

			int latestAuthorId = getLatestAuthorId();
			String sqlSaveNewAuthorBookRelationship = "INSERT INTO author_book(author_id, book_id) "
													+ "VALUES(?,?)";
			jdbcTemplate.update(sqlSaveNewAuthorBookRelationship, latestAuthorId, latestBookId);
		}
	}
	
	private void insertBookDescriptionRelationship(List<Description> descriptions, int newBookId) {
		for(Description description : descriptions) {
			String sqlSaveNewDescription = "INSERT INTO description(description) "
									     + "VALUES(?)";
			jdbcTemplate.update(sqlSaveNewDescription, description.getDescription());
			
			int latestDescriptionId = getLatestDescriptionId();
			String sqlSaveNewBookDescriptionRelationship = "INSERT INTO book_description(book_id, description_id) "
														 + "VALUES(?,?)";
			jdbcTemplate.update(sqlSaveNewBookDescriptionRelationship, newBookId, latestDescriptionId);
		}
	}
	
	private int getLatestBookId() {
		String sqlGetLatestBookId = "SELECT max(book_id) "
						   		  + "FROM book";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetLatestBookId);
		result.next();
		int latestBookId = result.getInt(1);
//		System.out.println("Latest Book id: " + latestBookId);
		return latestBookId;
	}
	
	private int getLatestAuthorId() {
		String sqlGetLatestAuthorId = "SELECT max(author_id) "
						   		    + "FROM author";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetLatestAuthorId);
		result.next();
		int latestAuthorId = result.getInt(1);
//		System.out.println("Latest Author id: " + latestAuthorId);
		return latestAuthorId;
	}
	
	private int getLatestDescriptionId() {
		String sqlGetLatestDescriptionId = "SELECT max(description_id) "
						   		  		 + "FROM description";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetLatestDescriptionId);
		result.next();
		int latestDescriptionId = result.getInt(1);
//		System.out.println("Latest Description id: " + latestDescriptionId);
		return latestDescriptionId;
	}

}
