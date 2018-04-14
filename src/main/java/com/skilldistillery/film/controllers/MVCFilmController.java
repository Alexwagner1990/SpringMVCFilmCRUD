package com.skilldistillery.film.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.film.dao.DatabaseAccessorInterface;
import com.skilldistillery.film.entities.Film;

@Controller
public class MVCFilmController {
	@Autowired
	private DatabaseAccessorInterface dao;

	public void setStateDAO(DatabaseAccessorInterface dao) {
		this.dao = dao;
	}

	@RequestMapping(path = "AddFilm.do", method = RequestMethod.POST)
	public ModelAndView addFilm(Film film) {
		ModelAndView mv = new ModelAndView();
		Film f = dao.addFilm(film);
		mv.addObject("film", f);
		mv.setViewName("WEB-INF/findAFilm.jsp");
		return mv;
	}

	@RequestMapping(path = "DeleteFilm.do", params = "delete", method = RequestMethod.POST)
	public ModelAndView deleteFilm(int film) {
		ModelAndView mv = new ModelAndView();
		Film f = dao.deleteFilm(film);
		mv.addObject("film", f);		
		mv.setViewName("WEB-INF/findAFilm.jsp");
		return mv;
	}
	@RequestMapping(path = "FilmById.do", params = "filmId", method = RequestMethod.POST)
	public ModelAndView getFilmById(int filmId) {
		ModelAndView mv = new ModelAndView();
		Film f = dao.getFilmById(filmId);
		mv.addObject("film", f);		
		mv.setViewName("WEB-INF/findAFilm.jsp");
		return mv;
	}
	@RequestMapping(path = "UpdateFilm.do", params = "FilmById", method = RequestMethod.POST)
	public ModelAndView updateFilm(int filmId) {
		ModelAndView mv = new ModelAndView();
		Film f = dao.getFilmById(filmId);
		mv.addObject("film", f);		
		mv.setViewName("WEB-INF/findAFilm.jsp");
		return mv;
	}
	@RequestMapping(path = "FindByKeyword.do", params = "name", method = RequestMethod.POST)
	public ModelAndView findFilmByKeyword(String search) {
		ModelAndView mv = new ModelAndView();
		List<Film> f = dao.getFilmBySearchTerm(search);
		mv.addObject("film", f);		
		mv.setViewName("WEB-INF/result.jsp"); //dont have a jsp for this yet
		return mv;
	}
}