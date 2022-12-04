<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>

<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>JSP - Hello World</title>
</head>
<body>
<main class="flex p-3 space-x-3">
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
            Status:
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
            Status
        </div>
    </div>
    <div class="w-1/4 h-screen border-solid border-2 border-red-500">
        <h1 class="text-3xl font-bold underline">Delete</h1>
        <form action="employee" method="POST">
            <label for="keyDelete">Key:</label>
            <input type="text" id="keyDelete" name="key" value="C1B5"
                   class="mt-3 border-solid border-2 border-gray-500"><br><br>
            <input type="hidden" name="_method" value="DELETE">
            <input type="submit" value="delete" class="p-3 bg-red-300"/>
        </form>
        <hr class="w-full"/>
        <div>
            Status
        </div>
    </div>
</main>

</body>
</html>