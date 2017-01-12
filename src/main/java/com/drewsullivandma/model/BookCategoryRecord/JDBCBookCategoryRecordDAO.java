package com.drewsullivandma.model.BookCategoryRecord;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.drewsullivandma.model.Book.Book;
import com.drewsullivandma.model.Category.Category;

@Component
public class JDBCBookCategoryRecordDAO implements BookCategoryRecordDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCBookCategoryRecordDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}

	@Override
	public List<BookCategoryRecord> getAllBookCategoryRecords() {
		List<BookCategoryRecord> bookCategoryRecordList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM category "
													  + "ORDER BY category.name ASC;");
		while(results.next()) {
			BookCategoryRecord bcr = new BookCategoryRecord();
			bcr = mapRowToBookCategoryRecordList(results);
			bookCategoryRecordList.add(bcr);
		}
		return bookCategoryRecordList;
	}
	
	private BookCategoryRecord mapRowToBookCategoryRecordList(SqlRowSet results) {
		BookCategoryRecord bcr = new BookCategoryRecord();
		
		Book b = new Book();
		Category c = new Category();
		
		bcr.setCategoryId(results.getInt("category_id"));
		bcr.setName(results.getString("name"));
		return bcr;
	}

}

