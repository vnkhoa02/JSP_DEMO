<%@page import="java.lang.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="okhttp3.*" %>


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

    // GET

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

    // POST - PUT - DELETE are the same

    String jsonResponse = null;
    try {
        HttpUrl.Builder urlBuilder2 = HttpUrl.parse("http://18.220.158.71:8080/edu/mofa/jsptest/emp").newBuilder();
        MediaType mediaType = MediaType.parse("application/json;charset=utf-8");

        String key2 = request.getParameter("key2"); //get key parameter from URL
        if (key2 != null) {
            urlBuilder2.addQueryParameter("key", key2);

            String url2 = urlBuilder2.build().toString();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", "YOUR_NAME_HERE");
            jsonObject.put("age", 19);

            RequestBody formBody = RequestBody.create(mediaType, jsonObject.toString());

            Request postRequest = new Request.Builder().
                    url(url2)
                    .post(formBody) // change to .put .delete
                    .build();
            Response res = client.newCall(postRequest).execute();
            jsonResponse = res.body().string().trim();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
Your name <%=name%> <br>
Your age after 5 years will be <%=age%> <br/>
Response <%=jsonResponse%>
</body>
</html>