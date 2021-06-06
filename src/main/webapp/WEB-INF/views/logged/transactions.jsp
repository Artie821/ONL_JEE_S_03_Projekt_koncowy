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
                    <a class="nav-link active" href="/transaction/mytransations">Moje powiadomienia <span class="badge badge-pill badge-success">${number}</span></a>
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
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded ">
            <h3 style="float:left"> Propozycje wymiany: </h3>
            <a style="float:right" class="btn btn-outline-info" onclick="goBack()"> Powrót </a>
        </div>
    </div>
    <div class="row">
        <div class="container p-3 my-3 border shadow p-1 mb-1 bg-white rounded ">
            <div class="row container p-3">
                <h5 style="padding-bottom: 5px"><em> Lista wymian zaproponowanych przez innych użytkowników serwisu: </em></h5>
                <p><em>Poniżej zaprezentowane są wszystkie tranzakcje zaproponowane Ci przez innych użykowników serwisu.
               Elementy na tej liście pojwaiaja się gdy inny użykownik jest zainteresowany jedną z twoich książek.
                    Do Ciebie należy decyzja czy zaakceptujesz wymianę na jedna z jego książek - możesz to zrobić klikając przycisk "wybierz książkę na wymianę".
                    Jeśli żadna z książek twojego kontrachenta nie wyda Ci się interesująca możesz anulować całą tranazkcję.
                    </em></p>
            </div>
            <table id="table" class="display table table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>NAZWA KSIĄŻKI<small class="form-text text-muted">
                        Twoja książka którą zainteresowany jest inny użytkownik
                    </small></th>
                    <th>KONTRAKTOR<small class="form-text text-muted">
                        Nazwa użytkowanika który zaproponował Ci wymianę
                    </small></th>
                    <th>DATA</th>
                    <th>AKCJA</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${transactions}" var="transactions">
                    <tr>
                        <td><c:out value="${transactions.book.title}"/></td>
                        <td><c:out value="${transactions.owner.username}"/></td>
                        <td><c:out value="${transactions.transactionDate.toLocalDate()}"/></td>
                        <td>
                            <a href="/transaction/exchange/${transactions.id}" class="btn btn-outline-success btn-sm">WYBIERZ KSIĄŻKĘ NA WYMIANĘ</a>
                            <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal"
                                    data-target="#cancelModal" data-user="${transactions.owner.username}" data-name="${transactions.id}" data-book="${transactions.book.title}">
                                ANULUJ TRANZAKCJĘ
                            </button>
                            <a href="/user/details/${transactions.book.id}" class="btn btn-outline-info btn-sm">SZCZEGÓŁY KSIĄŻKI</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Modal -->
            <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Anulowanie wymiany</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Zamknij">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p> Potwierdź, że chcesz anulować wymianę tej książki za którąś z książek użytkownika: <p ></p></p>
                            <p id="userN"> </p>
                            <p><small class="form-text text-muted"> Po kliknięciu Potwierdź twoja książka:<em class="form-text text-muted" id="booktitle"></em>będzie znów widoczna dla innych użytkowników. Operacji nie można cofnąć!</small></p>
                            <small class="form-text text-muted"></small>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Anuluj</button>
                            <a href="" type="button" class="btn btn-outline-danger" id="btnname" >Potwierdź</a>
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
                <h5 style="padding-bottom: 5px"><em> Twoje propozyjce wymiany skierowne do innych użytkowników: </em></h5>
                <p><em>Aby dodać książki do tej listy przejdź do sekcji "Wyszukaj książkę" ,
                    wybierz interesujący Cię tytuł a następnie kliknij w przycisk "zaproponuj wymianę".
                    Teraz pozostaje Ci tylko czekać na decyzję właścicela książki. Możesz oczywiście anulować całą tranzakcję.
                </em></p>
            </div>
            <table id="table2" class="display table table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>NAZWA KSIĄŻKI</th>
                    <th>KONTRAKTOR</th>
                    <th>STATUS TRANZAKCJI</th>
                    <th>DATA</th>
                    <th>AKCJA</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${propozitions}" var="prop">
                    <tr>
                        <td><c:out value="${prop.book.title}"/></td>
                        <td><c:out value="${prop.contractor.username}"/></td>
                        <td><c:out value="${prop.status}"/></td>
                        <td><c:out value="${prop.transactionDate.toLocalDate()}"/></td>
                        <td>
                            <a href="/user/details/${prop.book.id}" class="btn btn-outline-info btn-sm">SZCZEGÓŁY KSIĄŻKI</a>
                            <button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal"
                                    data-target="#cancelProp" data-propname="${prop.contractor.username}" data-propbtn="${prop.id}" data-propbook="${prop.book.title}">
                                ANULUJ TRANZAKCJĘ
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Modal -->
            <div class="modal fade" id="cancelProp" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalLabel">Anulowanie wymiany</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Zamknij">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p> Potwierdź, że nie jesteś już zainteresowany książką: <p ></p></p>
                            <em id="propBook"> </em>
                            <p> użytkownika:</p>
                            <p id="propName"> </p>
                            <p><small class="form-text text-muted"> Operacji nie można cofnąć!</small></p>
                            <small class="form-text text-muted"></small>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Anuluj</button>
                            <a href="" type="button" class="btn btn-outline-danger" id="propbtn" >Potwierdź</a>
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