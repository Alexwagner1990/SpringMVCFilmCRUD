<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Add a Film</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
  </head>
  <body>
    <form action="AddFilm.do" name="film" method="POST">
    	<input type="hidden" name="id">
      <label for="title">Title:</label>
      <input type="text" name="title">
      <br>
      <label for="description">Description:</label>
      <input type="text" name="description">
      <br>
      <label for="release_year">Release Year:</label>
      <input type="text" name="release_year">
      <br>
      <label for="language_id">Language Id:</label>
      <input type="text" name="language_id">1-6
      <br>
      <label for="rental_duration">Rental Duration:</label>
      <input type="text" name="rental_duration">
      <br>
      <label for="rental_rate">Rental Rate:</label>
      <input type="text" name="rental_rate">
      <br>
      <label for="length">Length:</label>
      <input type="text" name="length">
      <br>
      <label for="replacement_cost">Replacement Cost:</label>
      <input type="text" name="replacement_cost">
      <br>
      <label for="rating">Rating:</label>
      <input type="text" name="rating">
		G, PG, PG13, R, NC17 
      <br>
      <label for="special_features">Special Features:</label>
      <input type="text" name="special_features">
    
      <br>
      <input type="submit" value="AddFilm">
    </form>
  </body>
</html>