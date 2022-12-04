<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <div>
            Key <%= request.getSession().getAttribute("myKey") %>
        </div>
    </div>
    <div class="w-1/4 h-screen border-solid border-2 border-green-500">
        <h1 class="text-3xl font-bold underline">Post</h1>
    </div>
    <div class="w-1/4 h-screen border-solid border-2 border-sky-500">
        <h1 class="text-3xl font-bold underline">Put</h1>
    </div>
    <div class="w-1/4 h-screen border-solid border-2 border-red-500">
        <h1 class="text-3xl font-bold underline">Delete</h1>
    </div>
</main>

</body>
</html>