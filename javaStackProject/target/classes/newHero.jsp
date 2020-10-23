<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>RPG Game</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col text-right">
                <h3><a href="/logout">Logout</a></h3>
			</div>
        </div>
        <div class="row">
            <div class="col-sm-8">
                <h1>Create a new Hero!</h1>
                <form:form action="/processHero" method="post" modelAttribute="newHero">
                    <div class="form-group">
                        <label>Name your Character:</label>
                        <form:input path="name" class="form-control" />
                        <form:errors path="name" class="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Type:</label>
                        <form:select path="type" class="form-control">
                            <option value="Warrior">Warrior</option>
                            <option value="Wizard">Wizard</option>
                        </form:select>
                    </div>
                    <input type="hidden" value="150" name="health">
                    <div class="form-group">
                        <input type="submit" value="Create" class="btn btn-outline-primary">
                    </div>
                </form:form>
            </div>
        </div>
	</div>
</body>
</html>