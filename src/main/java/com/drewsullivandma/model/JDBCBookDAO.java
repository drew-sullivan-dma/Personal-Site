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
			String sqlSaveNewAuthor = "INSERT INTO author(first_name, middle_initials, last_name, post_nominal_initials)"
								    + "VALUES(?,?,?,?)";
			jdbcTemplate.update(sqlSaveNewAuthor, author.getFirstName(), author.getMiddleInitials(), author.getLastName(), author.getPostNominalInitials());

			int latestAuthorId = getLatestAuthorId();
			String sqlSaveNewAuthorBookRelationship = "INSERT INTO author_book(author_id, book_id) "
													+ "VALUES(?,?)";
			jdbcTemplate.update(sqlSaveNewAuthorBookRelationship, latestBookId, latestAuthorId);
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
		return latestBookId;
	}
	
	private int getLatestAuthorId() {
		String sqlGetLatestAuthorId = "SELECT max(author_id) "
						   		    + "FROM author";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetLatestAuthorId);
		result.next();
		int latestAuthorId = result.getInt(1);
		return latestAuthorId;
	}
	
	private int getLatestDescriptionId() {
		String sqlGetLatestDescriptionId = "SELECT max(description_id) "
						   		  		 + "FROM description";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetLatestDescriptionId);
		result.next();
		int latestDescriptionId = result.getInt(1);
		return latestDescriptionId;
	}
	

//	private int getNextBookId() {
//		String sqlGetNextBookId = "SELECT nextval('book_book_id_seq')";
//		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetNextBookId);
//		result.next();
//		int id = result.getInt(1);
//		System.out.println("Before being called: " + id);
//		return id;
//	}
//	
//	private int getNextAuthorId() {
//		String sqlGetNextAuthorId = "SELECT nextval('author_author_id_seq')";
//		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetNextAuthorId);
//		result.next();
//		int id = result.getInt(1);
//		return id;
//	}
//	
//	private int getNextDescriptionId() {
//		String sqlGetNextDescriptionId = "SELECT nextval('description_description_id_seq')";
//		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetNextDescriptionId);
//		result.next();
//		int id = result.getInt(1);
//		return id;
//	}

}
