<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <form action="employee" method="GET">
            <label for="key">Key:</label>
            <input type="text" id="key" name="key" value="C1B5"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <input type="submit" value="Submit" class="p-3 bg-green-300"/>
        </form>
        <hr class="w-full"/>
        <div>
            Key: ${employee.key} <br/>
            Name: ${employee.name} <br/>
            Age: ${employee.age} <br/>
            Childs: <br/>
            <c:forEach var="child" items="${childs}">
                <div class="p-2 border-solid border-2 border-gray-500">
                    Child Name: ${child.childname} <br/>
                    Child Age: ${child.childage} <br/><br/>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="w-1/4 h-screen border-solid border-2 border-green-500">
        <h1 class="text-3xl font-bold underline">Post</h1>
        <form action="employee" method="POST">
            <label for="keyPost">Key:</label>
            <input type="text" id="keyPost" name="key" value="C1B5"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <label for="namePost">Name:</label>
            <input type="text" id="namePost" name="name" value="TAYLOR"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <label for="agePost">Age:</label>
            <input type="text" id="agePost" name="age" value="20"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <input type="submit" value="Submit" class="p-3 bg-green-300"/>
        </form>
        <hr class="w-full"/>
        <div>
            Result Flag: ${statusCode.resultFlag} <br/>
            Result Message: ${statusCode.resultMessage} <br/>
        </div>
    </div>
    <div class="w-1/4 h-screen border-solid border-2 border-sky-500">
        <h1 class="text-3xl font-bold underline">Put</h1>
        <form action="employee" method="POST">
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
            <input type="submit" value="put" class="p-3 bg-sky-300"/>
        </form>
        <hr class="w-full"/>
        <div>
            Result Flag: ${statusCode.resultFlag} <br/>
            Result Message: ${statusCode.resultMessage} <br/>
        </div>
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
        <div>
            Result Flag: ${statusCode.resultFlag} <br/>
            Result Message: ${statusCode.resultMessage} <br/>
        </div>
    </div>
</main>

<script>
    function handleDelete() {
        var key = document.getElementById('keyDelete').value
        $.ajax({
            type: 'DELETE',
            url: 'http://18.220.158.71:8080/edu/mofa/jsptest/emp?key=' + key,
            header: {
                'Access-Control-Allow-Origin': '*'
            },
            success: function (data, status, xhr) {
                $('<div class="absolute top-5 right-5 p-3 w-48 bg-green-300">\n' +
                    '<strong>' + data + '</strong>\n' +
                    '    </div>').appendTo('#err')

                $('#err').show();

                setTimeout(function () {
                    $('#err').hide();
                }, 2000);
            },
            error: function (request, status, error) {
                $('<div class="absolute top-5 right-5 p-3 w-32 bg-red-300">\n' +
                    '<strong>' + error + '</strong>\n' +
                    '    </div>').appendTo('#err')

                $('#err').show();

                setTimeout(function () {
                    $('#err').hide();
                }, 2000);
            }
        });
    }
</script>
</body>
</html>