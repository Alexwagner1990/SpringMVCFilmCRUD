<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<c:when test="${not empty films}">
				<h2>List Of Films:</h2>
				<c:forEach var="film" items="${films }">
				<ul>
					<li>Film ID: ${film.id }</li>
					<li>Film Title:</li>
					<li>Film Description: ${film.description }</li>
					<li>Film Release Year: ${film.release_year }</li>
					<li>Film Language ID: ${film.language_id }</li>
					<li>Film Rental Duration: ${film.rental_duration }</li>
					<li>Film Rental Rate: ${film.rental_rate }</li>
					<li>Film Length: ${film.length }</li>
					<li>Film Replacement Cost: ${film.replacement_cost }</li>
					<li>Film Rating: ${film.rating }</li>
					<li>Film Special Features: ${film.special_features }</li>  					<li><form action="FilmById.do" name= "${film.id}" method="POST">
<!-- 					<li><input type="submit" value="More Details And Actions"/>
					</form></li> -->
				</ul> 
				<h2>Update This Film!</h2>
				<form action="UpdateFilm.do" name="update">
				<input type="hidden" value="${film.id }">
					Title<input label="Title" type="text" value="${film.title }"><br>
					Description<input label="Description" type="text" value="${film.description }"><br>
					Release Year<input label="Release Year" type="text"
						value="${film.release_year }"><br> 
					Language ID<input
						label="Language ID" type="text" value="${film.language_id }"><br>
					Rental Duration<input label="Rental Duration" type="text"
						value="${film.rental_duration }"><br> 
					Replacement Rate	<input
						label="Rental Rate" type="text" value="${film.rental_rate }"><br>
					Replacement Cost<input label="Replacement Cost" type="text"
						value="${film.replacement_cost }"><br> 
					Rating <input
						label="Rating" type="text" value="${film.rating }"><br>
					Special Features<input label="Special Features" type="text"
						value="${film.special_features }"><br> <input
						type="submit" value="UPDATE"><br>
				</form>
				<h2>Delete This Film!</h2>
			<form action="DeleteFilm.do" name="delete" method="POST">
			<input type="hidden" value="${film.id }">
			<input type="submit" value="DELETE">
			</form>
				</c:forEach>

				<br>
				
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