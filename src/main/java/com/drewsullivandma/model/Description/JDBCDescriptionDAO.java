package com.drewsullivandma.model.Description;

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
public class JDBCDescriptionDAO implements DescriptionDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCDescriptionDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}

	@Override
	public List<Description> getAllDesciptions() {
		List<Description> descriptionList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM description;");
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
		return description;
	}
	
	@Override
	public List<String> getAllDescriptionsByBookId(int id) {
		List<String> descriptionList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT DISTINCT d.description "
													  + "FROM book_description bd "
													  + "JOIN book b ON bd.book_id = b.book_id "
													  + "JOIN description d ON bd.description_id = d.description_id "
													  + "ORDER BY b.title ASC;", id);
		while(results.next()) {
			String d = results.getString("description");
			descriptionList.add(d);
		}
		Description d = new Description();
		d.setDescription(descriptionList);
		return descriptionList;
	}

}

