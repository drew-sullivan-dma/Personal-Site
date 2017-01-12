package com.drewsullivandma.model.BookDescriptionRecord;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.drewsullivandma.model.Book.Book;
import com.drewsullivandma.model.Description.Description;

@Component
public class JDBCBookDescriptionRecordDAO implements BookDescriptionRecordDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCBookDescriptionRecordDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}

	@Override
	public List<BookDescriptionRecord> getAllBookDescriptionRecords() {
		List<BookDescriptionRecord> bookDescriptionRecordList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM category "
													  + "ORDER BY category.name ASC;");
		while(results.next()) {
			BookDescriptionRecord bdr = new BookDescriptionRecord();
			bdr = mapRowToBookDescriptionRecordList(results);
			bookDescriptionRecordList.add(bdr);
		}
		return bookDescriptionRecordList;
	}
	
	private BookDescriptionRecord mapRowToBookDescriptionRecordList(SqlRowSet results) {
		BookDescriptionRecord bdr = new BookDescriptionRecord();
		
		Book b = new Book();
		Description d = new Description();
		
		bdr.setCategoryId(results.getInt("category_id"));
		bdr.setName(results.getString("name"));
		return bdr;
	}

}

