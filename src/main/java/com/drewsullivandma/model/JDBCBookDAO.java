package com.drewsullivandma.model;

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
		int newBookId = getNextBookId();
		insertBook(book);
		insertBookCategoryRelationship(book, newBookId);
		insertBookDescriptionRelationship(book, newBookId);
		insertAuthorBookRelationship(book, newBookId);
	}

	private void insertBook(Book book) {
		String sqlSaveNewBook = "INSERT INTO book(title) "
							  + "VALUES(?)";
		jdbcTemplate.update(sqlSaveNewBook, book.getTitle());
	}
	
	private void insertBookCategoryRelationship(Book book, int newBookId) {
		for(Category category : book.getCategories()) {
			String sqlSaveNewBookCategoryRelationship = "INSERT INTO book_category(book_id, category_id) "
							  						  + "VALUES(?,?)";
			System.out.println("New Book ID: " + newBookId);
			System.out.println("Category ID: " + category.getCategoryId());
			jdbcTemplate.update(sqlSaveNewBookCategoryRelationship, newBookId, category.getCategoryId());
		}
	}
	
	private void insertBookDescriptionRelationship(Book book, int newBookId) {
		for(Description description : book.getDescriptions()) {
			int newDescriptionId = getNextDescriptionId();
			String sqlSaveNewDescription = "INSERT INTO description(description) "
					+ "VALUES(?)";
			String sqlSaveNewBookDescriptionRelationship = "INSERT INTO book_description(book_id, description_id) "
														 + "VALUES(?,?)";
			jdbcTemplate.update(sqlSaveNewDescription, description.getDescription());
			jdbcTemplate.update(sqlSaveNewBookDescriptionRelationship, newBookId, newDescriptionId);
		}
	}

	private void insertAuthorBookRelationship(Book book, int newBookId) {
		for(Author author : book.getAuthors()) {
			int newAuthorId = getNextAuthorId();
			String sqlSaveNewAuthor = "INSERT INTO author(first_name, middle_initials, last_name, post_nominal_initials)"
					+ "VALUES(?,?,?,?)";
			String sqlSaveNewAuthorBookRelationship = "INSERT INTO author_book(author_id, book_id) "
													+ "VALUES(?,?)";
			jdbcTemplate.update(sqlSaveNewAuthor, author.getFirstName(), author.getMiddleInitials(), author.getLastName(), author.getPostNominalInitials());
			jdbcTemplate.update(sqlSaveNewAuthorBookRelationship, newBookId, newAuthorId);
		}
	}

	private int getNextBookId() {
		String sqlGetNextBookId = "SELECT nextval('book_book_id_seq')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetNextBookId);
		result.next();
		int id = result.getInt(1);
		return id;
	}
	
	private int getNextAuthorId() {
		String sqlGetNextAuthorId = "SELECT nextval('author_author_id_seq')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetNextAuthorId);
		result.next();
		int id = result.getInt(1);
		return id;
	}
	
	private int getNextDescriptionId() {
		String sqlGetNextDescriptionId = "SELECT nextval('description_description_id_seq')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetNextDescriptionId);
		result.next();
		int id = result.getInt(1);
		return id;
	}

}
