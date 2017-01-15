package com.drewsullivandma.model.Description;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCDescriptionDAO implements DescriptionDAO { 

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCDescriptionDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}

	@Override
	public List<Description> getAllDescriptionsByBookId(int id) {
		List<Description> descriptionList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM book_description bd "
													  + "JOIN book b ON bd.book_id = b.book_id "
													  + "JOIN description d ON bd.description_id = d.description_id "
													  + "WHERE b.book_id = ?;", id);
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

