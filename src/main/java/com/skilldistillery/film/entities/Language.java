package com.skilldistillery.film.entities;

public class Language {
	
	private int id;
	private String language_name;
	
	
	public Language() {
		
	}
	
	public Language(int id, String name) {
		super();
		this.id = id;
		this.language_name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLanguage_name() {
		return language_name;
	}

	public void setLanguage_name(String language_name) {
		this.language_name = language_name;
	}
	
	
}
