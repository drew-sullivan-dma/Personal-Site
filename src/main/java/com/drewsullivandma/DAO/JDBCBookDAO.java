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
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM book "
													  + "ORDER BY book.title ASC;");
		while(results.next()) {
			Book b = new Book();
			b = mapRowToBook(results);
			bookList.add(b);
		}
		return bookList;
	}

	private Book mapRowToBook(SqlRowSet results) {
		Book book = new Book();
		book.setId(results.getInt("book_id"));
		book.setCategoryId(results.getInt("category_id"));
		book.setTitle(results.getString("title"));
		book.setDescription(results.getString("description"));
		return book;
	}


}
