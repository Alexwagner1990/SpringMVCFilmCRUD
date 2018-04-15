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
				<h2>Film Facts:</h2>
				<ul>
					<li>Film ID: ${film.id }</li>
					<li>Film Title:${film.title }</li>
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
				<input type="hidden" value="${film.category }" name="category">
				<input type="hidden" value="${film.language }" name="Language">
					Title<input label="Title" type="text" value="${film.title }" name="title"><br>
					Description<input label="Description" type="text" value="${film.description }" name="description"><br>
					Release Year<input label="Release Year" type="text"
						value="${film.release_year }" name="release_year"><br> 
					Language ID<input
						label="Language ID" type="text" value="${film.language_id }" name="language_id"><br>
					Rental Duration<input label="Rental Duration" type="text"
						value="${film.rental_duration }" name="rental_duration"><br> 
					Replacement Rate	<input
						label="Rental Rate" type="text" value="${film.rental_rate }" name="rental_rate"><br>
					Length	<input
						label="Length" type="text" value="${film.length }" name="length"><br>
					Replacement Cost<input label="Replacement Cost" type="text"
						value="${film.replacement_cost }" name="replacement_cost"><br> 
					Rating <input
						label="Rating" type="text" value="${film.rating }" name="rating"><br>
					Special Features<input label="Special Features" type="text"
						value="${film.special_features }" name="special_features"><br> 
						<input type="submit" value="UPDATE"><br>
				</form>
				<br>
				<h2>Delete This Film!</h2>
			<form action="DeleteFilm.do" name="delete" method="POST">
			<input type="hidden" value="${film.id }">
			<input type="submit" value="DELETE">
			</form>
				<br><p>****************************************************</p>
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