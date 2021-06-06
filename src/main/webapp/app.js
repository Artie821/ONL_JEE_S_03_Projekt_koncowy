$(document).ready(function() {
    $('#table').DataTable( {
        "language": {
            "lengthMenu": "Wyświetl _MENU_ rekordów na stronę",
            "zeroRecords": "Nic nie znaleziono :(",
            "info": "Wyświetlam stronę _PAGE_ z _PAGES_",
            "infoEmpty": "Brak dostępnych rekordów",
            "search":         "Szukaj:",
            "paginate": {
                "first":      "Pierwsza",
                "last":       "Ostatnia",
                "next":       "Następna",
                "previous":   "Poprzednia"
            },
            "infoFiltered": "(przefiltorwano z _MAX_ rekordów)"
        }
    } );
} );

$(document).ready(function() {
    $('#table2').DataTable( {
        "language": {
            "lengthMenu": "Wyświetl _MENU_ rekordów na stronę",
            "zeroRecords": "Nic nie znaleziono :(",
            "info": "Wyświetlam stronę _PAGE_ z _PAGES_",
            "infoEmpty": "Brak dostępnych rekordów",
            "search":         "Szukaj:",
            "paginate": {
                "first":      "Pierwsza",
                "last":       "Ostatnia",
                "next":       "Następna",
                "previous":   "Poprzednia"
            },
            "infoFiltered": "(przefiltorwano z _MAX_ rekordów)"
        }
    } );
} );

function goBack() {
    window.history.back();
}

$(function() {
    $('#exampleModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var n = button.data('name')// Extract info from data-* attributes
        var a = document.getElementById('btnname');
        a.href = '/user/delete/'+n;
    });
});

$(function() {
    $('#propModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var n = button.data('name')
        var title = button.data('book')
        var b = document.getElementById('booktitle');
        var a = document.getElementById('btnname');
        a.href = '/transaction/'+n;
        b.innerText = title;
    });
});

$(function() {
    $('#cancelModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var n = button.data('name')
        var title = button.data('book')
        var user = button.data('user')
        var b = document.getElementById('booktitle');
        var a = document.getElementById('btnname');
        var c = document.getElementById('userN');
        a.href = '/transaction/delete/'+n;
        b.innerText = title;
        c.innerText = user;
    });
});

$(function() {
    $('#cancelallModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var n = button.data('name')
        var user = button.data('user')
        var a = document.getElementById('btnname');
        var c = document.getElementById('userN');
        a.href = '/transaction/delete/'+n;
        c.innerText = user;
    });
});

$(function() {
    $('#cancelProp').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var propbtn = button.data('propbtn')
        var n = button.data('propname')
        var b = button.data('propbook')
        var number = document.getElementById('propbtn');
        var book = document.getElementById('propBook');
        var name = document.getElementById('propName');
        number.href = '/transaction/delete/'+ propbtn;
        book.innerHTML = b;
        name.innerHTML = n;
    });
});

$(function() {
    $('#userMyData').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var myusername = button.data('usermy')
        var surnamemy = button.data('surnamemy')
        var namemy = button.data('namemy')
        var phonemy = button.data('phonemy')
        var emailmy = button.data('emailmy')
        var logina = document.getElementById('logina');
        var surnamea = document.getElementById('surnamea');
        var namea = document.getElementById('namea');
        var emaila = document.getElementById('emaila');
        var phonea = document.getElementById('phonea');
        logina.innerText = myusername;
        surnamea.innerText = surnamemy;
        namea.innerText = namemy;
        emaila.innerText = emailmy;
        phonea.innerText = phonemy;

    });
});

$(function() {
    $('#userConData').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var myusernamet = button.data('usermyt')
        var surnamemyt = button.data('surnamemyt')
        var namemyt = button.data('namemyt')
        var phonemyt = button.data('phonemyt')
        var emailmyt = button.data('emailmyt')
        var logint = document.getElementById('logint');
        var surnamet = document.getElementById('surnamet');
        var namet = document.getElementById('namet');
        var emailt = document.getElementById('emailt');
        var phonet = document.getElementById('phonet');
        logint.innerText = myusernamet;
        surnamet.innerText = surnamemyt;
        namet.innerText = namemyt;
        emailt.innerText = emailmyt;
        phonet.innerText = phonemyt;

    });
});