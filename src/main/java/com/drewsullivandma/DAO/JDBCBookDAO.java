package com.drewsullivandma.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.drewsullivandma.model.Book;

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
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * FROM book");
		while(results.next()) {
			Book b = new Book();
			b = mapRowToBook(results);
			bookList.add(b);
		}
		return bookList;
	}
	
	@Override
	public List<Book> getBooksByCategory(String category) {
		List<Book> booksByCategory = new ArrayList<>();
		String sqlCategory = "SELECT * FROM book " + "WHERE category = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCategory, category);
		while(results.next()) {
			Book b = new Book();
			b = mapRowToBook(results);
			booksByCategory.add(b);
		}
		return booksByCategory;
	}

	private Book mapRowToBook(SqlRowSet results) {
		Book book = new Book();
		book.setBookId(results.getInt("book_id"));
		book.setTitle(results.getString("title"));
		book.setAuthorFirstName(results.getString("author_first_name"));
		book.setAuthorLastName(results.getString("author_last_name"));
		book.setCategory(results.getString("category"));
		book.setDescription(results.getString("description"));
		return book;
	}


}
