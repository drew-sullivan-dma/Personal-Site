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
	public List<Author> getAllAuthors() {
		List<Author> authorList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM author "
													  + "ORDER BY author.last_name ASC;");
		while(results.next()) {
			Author a = new Author();
			a = mapRowToAuthor(results);
			authorList.add(a);
		}
		return authorList;
	}
	
	@Override
	public List<String> getAllAuthorFirstNamesByBookId(int id) {
		List<String> authorFirstNameList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT a.first_name "
													  + "FROM author_book ab "
													  + "JOIN book b ON ab.book_id = b.book_id "
													  + "JOIN author a ON ab.author_id = a.author_id "
													  + "WHERE b.book_id = ?;", id);
		while(results.next()) {
			String fn = results.getString("first_name");
			authorFirstNameList.add(fn);
		}
		Author a = new Author();
		a.setAuthorFirstNames(authorFirstNameList);
		return authorFirstNameList;
	}

	@Override
	public List<String> getAllAuthorMiddleInitialsByBookId(int id) {
		List<String> authorMiddleInitialsList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT a.middle_initials "
													  + "FROM author_book ab "
													  + "JOIN book b ON ab.book_id = b.book_id "
													  + "JOIN author a ON ab.author_id = a.author_id "
													  + "WHERE b.book_id = ?;", id);
		while(results.next()) {
			String mi = results.getString("middle_initials");
			authorMiddleInitialsList.add(mi);
		}
		Author a = new Author();
		a.setAuthorMiddleInitials(authorMiddleInitialsList);
		return authorMiddleInitialsList ;
	}

	@Override
	public List<String> getAllAuthorLastNamesByBookId(int id) {
		List<String> authorLastNameList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT a.last_name "
													  + "FROM author_book ab "
													  + "JOIN book b ON ab.book_id = b.book_id "
													  + "JOIN author a ON ab.author_id = a.author_id "
													  + "WHERE b.book_id = ?;", id);
		while(results.next()) {
			String afn = results.getString("last_name");
			authorLastNameList.add(afn);
		}
		Author a = new Author();
		a.setAuthorLastNames(authorLastNameList);
		return authorLastNameList;
	}

	@Override
	public List<String> getAllAuthorPostNominalInitialsByBookId(int id) {
		List<String> authorPostNominalInitialsList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT a.post_nominal_initials "
													  + "FROM author_book ab "
													  + "JOIN book b ON ab.book_id = b.book_id "
													  + "JOIN author a ON ab.author_id = a.author_id "
													  + "WHERE b.book_id = ?;", id);
		while(results.next()) {
			String apni = results.getString("post_nominal_initials");
			authorPostNominalInitialsList.add(apni);
		}
		Author a = new Author();
		a.setAuthorPostNominalInitials(authorPostNominalInitialsList);
		return authorPostNominalInitialsList;
	}
	
	private Author mapRowToAuthor(SqlRowSet results) {
		Author author = new Author();
		author.setId(results.getInt("author_id"));
		author.setBookId(results.getInt("book_id"));
		return author;
	}


}

