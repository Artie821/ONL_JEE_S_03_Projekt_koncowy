<%--
  Created by IntelliJ IDEA.
  User: kret3
  Date: 24.05.2021
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                <li class="nav-item">
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
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded ">
            <h3 style="float:left"> Gratulacje ${username} sfinalizowałeś tranzakcję wymiany! </h3>
            <a style="float:right" class="btn btn-outline-info" href="/transaction/mytransations" > Powrót do powiadomień </a>
        </div>
    </div>
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded ">
            <div class="card text-white bg-secondary ">
                <h5 class="card-header">Opis postępowania:</h5>
                <div class="card-body">
                    <h5 class="card-title">Gratulację książka: </h5>
                    <h5 class="card-title"><em>${book.title}</em></h5>
                    <h5 class="card-title">jest już prawie twoja , dokończ tranzakcje z użytkownikiem ${contractor}.</h5>
                    <h5 class="card-title">Aby tego dokonać skontaktuj się z jej właścicielem , jego dane kontaktowe znajdują się poniżej.</h5>
                    <h5 class="card-title">Pamiętaj, że wymieniasz ją za swoją książkę: </h5>
                    <h5 class="card-title"><em>${cbook.title}</em></h5>
                    <br>
                    <h5 class="card-title">Oto jego dane kontaktowe:</h5>
                    <div class="container">
                        <div class="row">
                            <div class="col-sm">
                                <p><h5>Imię:</h5></p>
                                <p><h5>Nazwisko:</h5></p>
                                <p><h5>Adres email:</h5></p>
                                <p><h5>Telefon:</h5></p>
                            </div>
                            <div class="col-sm">
                                <p><h5>${transaction.owner.name}</h5></p>
                                <p><h5>${transaction.owner.surname}</h5></p>
                                <p><h5>${transaction.owner.email}</h5></p>
                                <p><h5>${transaction.owner.phone}</h5></p>
                            </div>
                        </div>
                    </div>
                    <p class="card-title">Wszystkie przeprowadzone tranzakcje wymiany wraz z danymi twoich kontrahentów możesz w dowolnej chwili znaleźć w sekcji Historia tranzakcji. </p>
                    <a href="/transaction/history" type="button" class="btn btn-primary btn-lg btn-block">Przejdź do historii transakcji</a>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="../../../app.js" type="text/javascript"></script>
</body>
</html>