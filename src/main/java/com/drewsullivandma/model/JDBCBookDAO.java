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
	public Book saveNewBook(Book book) {
		int newBookId = getNextBookId();
		String sqlSaveNewBook = "INSERT INTO book(title) "
							  + "VALUES(?)";
		jdbcTemplate.update(sqlSaveNewBook, book.getTitle());
		for(Category category : book.getCategories()) {
			String sqlSaveNewBookCategoryRelationship = "INSERT INTO book_category(book_id, category_id) "
							  						  + "VALUES(?, ?)";
			jdbcTemplate.update(sqlSaveNewBookCategoryRelationship, newBookId, category.getCategoryId());
		}
		for(Description description : book.getDescriptions()) {
			int newDescriptionId = getNextDescriptionId();
			String sqlSaveNewBookDescriptionRelationship = "INSERT INTO book_description(book_id, description_id) "
														 + "VALUES(?, ?)";
			String sqlSaveNewDescription = "INSERT INTO description(description) "
										 + "VALUES(?)";
			jdbcTemplate.update(sqlSaveNewBookDescriptionRelationship, newBookId, newDescriptionId);
			jdbcTemplate.update(sqlSaveNewDescription, description.getDescription());
		}
		for(Author author : book.getAuthors()) {
			int newAuthorId = getNextAuthorId();
			String sqlSaveNewAuthorBookRelationship = "INSERT INTO author_book(author_id, book_id) "
													+ "VALUES(?, ?)";
			String sqlSaveNewAuthor = "INSERT INTO author(first_name, middle_initials, last_name, post_nominal_initials)"
									+ "VALUES(?,?,?,?)";
			jdbcTemplate.update(sqlSaveNewAuthorBookRelationship, newBookId, newAuthorId);
			jdbcTemplate.update(sqlSaveNewAuthor, author.getFirstName(), author.getMiddleInitials(), author.getLastName(), author.getPostNominalInitials());
		}
		return book;
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
