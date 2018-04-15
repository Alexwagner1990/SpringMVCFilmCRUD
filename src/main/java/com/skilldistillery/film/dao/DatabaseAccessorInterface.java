package com.skilldistillery.film.dao;

import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.entities.FilmCategory;
import com.skilldistillery.film.entities.Language;

public interface DatabaseAccessorInterface {
	  public Film getFilmById(int filmId);
	  public Actor getActorById(int actorId);
	  public List<Actor> getActorsByFilmId(int filmId);
	  public List<Film> getFilmBySearchTerm(String search);
	  public Language getLanguageName(Film filmWithoutLanguage);
	  public FilmCategory getFilmCategory(Film filmWithNoDetails);
	  public Film addFilm(Film film);
	  public boolean deleteFilm(int film);
	  public Film updateFilm(Film film);
}
