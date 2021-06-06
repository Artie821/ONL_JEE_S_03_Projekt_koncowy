<%--
  Created by IntelliJ IDEA.
  User: kret3
  Date: 24.05.2021
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../../../style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
            integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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
        <a class="navbar-brand" href="#">
            <img src="../../../avatar.png" width="40" height="40" class="d-inline-block align-top rounded"
                 alt="idź na start">
            Wymień Książkę
        </a>

        <div class="collapse navbar-collapse" id="mainNavigation">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../dashboard">Moja biblioteczka </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../addbook">Dodaj książkę</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/findbook" <c:if test="${newuser}">
                        hidden
                    </c:if>>Wyszukaj książkę</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/transaction/mytransations">Moje powiadomienia <span class="badge badge-pill badge-success">${number}</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/transaction/history">Historia <span class="badge badge-pill badge-success"></span></a>
                </li>
            </ul>

            <ul class="navbar-nav ml-sm-5 mt-2 mt-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userMenu" data-toggle="dropdown"
                       aria-haspopup="true"
                       aria-expanded="false">
                        <img class="rounded-circle" width="20" height="20" src="../../../avatar.png" alt="USER">
                        ${username}
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userMenu">
                        <a class="dropdown-item" href="#" hidden>Ustawienia</a>
                        <a class="dropdown-item" href="/transaction/mytransations">Powiadomienia <span class="badge badge-pill badge-success">${number}</span></a>
                        <div class="dropdown-divider"></div>
                        <sec:authorize access="isAuthenticated()">
                            <form action="<c:url value="/perform_logout"/>" method="post">
                                <input type="submit" class="dropdown-item" value="Wyloguj">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </sec:authorize>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</section>
<section style="width: 99%">
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <h3 style="float:left"> Detale książki: </h3>
            <a style="float:right" class="btn btn-outline-info" onclick="goBack()" >Powrót</a>
        </div>
    </div>
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <table class="table">
                <thead class="thead-light">
                <tr>
                    <th>ID:</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${Onebook.id} </td>
                </tr>
                <thead class="thead-light">
                <tr>
                    <th>TYTUŁ:</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${Onebook.title}</td>
                </tr>
                <thead class="thead-light">
                <tr>
                    <th>AUTOR:</th>
                </tr>
                </thead>
                <tr>
                    <td>${Onebook.author}</td>
                </tr>
                <thead class="thead-light">
                <tr>
                    <th>WYDAWCA:</th>
                </tr>
                </thead>
                <tr>
                    <td>${Onebook.publisher}</td>
                </tr>
                <thead class="thead-light">
                <tr>
                    <th>KATEGORIA:</th>
                </tr>
                </thead>
                <tr>
                    <td>${Onebook.type}</td>
                </tr>
                <thead class="thead-light">
                <tr>
                    <th>OPIS:</th>
                </tr>
                </thead>
                <tr>
                    <td>${Onebook.description}</td>
                </tr>
                <thead class="thead-light">
                <tr>
                    <th>ISBN:</th>
                </tr>
                </thead>
                <tr>
                    <td>${Onebook.isbn}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<script src="../../../app.js" type="text/javascript"></script>
</body>
</html>