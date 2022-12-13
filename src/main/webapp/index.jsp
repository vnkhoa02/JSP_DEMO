<%@page import="java.lang.*" %>
<%@ page import="okhttp3.HttpUrl" %>
<%@ page import="okhttp3.Request" %>
<%@ page import="okhttp3.Response" %>
<%@ page import="okhttp3.OkHttpClient" %>
<%@ page import="org.json.JSONObject" %>


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
<%
    OkHttpClient client = new OkHttpClient().newBuilder().build();

    String key = request.getParameter("key"); //get key parameter from URL
    HttpUrl.Builder urlBuilder = HttpUrl.parse("http://18.220.158.71:8080/edu/mofa/jsptest/emp").newBuilder();
    urlBuilder.addQueryParameter("key", key);

    String url = urlBuilder.build().toString();

    Request req = new Request.Builder().url(url).build();

    String name = null;
    Integer age = 0;

    try {
        Response res = client.newCall(req).execute();
        String json = res.body().string().trim();
        if (!json.isEmpty()) {
            JSONObject object = new JSONObject(json);
            name = (String) object.get("name");
            age = (Integer) object.get("age");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
Your name <%=name%> <br>
Your age after 5 years will be <%=age%>
</body>
</html>