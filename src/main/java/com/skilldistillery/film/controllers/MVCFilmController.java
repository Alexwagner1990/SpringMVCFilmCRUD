package com.skilldistillery.film.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.film.dao.DatabaseAccessorInterface;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.entities.FilmCategory;
import com.skilldistillery.film.entities.Language;

@Controller
public class MVCFilmController {
	@Autowired
	private DatabaseAccessorInterface dao;

	public void setStateDAO(DatabaseAccessorInterface dao) {
		this.dao = dao;
	}

	@RequestMapping(path = "AddFilmStarter.do", method = RequestMethod.POST)
	public ModelAndView addFilmStart() {
		Film f = new Film();
		ModelAndView mv = new ModelAndView();
		mv.addObject(f);
		mv.setViewName("WEB-INF/addfilm.jsp");
		return mv;
	}
	
	@RequestMapping(path = "AddFilm.do", method = RequestMethod.POST)
	public ModelAndView addFilm(Film film) {
		System.out.println(film);
		ModelAndView mv = new ModelAndView();
		Film f = dao.addFilm(film);
		mv.addObject("film", f);
		mv.setViewName("WEB-INF/findAFilm.jsp");
		return mv;
	}

	@RequestMapping(path = "DeleteFilm.do", params = "id", method = RequestMethod.POST)
	public ModelAndView deleteFilm(@RequestParam(name="id") int film) {
		ModelAndView mv = new ModelAndView();
		Boolean f = dao.deleteFilm(film);
		mv.addObject("film", f);		
		mv.setViewName("WEB-INF/delete.jsp");
		return mv;
	}
	@RequestMapping(path = "FilmById.do", params = "filmId", method = RequestMethod.POST)
	public ModelAndView getFilmById(int filmId) {
		ModelAndView mv = new ModelAndView();
		Film f = dao.getFilmById(filmId);
//		FilmCategory c = dao.getFilmCategory(f);
//		Language l = dao.getLanguageName(f);
		mv.addObject("film", f);
//		mv.addObject("language", l);
//		mv.addObject("category", c);
		mv.setViewName("WEB-INF/findAFilm.jsp");
		return mv;
	}
	@RequestMapping(path = "UpdateFilm.do", method = RequestMethod.POST)
	public ModelAndView updateFilm(Film film) {
//		System.out.println(film);
		ModelAndView mv = new ModelAndView();
		Film f = dao.updateFilm(film);
//		System.out.println(f);
		mv.addObject("film", f);		
		mv.setViewName("WEB-INF/update.jsp");
		return mv;
	}
	@RequestMapping(path = "FindbyKeyword.do", method = RequestMethod.POST)
	public ModelAndView findFilmByKeyword(@RequestParam(name="keyword") String search) {
		ModelAndView mv = new ModelAndView();
		List<Film> f = dao.getFilmBySearchTerm(search);
		mv.addObject("films", f);		
		mv.setViewName("WEB-INF/findMultipleFilms.jsp"); 
		return mv;
	}
}