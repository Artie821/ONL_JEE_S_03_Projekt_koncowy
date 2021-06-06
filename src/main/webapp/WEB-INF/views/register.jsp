<%--
  Created by IntelliJ IDEA.
  User: kret3
  Date: 24.05.2021
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.24/datatables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
            integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<section>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#mainNavigation" aria-controls="mainNavigation" aria-expanded="false"
                aria-label="Pokaż lub ukryj nawigację">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="/">
            <img src="../../../avatar.png" width="40" height="40" class="d-inline-block align-top rounded"
                 alt="idź na start">
            Wymień Książkę
        </a>

        <div class="collapse navbar-collapse" id="mainNavigation">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ">
                    <a class="nav-link" href="/howitsworks">Jak to działa?</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/usersbooks">Książki naszych użytkowników</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/admin/register">Rejestracja</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/login">Logowanie</a>
                </li>
            </ul>
        </div>
    </nav>
</section>
<section style="width: 99%">
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <h3 style="float:left"> REJESTRACJA UŻYTKOWNIKA </h3>
        </div>
    </div>
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <c:if test="${login}">
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    Taki login już istnieje!
                </div>
            </c:if>
            <c:if test="${email}">
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    Taki email już istnieje!
                </div>
            </c:if>
                <form:form method="post" modelAttribute="user">
                    <div class="form-group">
                        <label for="username">Login:</label>
                        <form:input path="username" class="form-control" placeholder="Podaj login minimum 6 znaków"/>
                        <form:errors path="username" class="text-danger">
                            <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                Login musi posiadać minimum 6 a maksimum 50 znaków!
                            </div>
                        </form:errors>
                    </div>
                    <div class="form-group">
                        <label for="name">Imię:</label>
                        <form:input path="name" class="form-control" placeholder="Wpisz imię"/>
                        <form:errors path="name" class="text-danger">
                            <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                Imię musi mieć conajmniej 3 znaki!
                            </div>
                        </form:errors>
                    </div>
                    <div class="form-group">
                        <label for="surname">Nazwisko:</label>
                        <form:input path="surname" class="form-control" placeholder="Wpisz nazwisko"/>
                        <form:errors path="surname" class="text-danger">
                            <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                Nazwisko musi mieć conajmniej 3 znaki!
                            </div>
                        </form:errors>
                    </div>
                    <div class="form-group">
                        <label for="password">Hasło:</label>
                        <form:password path="password" class="form-control" placeholder="Podaj hasło"/>
                        <form:errors path="password" class="text-danger">
                        <div class="alert alert-danger alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Hasło musi posiadać minimum 6 a maksimum 50 znaków!
                        </div>
                        </form:errors>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <form:input path="email" class="form-control" placeholder="Podaj email"/>
                        <form:errors path="email" class="text-danger">
                            <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                Wpisz poprawny email!
                            </div>
                        </form:errors>
                    </div>
                    <div class="form-group">
                        <label for="phone">Numer telefonu:</label>
                        <form:input type="number" path="phone" class="form-control" placeholder="Podaj numer telefonu"/>
                        <form:errors path="phone" class="text-danger"/>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary">Rejestruj!</button>
                </form:form>
        </div>
    </div>
</section>
<script src="../../../app.js" type="text/javascript"></script>
</body>
</html>