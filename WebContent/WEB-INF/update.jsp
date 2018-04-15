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
			<c:when test="${empty film}">
				<h2>Film Not Updated!</h2>
				</c:when>
			<c:when test="${not empty film}">
				<h2>Film Updated!</h2>
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
			</c:when>
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