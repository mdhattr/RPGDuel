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
        <div class="row p-3 card-img-overlay"></div>
        <div class="row card-img-overlay">
            <div class="col-3"></div>
            <div class="col-6 pt-3 m-2 bg-dark mb-auto text-white rounded">
                <h1>Registration</h1>
                <p>
                    <form:errors path="user.*" />
                </p>
                <form:form action="/registration" method="post" modelAttribute="user">
                    <div class="form-group row">
                        <form:label path="userName" class="col-sm-4 col-form-label">Username:</form:label>
                        <div class="col-sm-10">
                            <form:input path="userName" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="email" class="col-sm-4 col-form-label">Email:</form:label>
                        <div class="col-sm-10">
                            <form:input type="email" path="email" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="password" class="col-sm-4 col-form-label">Password:</form:label>
                        <div class="col-sm-10">
                            <form:input type="password" path="password" class="form-control" />
                            <small id="passwordHelpInline" class="text-white">
                                Must be at least 8 characters long.
                            </small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="passwordConfirmation" class="col-sm-4 col-form-label">Confirm Password:
                        </form:label>
                        <div class="col-sm-10">
                            <form:input type="password" path="passwordConfirmation" class="form-control" />
                        </div>
                    </div>
                    <button class="btn btn-danger btn-lg">Register</button>
                </form:form>
                <p class="m-1">Already registered?</p>
                <p class="m-1"><a class="text-white" href="/login">Click here to go login</a></p>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
</body>

</html>