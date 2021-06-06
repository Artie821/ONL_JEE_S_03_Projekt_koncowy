<%--
  Created by IntelliJ IDEA.
  User: kret3
  Date: 24.05.2021
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%--    <link rel="stylesheet" type="text/css" href="../../../dt/datatables.css">--%>
    <%--    <script type="text/javascript" charset="utf8" src="../../../dt/datatables.js"></script>--%>

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
                    <a class="nav-link" href="/user/dashboard">Moja biblioteczka </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/user/addbook">Dodaj książkę</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/findbook" <c:if test="${newuser}">
                        hidden
                    </c:if>>Wyszukaj książkę</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/transaction/mytransations">Moje powiadomienia <span
                            class="badge badge-pill badge-success">${number}</span></a>
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
                        <a class="dropdown-item" href="/transaction/mytransations">Powiadomienia <span
                                class="badge badge-pill badge-success">${number}</span></a>
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
            <h3 style="float:left"> Dodaj książkę: </h3>
            <a style="float:right" class="btn btn-outline-info" href="dashboard">Powrót</a>
        </div>
    </div>
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <label for="title">Wyszukaj w bazie Biblioteki Narodowej:</label>
            <form class="input-group my-2 my-lg-0" action="/user/edit" method="GET">
                <input class="form-control mr-sm-2 " type="number" placeholder="Wpisz numer ISBN" name="isbn" id="isbn">
                <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Wyszukaj</button>
            </form>
            <br>
            <c:if test="${brak}">
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    Niestety baza Biblioteki Narodowej nie zawiera takiego numeru ISBN. Wpisz dane książki ręcznie.
                </div>
            </c:if>
        </div>
    </div>
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <form:form method="post" modelAttribute="book" action="/user/addbook">
                <div class="form-group">
                    <label for="title">Tytuł książki:</label>
                    <form:input path="title" class="form-control" placeholder="Wpisz tytuł" value="${tit}"/>
                    <form:errors path="title" class="text-danger"/>
                </div>
                <div class="form-group">
                    <label for="title">Autor książki:</label>
                    <form:input path="author" class="form-control" placeholder="Podaj autora" value="${aut}"/>
                    <form:errors path="author" class="text-danger"/>
                </div>
                <div class="form-group">
                    <label for="title">Wydawca książki:</label>
                    <form:input path="publisher" class="form-control" placeholder="Wpisz wydawcę" value="${pub}"/>
                    <form:errors path="publisher" class="text-danger"/>
                </div>
                <div class="form-group">
                    <label for="title">Kategoria książki:</label>
                    <form:select path="type" class="form-control" placeholder="Wpisz kategorię książki" value="${cat}">

                        <option >Biografia</option>
                        <option >Dla dzieci</option>
                        <option >Filozofia</option>
                        <option >Historia</option>
                        <option >Horror</option>
                        <option >Lektury</option>
                        <option >Literatura młodzieżowa</option>
                        <option >Literatura obyczajowa</option>
                        <option >Literatura piękna</option>
                        <option >Powieść</option>
                        <option >Romans</option>
                        <option >Sensacja Thriller</option>
                        <option >Baśnie</option>
                        <option >Ekonomia, finanse, biznes i zarządzanie</option>

                            <option <c:if test="${cat!=null}">selected</c:if>>${cat}</option>

                    </form:select>
                    <form:errors path="type" class="text-danger"/>
                </div>
                <div class="form-group">
                    <label for="title">Opis książki:</label>
                    <form:textarea path="description" class="form-control" placeholder="Opis książki" value="${dis}"/>
                    <form:errors path="description" class="text-danger"/>
                </div>
                <div class="form-group">
                    <label for="title">Numer ISBN:</label>
                    <c:set var = "string1" value = "${isb}"/>
                    <c:set var = "string2" value = "${fn:substring(string1, 0, 13)}" />

                    <form:input path="isbn" class="form-control" placeholder="Numer ISBN" value="${string2}"/>
                    <cite title="Source Title">To pole nie jest wymagane, jest natomiast bardzo pomocne w identyfikacji
                        książki. Numer ISBN składa się z 13 cyfr i zaczyna się od cyfry 9.</cite>
                    <div class="valid-feedback">
                        To pole nie jest wymagane, jest natomiast bardzo pomocne w identyfikacji książki. Numer ISBN
                        składa się z 13 cyfr i zaczyna się od cyfry 9.
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Dodaj książkę</button>
            </form:form>
        </div>
    </div>
</section>
<%--<script src="../../../app.js" type="text/javascript"></script>--%>
</body>
</html>