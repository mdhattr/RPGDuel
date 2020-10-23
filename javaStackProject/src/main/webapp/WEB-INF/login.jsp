<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Register</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <div class="container-fluid card" style="height:900px;">
    	<img src="https://i.redd.it/s06iqirv81j31.gif" class="card-img" alt="Responsive image">
        <div class="row card-img-overlay p-3"></div>
        <div class="row card-img-overlay mt-5">
            <div class="col-3"></div>
            <div class="col-6 pt-3 m-2 bg-dark text-white rounded mb-auto">
                <h1>Login</h1>
                <p>
                    <c:out value="${error}" />
                </p>
                <form action="/login" method="post">
                    <div class="form-group row">
                        <label path="email" class="col-sm-4 col-form-label">Email:</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label path="password" class="col-sm-4 col-form-label">Password:</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" />
                        </div>
                    </div>
                    <button class="btn btn-danger btn-lg">Login</button>
                    </form>
                    <p class="m-1">Not registered?</p>
                    <p class="m-1"><a class="text-white" href="/registration">Click here to go Register</a></p>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
</body>
</html>