package com.skilldistillery.film.controllers;

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

  @RequestMapping(path = "GetStateData.do", params = "name", method = RequestMethod.GET)
  public ModelAndView getStateByName(String name) {
    ModelAndView mv = new ModelAndView();
    Film f = dao.getStateByName(name);
    mv.addObject("state", s);
    mv.setViewName("WEB-INF/result.jsp");
    return mv;
  }

  @RequestMapping(path = "GetStateData.do", params = "abbr", method = RequestMethod.GET)
  public ModelAndView getStateByAbbreviation(String abbr) {
    ModelAndView mv = new ModelAndView();
    Film f = dao.getStateByAbbreviation(abbr);
    mv.addObject("state", s);
    mv.setViewName("WEB-INF/result.jsp");
    return mv;
  }