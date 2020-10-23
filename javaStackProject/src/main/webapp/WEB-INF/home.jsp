<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1" />
	<title>RPG Game</title>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>
	<div class="container-fluid card">
	<img src="https://cdna.artstation.com/p/assets/images/images/019/340/904/original/matthew-harris-edwards-campfire.gif?1563053132" class="card-img" alt="Responsive image">
		<div class="row card-img-overlay">
			<div class="col text-white ml-2">
				<h1>Welcome, ${user.userName}</h1>
			</div>
			<div class="col text-right">
				<h3><a href="/logout">Logout</a></h3>
			</div>
		</div>
		<div class="row mt-5 card-img-overlay">
			<div class="col">
				<div class="row text-white ml-3">
					<h3>Your Heros</h3>
				</div>
				<div class="row mb-5 mt-5 mx-2">
					<c:forEach items="${allHeros}" var="hero">
					<div class="col border border-dark m-3 bg-dark text-white">
						<div class="row">
							<div class="col"></div>
							<div class="col"><h4><a href="/heros/${hero.id}">${hero.name}</a></h4></div>
							<div class="col"></div>
						</div>
						<div class="row">
							<div class="col">Type:</div>
							<div class="col">${hero.type}</div>
						</div>
						<div class="row">
							<div class="col">Health:</div>
							<div class="col">${hero.health}</div>
						</div>
						<div class="row">
							<div class="col">Strength:</div>
							<div class="col">${hero.strength}</div>
						</div>
						<div class="row">
							<div class="col">Intelligence:</div>
							<div class="col">${hero.intelligence}</div>
						</div>
						<div class="row">
							<div class="col">Sneak:</div>
							<div class="col">${hero.sneak}</div>
						</div>
						</div>
					</c:forEach>
				</div>
				<div class="row mt-3 pt-3">
					<div class="col text-center">
						<h3><a href="/createHero">Create a new Hero</a></h3>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>

</html>