

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
                <li class="nav-item">
                    <a class="nav-link" href="/howitsworks">Jak to działa?</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/usersbooks">Książki naszych użytkowników</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/register">Rejestracja</a>
                </li>
                <li class="nav-item active ">
                    <a class="nav-link" href="/admin/login">Logowanie</a>
                </li>
            </ul>
        </div>
    </nav>
</section>
<section style="width: 99%">
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <h3 style="float:left"> Logowanie </h3>
        </div>
    </div>
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded">
            <c:if test="${param.success}">
                <div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    Witaj twoje konto zostało zarejestrowane! Zaloguj się aby kożystać z serwisu!
                </div>
            </c:if>

            <c:if test="${param.error}">
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    Podałeś nieprawidłowe dane logowania. Spróbuj jeszcze raz!
                </div>
            </c:if>

                <form class="form-signin" method="post">
                    <h1 class="h3 mb-3 font-weight-normal">Nazwa użytkownika:</h1>
                    <input type="text" id="username" class="form-control" placeholder="Nazwa użytkownika" required autofocus name="username">
                    <br>
                    <h1 class="h3 mb-3 font-weight-normal">Hasło użytkownika:</h1>
                    <input type="password" id="password" class="form-control" placeholder="Hasło" required name="password">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <br>
                    <button class="btn btn-lg btn-dark btn-block" type="submit">Zaloguj</button>
                </form>
        </div>
    </div>
</section>
<script src="../../../app.js" type="text/javascript"></script>
</body>
</html>
