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
  <h1>Add a Film to Database</h1>
    <form action="AddFilm.do" name="film" method="POST">
    	<input type="hidden" name="id" value="0">
    	<table>
      <tr><td><label for="title">Title:</td></label>
      <td><input type="text" name="title" value="Placeholder Title"><td>
      </tr>
      <tr><td><label for="description">Description:</label></td>
      <td><input type="text" name="description" value="Placeholder Text"></td>
      </tr>
      <tr><td><label for="release_year">Release Year:</label></td>
      <td><input type="text" name="release_year" value="2000"></td>
      </tr>
      <tr><td><label for="language_id">Language Id:</label></td><td>
      <input type="text" name="language_id" value="1">1-6</td>
      </tr>
      <tr><td><label for="rental_duration">Rental Duration:</label></td><td>
      <input type="text" name="rental_duration" value="10"></td>
      </tr>
      <tr><td><label for="rental_rate">Rental Rate:</label></td>
      <td><input type="text" name="rental_rate" value="5"></td>
      </tr>
      <tr><td><label for="length">Length:</label></td><td>
      <input type="text" name="length" value="10"></td>
      </tr>
      <tr><td><label for="replacement_cost">Replacement Cost:</label></td>
      <td><input type="text" name="replacement_cost" value="10"></td>
      </tr>
      <tr><td><label for="rating">Rating:</label></td>
      <td><input type="text" name="rating" value="G">
		G, PG, PG13, R, NC17</td> 
      </tr>
      <tr><td><label for="special_features">Special Features:</label></td>
      <td><input type="text" name="special_features" value="Trailers"></td></tr>
    </table>
      <br>
      <input type="submit" value="AddFilm">
    </form>
    <h1>Add an Actor to Database</h1>
    <form action="addActor.do" name="actor" method="POST">
    <input type="hidden" name="id" value="0">
    <table>
    <tr><td>First Name:</td><td><input type="text" name="firstName"></td></tr>
    <tr><td>Last Name:</td><td><input type="text" name="lastName"></td></tr>
    </table>
    	<input type="submit" value="Add Actor">
    </form>
  </body>
</html>