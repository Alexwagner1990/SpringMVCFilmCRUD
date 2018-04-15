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
<title>Find a Film</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">

		<c:choose>
			<c:when test="${not empty film}">
				<h2>Film Found!</h2>
				<ul>
					<li>Film ID: ${film.id }</li>
					<li>Film Title: ${film.title }</li>
					<li>Film Category: ${film.category.categoryName}</li>
					<li>Film Description: ${film.description }</li>
					<li>Film Release Year: ${film.release_year }</li>
					<li>Film Language (ID): ${film.language.language_name} (${film.language_id })</li>
					<li>Film Rental Duration: ${film.rental_duration }</li>
					<li>Film Rental Rate: ${film.rental_rate }</li>
					<li>Film Length: ${film.length }</li>
					<li>Film Replacement Cost: ${film.replacement_cost }</li>
					<li>Film Rating: ${film.rating }</li>
					<li>Film Special Features: ${film.special_features }</li>
					<li>Film Cast:
					<c:forEach var="actor" items="${film.actors }">
					${actor.firstName} ${actor.lastName}, 
					</c:forEach></li>
				</ul>
				<br>
				<h2>Update This Film!</h2>
				<form action="UpdateFilm.do" name="update" method="POST">
				<input type="hidden" value="${film.id }" name="id">
				<table>
					<tr><td>Title</td> <td><input label="Title" type="text" value="${film.title }" name="title"></td></tr>
					<tr><td>Description</td> <td><input label="Description" type="text" value="${film.description }" name="description"></td></tr>
					<tr><td>Release Year</td> <td><input label="Release Year" type="text"
						value="${film.release_year }" name="release_year"></td></tr> 
					<tr><td>Language ID</td><td>
					<input label="Language ID" type="text"
						value="${film.language_id }" name="language_id">
						</td></tr>
					<tr><td>Rental Duration</td> <td><input label="Rental Duration" type="text"
						value="${film.rental_duration }" name="rental_duration"></td></tr> 
					<tr><td>Rental Rate</td><td><input
						label="Rental Rate" type="text" value="${film.rental_rate }" name="rental_rate"></td></tr>
					<tr><td>Length</td><td><input
						label="Length" type="text" value="${film.length }" name="length"></td></tr>						
					<tr><td>Replacement Cost</td> <td><input label="Replacement Cost" type="text"
						value="${film.replacement_cost }" name="replacement_cost"></td></tr> 
					<tr><td>Rating </td><td>
					<input label="Rating" type="text"
						value="${film.rating }" name="rating">
					</td></tr>
					<tr><td>Special Features</td> <td><input label="Special Features" type="text"
						value="${film.special_features }" name="special_features"></td></tr> 
				</table>
						<input type="submit" value="UPDATE"><br>	
				</form>
				<h2>Delete This Film!</h2>
			<form action="DeleteFilm.do" name="delete" method="POST">
			<input type="hidden" value="${film.id }" name="id">
			<input type="submit" value="DELETE">
			</form>
			</c:when>
			<c:otherwise>
				<h2>No Film Found, Try Again!</h2>
			</c:otherwise>
		</c:choose>

		<p>
			<a href="index.html" class="btn btn-secondary" role="button">Return Home</a>
		</p>

	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
			crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>