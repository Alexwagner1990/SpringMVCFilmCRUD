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
<title>Find an Actor</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">

		<c:choose>
			<c:when test="${not empty actor}">
				<h2>Actor Found!</h2>
				<ul>
					<li>Actor ID: ${actor.id }</li>
					<li>Actor First Name: ${actor.firstName}</li>
					<li>Actor Last Name: ${actor.lastName}</li>
				</ul>
				Starred In:
				<ul>
					<c:if test="${not empty filmlist}">
					<c:forEach var="f" items="${filmlist}">
					<li>${f.title} (${f.id})</li>
					</c:forEach>
					</c:if>
				</ul> 
				<br>
				<h2>Update This Actor!</h2>
				<form action="UpdateActor.do" name="update" method="POST">
				<input type="hidden" value="${actor.id }" name="id">
				<table>
					<tr><td>First Name</td> <td><input label="FirstName" type="text" value="${actor.firstName }" name="firstName"></td></tr>
					<tr><td>Last Name</td> <td><input label="LastName" type="text" value="${actor.lastName }" name="lastName"></td></tr>
				</table>
						<input type="submit" value="UPDATE"><br>	
<%-- 				</form>
				<h2>Delete This Actor!</h2>
			<form action="DeleteActor.do" name="delete" method="POST">
			<input type="hidden" value="${actor.id }" name="id">
			<input type="submit" value="DELETE">
			</form> --%>
			</c:when>
			<c:otherwise>
				<h2>No Actor Found, Try Again!</h2>
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