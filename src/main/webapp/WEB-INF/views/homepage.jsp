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
                <li class="nav-item">
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
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../../../books.jpg" class="card-img-top" alt="…" height="650">
                        <div class="card-body" style="padding-bottom: 1px">
                            <h5 class="card-title"><em>Kiedy pierwszy raz czytam dobrą książkę, doświadczam uczucia, jakbym zyskał nowego przyjaciela.</em></h5>
                            <p class="small"><em>Johann Wolfgang Goethe</em></p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="../../../books1.jpg" class="card-img-top" alt="…" height="650">
                        <div class="card-body" style="padding-bottom: 1px">
                            <h5 class="card-title"><em>Książka i możność czytania to jeden z największych cudów ludzkiej cywilizacji.</em></h5>
                            <p class="small"><em>Maria Dąbrowska</em></p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="../../../books2.jpg" class="card-img-top" alt="…" height="650">
                        <div class="card-body" style="padding-bottom: 1px">
                            <h5 class="card-title"><em>Nie trzeba wielkich mieć bibliotek, by przyjacielem książki zostać.</em></h5>
                            <p class="small"><em>H. Łochocka</em></p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="../../../books3.jpg" class="card-img-top" alt="…" height="650">
                        <div class="card-body" style="padding-bottom: 1px">
                            <h5 class="card-title"><em>Są książki, które się czyta. Są książki, które się pochłania. Są książki, które pochłaniają czytającego.</em></h5>
                            <p class="small"><em>M. Pruszkowska</em></p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</section>
<script src="../../../app.js" type="text/javascript"></script>
</body>
</html>