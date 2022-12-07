<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!DOCTYPE html>
<html>
<head>
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
            integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script defer src="https://cdn.tailwindcss.com"></script>
    <title>JSP - Hello World</title>
</head>
<body>
<main class="flex p-3 space-x-3">
    <div id="err"></div>
    <div class="h-screen border-solid border-2">
        <h1 class="text-3xl font-bold underline">Fetch Employee Details</h1>
        <hr class="w-full"/>
        <div id="search-result"></div>
    </div>
</main>

<script>

    var BASE_URL = 'http://18.220.158.71:8080/edu/mofa/jsptest/emp'

    window.onload = function (e) {
        var params = {};
        window.location.search
            .replace(/[?&]+([^=&]+)=([^&]*)/gi, function (str, key, value) {
                    params[key] = value;
                }
            );
        handleSearch(params.key)
    };

    function handleSearch(key) {
        if (!key) {
            key = document.getElementById('key').value
        }
        $.ajax({
            type: 'GET',
            url: BASE_URL + '?key=' + key,

            success: function (data, status, xhr) {
                if (data.trim() !== '') {
                    const object = JSON.parse(data.trim());
                    $('<div>\n' +
                        'Key  <strong>' + object.key + '</strong><br>\n' +
                        'Name <strong>' + object.name + '</strong><br>\n' +
                        'Age <strong>' + object.age + '</strong><br>\n' +
                        'Raw data <strong>' + data + '</strong><br>\n' +
                        '    </div>').appendTo('#search-result')
                } else {
                    $('<div>\n' +
                        '<strong> No Data Found </strong>\n' +
                        '    </div>').appendTo('#search-result')
                }
            }
        });
    }

    function handlePost() {
        var key = document.getElementById('keyPost').value
        var name = document.getElementById('namePost').value
        var age = document.getElementById('agePost').value

        $.ajax({
            type: 'POST',
            url: BASE_URL + '?key=' + key,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                'name': name,
                'age': age
            }),
            success: function (data, status, xhr) {
                $('<div>\n' +
                    '<strong>' + data + '</strong>\n' +
                    '    </div>').appendTo('#post-result')
            }
        });
    }

    function handlePut() {
        var key = document.getElementById('keyPut').value
        var name = document.getElementById('namePut').value
        var age = document.getElementById('agePut').value

        $.ajax({
            type: 'PUT',
            url: BASE_URL,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                'key': key,
                'name': name,
                'age': age
            }),
            success: function (data, status, xhr) {
                $('<div>\n' +
                    '<strong>' + data + '</strong>\n' +
                    '    </div>').appendTo('#put-result')
            }
        });
    }

    function handleDelete() {
        var key = document.getElementById('keyDelete').value
        $.ajax({
            type: 'DELETE',
            url: BASE_URL + '?key=' + key,
            success: function (data, status, xhr) {
                $('<div>\n' +
                    '<strong>' + data + '</strong>\n' +
                    '    </div>').appendTo('#delete-result')
            }
        });
    }
</script>
</body>
</html>