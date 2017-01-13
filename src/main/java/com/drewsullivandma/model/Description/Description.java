package com.drewsullivandma.model.Description;

import java.util.List;

public class Description {
	
	private int id;
	private List<String> description;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<String> getDescription() {
		return description;
	}
	public void setDescription(List<String> description) {
		this.description = description;
	}
	
}
