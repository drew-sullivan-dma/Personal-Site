package com.drewsullivandma.model;

import java.util.ArrayList;
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
	public List<Book> getAllBooks() {
		List<Book> bookList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM book;");
		while(results.next()) {
			Book b = new Book();
			b = mapRowToBook2(results);
			bookList.add(b);
		}
		return bookList;
	}
	
	private Book mapRowToBook2(SqlRowSet results) {
		Book book = new Book();
		book.setId(results.getInt("book_id"));
		book.setTitle(results.getString("title"));
		return book;
	}
	
	@Override
	public List<Book> getBooksByCategoryId(int categoryId) {
		List<Book> bookList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM book_category bc "
													  + "JOIN book b ON bc.book_id = b.book_id "
													  + "JOIN category c ON bc.category_id = c.category_id "
													  + "WHERE c.category_id = ? "
													  + "ORDER BY b.title;", categoryId);
		while(results.next()) {
			Book b = new Book();
			b = mapRowToBook(results);
			bookList.add(b);
		}
		return bookList;
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
	
//	@Override
//	public void updateBookRecordByBookId(int id) {
//		updateBookCategoryRecord(id);
//		updateAuthorBookRecord(id);
//		updateBookDescriptionRecord(id);
//		updateBookRecord(id);
//	}
//	
//	private void updateBookCategoryRecord(int id) {
//		String sqlUpdateBookBookCategoryRecord = "DELETE FROM book_category bc "
// 			 			 					   + "WHERE bc.book_id = ?;";
//		jdbcTemplate.update(sqlDeleteBookBookCategoryRecord, id);
//	}
	
	private void updateBookRecord(int id) {
		String sqlDeleteBook = "DELETE FROM book "
				 			 + "WHERE book_id = ?;";
		jdbcTemplate.update(sqlDeleteBook, id);
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
	
	private Book mapRowToBook(SqlRowSet results) {
		Book book = new Book();
		book.setId(results.getInt("book_id"));
		book.setTitle(results.getString("title"));
		book.setAuthors(getAllAuthors(book.getId()));
		book.setDescriptions(getAllDescriptions(book.getId()));
		return book;
	}

	private List<Author> getAllAuthors(int bookId) {
		List<Author> authorList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM author_book ab "
													  + "JOIN author a ON ab.author_id = a.author_id "
													  + "JOIN book b ON ab.book_id = b.book_id "
													  + "WHERE b.book_id = ? "
													  + "ORDER BY a.first_name;", bookId);
		while(results.next()) {
			Author a = new Author();
			a = mapRowToAuthor(results);
			authorList.add(a);
		}
		return authorList;
	}

	private Author mapRowToAuthor(SqlRowSet results) {
		Author author = new Author();
		author.setId(results.getInt("author_id"));
		author.setFirstName(results.getString("first_name"));
		author.setMiddleInitials(results.getString("middle_initials"));
		author.setLastName(results.getString("last_name"));
		author.setPostNominalInitials(results.getString("post_nominal_initials"));
		return author;
	}

	private List<Description> getAllDescriptions(int bookId) {
		List<Description> descriptionList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM book_description bd "
													  + "JOIN book b ON bd.book_id = b.book_id "
													  + "JOIN description d ON bd.description_id = d.description_id "
													  + "WHERE b.book_id = ?;", bookId);
		while(results.next()) {
			Description d = new Description();
			d = mapRowToDescription(results);
			descriptionList.add(d);
		}
		return descriptionList;
	}

	private Description mapRowToDescription(SqlRowSet results) {
		Description description = new Description();
		description.setId(results.getInt("description_id"));
		description.setDescription(results.getString("description"));
		return description;
	}

}
