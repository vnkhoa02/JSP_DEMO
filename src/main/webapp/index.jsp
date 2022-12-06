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
    <div class="w-1/4 h-screen border-solid border-2">
        <h1 class="text-3xl font-bold underline">Fetch Employee Details</h1>
        <div>
            <label for="key">Key:</label>
            <input type="text" id="key" name="key" value="C1B5"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <button class="p-3 bg-green-300" onclick="handleSearch()">Submit</button>
        </div>
        <hr class="w-full"/>
        <div id="search-result"></div>
    </div>
    <div class="w-1/4 h-screen border-solid border-2 border-green-500">
        <h1 class="text-3xl font-bold underline">Post</h1>
        <div>
            <label for="keyPost">Key:</label>
            <input type="text" id="keyPost" name="key" value="C1B5"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <label for="namePost">Name:</label>
            <input type="text" id="namePost" name="name" value="TAYLOR"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <label for="agePost">Age:</label>
            <input type="text" id="agePost" name="age" value="20"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <button class="p-3 bg-red-300" onclick="handlePost()">Submit</button>
        </div>
        <hr class="w-full"/>
        <div id="post-result"></div>
    </div>
    <div class="w-1/4 h-screen border-solid border-2 border-sky-500">
        <h1 class="text-3xl font-bold underline">Put</h1>
        <div>
            <label for="keyPut">Key:</label>
            <input type="text" id="keyPut" name="key" value="C1B5"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <label for="namePut">Name:</label>
            <input type="text" id="namePut" name="name" value="TAYLOR"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <label for="agePut">Age:</label>
            <input type="text" id="agePut" name="age" value="20"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <input type="hidden" name="_method" value="PUT">
            <button class="p-3 bg-red-300" onclick="handlePut()">Submit</button>
        </div>
        <hr class="w-full"/>
        <div id="put-result"></div>

    </div>
    <div class="w-1/4 h-screen border-solid border-2 border-red-500">
        <h1 class="text-3xl font-bold underline">Delete</h1>
        <div>
            <label for="keyDelete">Key:</label>
            <input type="text" id="keyDelete" name="key" value="C1B5"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <button class="p-3 bg-red-300" onclick="handleDelete()">Submit</button>
        </div>
        <hr class="w-full"/>
        <div id="delete-result"></div>
    </div>
</main>

<script>

    var BASE_URL = 'http://18.220.158.71:8080/edu/mofa/jsptest/emp'

    window.onload = function (e) {
        var params={};
        window.location.search
            .replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str,key,value) {
                    params[key] = value;
                }
            );
        console.log(params.key)
        console.log(params.name)
    };

    function handleSearch() {
        var key = document.getElementById('key').value
        $.ajax({
            type: 'GET',
            url: BASE_URL + '?key=' + key,

            success: function (data, status, xhr) {
                $('<div>\n' +
                    '<strong>' + data + '</strong>\n' +
                    '    </div>').appendTo('#search-result')
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