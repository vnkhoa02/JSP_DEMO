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
                    callJavaServlet(object.age)
                } else {
                    $('<div>\n' +
                        '<strong> No Data Found </strong>\n' +
                        '    </div>').appendTo('#search-result')
                }
            },
            error: function (request, status, error) {
                $('<div>\n' +
                    '<strong> Err: ' + error + '</strong><br>\n' +
                    '    </div>').appendTo('#search-result')
            }
        });
    }

    function callJavaServlet(age) {
        const url = '${pageContext.request.contextPath}/ServletDemo'
        $.ajax({
            type: 'GET',
            url: url + '?age=' + age,

            success: function (data, status, xhr) {
                $('<div>\n' +
                    'Age + 5 = <strong>' + data + '</strong><br>\n').appendTo('#search-result')
            },
            error: function (request, status, error) {
                $('<div>\n' +
                    '<strong> Err: ' + error + '</strong><br>\n' +
                    '    </div>').appendTo('#search-result')
            }
        });
    }
</script>
</body>
</html>