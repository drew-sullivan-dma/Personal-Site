package com.drewsullivandma.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class InputParser {
	
	public static final int NUM_AUTHOR_TRAITS = 4;
	private String bookTitle;
	private int numCategories;
	private int numAuthors;
	private int numDescriptions;
	private List<String> rawCategoryElements = new ArrayList<>();
	private List<String> rawAuthorElements = new ArrayList<>();
	private List<String> rawDescriptionElements = new ArrayList<>();
	
	public Book getBookRecord(Map<String, String> formInput) {
		Book book = new Book();
		extractBookElementsToRawElementLists(formInput);
		setNumCategories(rawCategoryElements);
		setNumAuthors(rawAuthorElements);
		setNumDescriptions(rawDescriptionElements);
		printList(rawCategoryElements);
		printList(rawAuthorElements);
		printList(rawDescriptionElements);
		List<Category> categories = translateRawCategoryElementsToCategoryList(rawCategoryElements);
		List<Author> authors = translateRawAuthorElementsToAuthorList(rawAuthorElements);
		List<Description> descriptions = translateRawDescriptionElementsToDescriptionList(rawDescriptionElements);
		book.setTitle(bookTitle);
		book.setCategories(categories);
		book.setAuthors(authors);
		book.setDescriptions(descriptions);
		return book;
	}
	
	private void setNumAuthors(List<String> rawAuthorElements) {
		this.numAuthors = rawAuthorElements.size() / NUM_AUTHOR_TRAITS;
	}
	
	private void setNumDescriptions(List<String> rawDescriptionElements) {
		this.numDescriptions = rawDescriptionElements.size();
	}
	
	private void setNumCategories(List<String> rawCategoryElements) {
		this.numCategories = rawCategoryElements.size();
	}
	
	private void extractBookElementsToRawElementLists(Map<String, String> formInput) {
		for (Map.Entry<String, String> entry : formInput.entrySet()) {
			System.out.println(entry.getKey() + " : " + entry.getValue());
			if(entry.getKey().substring(0, 1).toLowerCase().equals("t")){
				this.bookTitle = entry.getValue();
			}
			if(entry.getKey().substring(0, 1).toLowerCase().equals("a")){
				rawAuthorElements.add(entry.getValue());
			}
			if(entry.getKey().substring(0, 1).toLowerCase().equals("d")) {
				rawDescriptionElements.add(entry.getValue());
			}
			if(entry.getKey().substring(0, 1).toLowerCase().equals("c")) {
				rawCategoryElements.add(entry.getValue());
			}
		}
	}
	
	private void printList(List<String> list) {
		for(String str : list) {
			System.out.println(str);
		}
	}
	
	private List<Category> translateRawCategoryElementsToCategoryList(List<String> rawCategoryElements) {
		List<Category> categories = new ArrayList<>();
		int i = 0;
		while(numCategories >= 1) {
			Category c = new Category();
			System.out.println(rawCategoryElements.get(i));
			c.setCategoryId(Integer.parseInt(rawCategoryElements.get(i)));
			categories.add(c);
			numCategories--;
			i++;
		}
		return categories;
	}
	
	private List<Author> translateRawAuthorElementsToAuthorList(List<String> rawAuthorElements) {
		List<Author> authors = new ArrayList<>();
		int i = 0;
		while(numAuthors >= 1) {
			Author a = new Author();
			a.setFirstName(rawAuthorElements.get(i));
			a.setMiddleInitials(rawAuthorElements.get(i + 1));
			a.setLastName(rawAuthorElements.get(i + 2));
			a.setPostNominalInitials(rawAuthorElements.get(i + 3));
			authors.add(a);
			i += NUM_AUTHOR_TRAITS;
			numAuthors--;
		}
		return authors;
	}
	
	private List<Description> translateRawDescriptionElementsToDescriptionList(List<String> rawDescriptionElements) {
		List<Description> descriptions = new ArrayList<>();
		int i = 0;
		while(numDescriptions >= 1) {
			Description d = new Description();
			d.setDescription(rawDescriptionElements.get(i));
			descriptions.add(d);
			numDescriptions--;
			i++;
		}
		return descriptions;
	}

}
