package com.drewsullivandma.model.Author;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.drewsullivandma.model.Book.Book;

@Component
public class JDBCAuthorDAO implements AuthorDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCAuthorDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}

	@Override
	public List<Author> getAllAuthorsByBookId(int id) {
		List<Author> authorList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM author_book ab "
													  + "JOIN book b ON ab.book_id = b.book_id "
													  + "JOIN author a ON ab.author_id = a.author_id "
													  + "WHERE b.book_id = ?;", id);
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


}

