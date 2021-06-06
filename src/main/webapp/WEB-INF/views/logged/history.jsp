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
                    <a class="nav-link" href="/user/dashboard">Moja biblioteczka</a>
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
                    <a class="nav-link" href="/transaction/mytransations">Moje powiadomienia <span class="badge badge-pill badge-success">${number}</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/transaction/history">Historia <span class="badge badge-pill badge-success"></span></a>
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
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded ">
            <h3 style="float:left"> Historia tranzakcji: </h3>
            <a style="float:right" class="btn btn-outline-info" onclick="goBack()"> Powrót </a>
        </div>
    </div>
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded ">
            <div class="row container p-3">
                <h5 style="padding-bottom: 5px"><em> Historia sfinalizowanych wymian zainicjowanych przez innych użytkowników serwisu: </em></h5>
                <p><em>Poniżej zaprezentowane są wszystkie tranzakcje zaproponowane Ci przez innych użykowników serwisu i zaakceptowane przez Ciebie.
                    Elementy na tej liście pojwaiaja się gdy zgodzisz się na wymianę swojej książki na jedną z książek innego użytkownika.
                </em></p>
            </div>
            <table id="table" class="display table table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>DATA TRANZAKCJI</th>
                    <th>TWOJA KSIĄŻKA<small class="form-text text-muted">
                        Twoja książka którą wymieniłeś
                    </small></th>
                    <th>KONTRAKTOR<small class="form-text text-muted">
                        Nazwa użytkowanika który zaproponował Ci wymianę.
                    </small></th>
                    <th>JEGO KSIĄŻKA<small class="form-text text-muted">
                        Książka która od teraz należy do Ciebie
                    </small></th>
                    <th>AKCJA</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userT}" var="userT">
                    <tr>
                        <td><c:out value="${userT.transactionDate.toLocalDate()}"/></td>
                        <td><c:out value="${userT.book.title}"/></td>
                        <td><c:out value="${userT.owner.username}"/></td>
                        <td><c:out value="${userT.contractorBook.title}"/></td>
                        <td>
                            <button type="button" class="btn btn-outline-info btn-sm" data-toggle="modal"
                                    data-target="#userConData" data-usermyt="${userT.owner.username}" data-namemyt="${userT.owner.name}" data-surnamemyt="${userT.owner.surname}" data-phonemyt="${userT.owner.phone}" data-emailmyt="${userT.owner.email}">
                                POKAŻ DANE KONTAKTOWE
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Modal -->
            <div class="modal fade" id="userConData" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalLabel2">Dane kontaktowe użytkownika <p id="logint"></p></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Zamknij">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm">
                                        <p><h5>Imię:</h5></p>
                                        <p><h5>Nazwisko:</h5></p>
                                        <p><h5>Adres email:</h5></p>
                                        <p><h5>Telefon:</h5></p>
                                    </div>
                                    <div class="col-sm">
                                        <p><h5 id="namet"></h5></p>
                                        <p><h5 id="surnamet"></h5></p>
                                        <p><h5 id="emailt"></h5></p>
                                        <p><h5 id="phonet"></h5></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section style="width: 99%">
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded ">
            <div class="row container p-3">
                <h5 style="padding-bottom: 5px"><em> Historia sfinalizowanych wymian zainicjowanych przez Ciebie: </em></h5>
                <p><em>Elementy na tej liście pojawiają się gdy wyszukasz książke innego użytkownika i zaproponujesz mu wymianę a on ją zaakceptuje i wskaże jedną z twoich książek na którą chce się wymienić.
                </em></p>
            </div>
            <table id="table2" class="display table table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>DATA TRANZAKCJI</th>
                    <th>TWOJA KSIĄŻKA<small class="form-text text-muted">
                        Twoja książka którą wymieniłeś
                    </small></th>
                    <th>KONTRAKTOR<small class="form-text text-muted">
                        Nazwa użytkowanika któremu zaproponowałeś wymianę.
                    </small></th>
                    <th>JEGO KSIĄŻKA<small class="form-text text-muted">
                        Książka która od teraz należy do Ciebie
                    </small></th>
                    <th>AKCJA</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userMy}" var="userMy">
                    <tr>
                        <td><c:out value="${userMy.transactionDate.toLocalDate()}"/></td>
                        <td><c:out value="${userMy.contractorBook.title}"/></td>
                        <td><c:out value="${userMy.contractor.username}"/></td>
                        <td><c:out value="${userMy.book.title}"/></td>
                        <td>
                            <button type="button" class="btn btn-outline-info btn-sm" data-toggle="modal"
                                    data-target="#userMyData" data-usermy="${userMy.contractor.username}" data-namemy="${userMy.contractor.name}" data-surnamemy="${userMy.contractor.surname}" data-phonemy="${userMy.contractor.phone}" data-emailmy="${userMy.contractor.email}">
                                POKAŻ DANE KONTAKTOWE
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Modal -->
            <div class="modal fade" id="userMyData" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalLabel">Dane kontaktowe użytkownika <p id="logina"></p></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Zamknij">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm">
                                        <p><h5>Imię:</h5></p>
                                        <p><h5>Nazwisko:</h5></p>
                                        <p><h5>Adres email:</h5></p>
                                        <p><h5>Telefon:</h5></p>
                                    </div>
                                    <div class="col-sm">
                                        <p><h5 id="namea"></h5></p>
                                        <p><h5 id="surnamea"></h5></p>
                                        <p><h5 id="emaila"></h5></p>
                                        <p><h5 id="phonea"></h5></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="../../../app.js" type="text/javascript"></script>
</body>
</html>