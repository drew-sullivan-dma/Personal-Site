package com.drewsullivandma.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCCategoryDAO implements CategoryDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCCategoryDAO(DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
	}
	
	@Override
	public List<Category> getAllCategories() {
		List<Category> categoryList = new ArrayList<>();
		SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT * "
													  + "FROM category;");
		while(results.next()) {
			Category c = new Category();
			c = mapRowToCategory(results);
			categoryList.add(c);
		}
		return categoryList;
	}
	
	private Category mapRowToCategory(SqlRowSet results) {
		Category category = new Category();
		category.setCategoryId(results.getInt("category_id"));
		category.setName(results.getString("name"));
		return category;
	}
	
}









