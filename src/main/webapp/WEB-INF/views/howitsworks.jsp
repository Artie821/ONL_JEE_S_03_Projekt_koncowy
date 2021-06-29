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
        <a class="navbar-brand" href="/">
            <img src="../../../avatar.png" width="40" height="40" class="d-inline-block align-top rounded"
                 alt="idź na start">
            Wymień Książkę
        </a>

        <div class="collapse navbar-collapse" id="mainNavigation">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="howitsworks">Jak to działa?</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/usersbooks">Książki naszych użytkowników</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/register">Rejestracja</a>
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
            <h5>
                Trzy proste kroki by wymienić książkę:
            </h5>
        </div>
    </div>
</section>
<section style="width: 99%">
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <div>
                <br>
                <h5>
                    1. Zarejestruj konto w sekcji rejestracja na górnej belce i zaloguj się
                    <br>
                    <small>Pamiętaj aby podać poprawny adres emai i numer telefonu, jest on niezbędny aby inni uzytkownicy mogli się z Tobą kontaktować!</small>
                </h5>
                <br>
            </div>
        </div>
    </div>
</section>
<section style="width: 99%">
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <br>
            <div>
                <h5>
                    2. Dodaj pierwszą książke którą chcesz wymienić aby przeglądać biblioteczkę naszych użykowników i proponować wymiany.
                    <br>
                    <small>Liczba książek które możesz dodać do biblioteczki jest nieograniczona, możesz przeprowadzać w tym samym czasie nieograniczoną liczbę tranzakcji!</small>
                </h5>
            </div>
            <br>
        </div>
    </div>
</section>
<section style="width: 99%">
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <div>
                <br>
                <h5>
                    3. Jeśli któryś z właścicieli inetresującej Cię książki zgodzi się na wymianę na jedną z twoich, lub jeśli ktoś inny zaproponuje Ci wymianę i znajdziesz coś interesującego w jego biblioteczce, nie pozostaje Ci nic innego jak finalizacja tranzakcji i cieszenie się nową lekturą!
                    <br>
                    <small></small>
                </h5>
                <br>
            </div>
        </div>
    </div>
</section>
<script src="../../../app.js" type="text/javascript"></script>
</body>
</html>