package com.drewsullivandma.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.drewsullivandma.model.Author;
import com.drewsullivandma.model.AuthorBookRecord;
import com.drewsullivandma.model.Book;

@Component
public class JDBCAuthorBookRecordDAO implements AuthorBookRecordDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCAuthorBookRecordDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}
	
	@Override
	public List<AuthorBookRecord> getAllBookAuthorRecords() {
		List<AuthorBookRecord> bookAuthorRecordList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM category "
													  + "ORDER BY category.name ASC;");
		while(results.next()) {
			AuthorBookRecord b = new AuthorBookRecord();
			b = mapRowToBookAuthorRecordList(results);
			bookAuthorRecordList.add(b);
		}
		return bookAuthorRecordList;
	}
	
	private AuthorBookRecord mapRowToBookAuthorRecordList(SqlRowSet results) {
		AuthorBookRecord bookAuthorRecord = new AuthorBookRecord();
		
		Author a = new Author();
		Book b = new Book();
		
		bookAuthorRecord.setCategoryId(results.getInt("category_id"));
		bookAuthorRecord.setName(results.getString("name"));
		return bookAuthorRecord;
	}

}

