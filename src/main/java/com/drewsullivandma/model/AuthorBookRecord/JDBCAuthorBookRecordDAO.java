package com.drewsullivandma.model.AuthorBookRecord;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.drewsullivandma.model.Author.Author;
import com.drewsullivandma.model.Book.Book;

@Component
public class JDBCAuthorBookRecordDAO implements AuthorBookRecordDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCAuthorBookRecordDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}
	
	@Override
	public List<AuthorBookRecord> getAllAuthorBookRecords() {
		List<AuthorBookRecord> authorBookRecordList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM author_book;");
		while(results.next()) {
			AuthorBookRecord abr = new AuthorBookRecord();
			abr = mapRowToBookAuthorRecordList(results);
			authorBookRecordList.add(abr);
		}
		return authorBookRecordList;
	}
	
	private AuthorBookRecord mapRowToBookAuthorRecordList(SqlRowSet results) {
		AuthorBookRecord authorBookRecord = new AuthorBookRecord();
		Author a = new Author();
		int authorId = results.getInt("author_id");
		a.setId(authorId);
		SqlRowSet authorResults = jdbcTemplate.queryForRowSet("SELECT * "
															+ "FROM author "
															+ "WHERE author_id = ?;",
															authorId);	
		a = mapRowToAuthor(authorResults);
		authorBookRecord.setAuthor(a);
		
		Book b = new Book();
		int bookId = results.getInt("book_id");
		a.setId(bookId);
		SqlRowSet bookResults = jdbcTemplate.queryForRowSet("SELECT * "
															+ "FROM book "
															+ "WHERE book_id = ?;",
															bookId);	
		b = mapRowToBook(bookResults);
		authorBookRecord.setBook(b);
		return authorBookRecord;
	}
	
	private Author mapRowToAuthor(SqlRowSet results) {
		Author author = new Author();
		author.setId(results.getInt("author_id"));
		author.setBookId(results.getInt("book_id"));
		author.setFirstName(results.getString("first_name"));
		author.setMiddleInitials(results.getString("middle_initials"));
		author.setLastName(results.getString("last_name"));
		author.setPostNominalInitials(results.getString("post_nominal_initials"));
		return author;
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

