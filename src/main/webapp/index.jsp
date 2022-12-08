<%@page import="java.lang.*" %>
<%@ page import="okhttp3.HttpUrl" %>
<%@ page import="okhttp3.Request" %>
<%@ page import="okhttp3.Response" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="okhttp3.OkHttpClient" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>


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
<%!
    static class Employee {
        private String key;

        private String name;

        private Integer age;

        private List<Child> childs = new ArrayList<>();

        public Employee() {
        }

        public Employee(String key, String name, Integer age, List<Child> childs) {
            this.key = key;
            this.name = name;
            this.age = age;
            this.childs = childs;
        }

        public String getKey() {
            return key;
        }

        public void setKey(String key) {
            this.key = key;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public Integer getAge() {
            return age;
        }

        public void setAge(Integer age) {
            this.age = age;
        }

        public List<Child> getChilds() {
            return childs;
        }

        public void setChilds(List<Child> childs) {
            this.childs = childs;
        }

        static class Child {

            private Integer id;

            private String fatherKey;

            private String childname;

            private Integer childage;

            public Child() {
            }

            public Child(Integer id, String fatherKey, String childname, Integer childage) {
                this.id = id;
                this.fatherKey = fatherKey;
                this.childname = childname;
                this.childage = childage;
            }

            public Integer getId() {
                return id;
            }

            public void setId(Integer id) {
                this.id = id;
            }

            public String getFatherKey() {
                return fatherKey;
            }

            public void setFatherKey(String fatherKey) {
                this.fatherKey = fatherKey;
            }

            public String getChildname() {
                return childname;
            }

            public void setChildname(String childname) {
                this.childname = childname;
            }

            public Integer getChildage() {
                return childage;
            }

            public void setChildage(Integer childage) {
                this.childage = childage;
            }
        }
    }
%>
<%
    OkHttpClient client = new OkHttpClient().newBuilder().build();
    ObjectMapper objectMapper = new ObjectMapper();

    String key = request.getParameter("key"); //get key parameter from URL
    HttpUrl.Builder urlBuilder = HttpUrl.parse("http://18.220.158.71:8080/edu/mofa/jsptest/emp").newBuilder();
    urlBuilder.addQueryParameter("key", key);

    String url = urlBuilder.build().toString();

    Request req = new Request.Builder().url(url).build();

    Employee employee = new Employee();
    try {
        Response res = client.newCall(req).execute();
        String jsonString = res.body().string();
        employee = objectMapper.readValue(jsonString, Employee.class);
    } catch (Exception e) {

    }
    int age = 0;
    if (employee.getAge() != null) {
        age = employee.getAge() + 5;
    }
%>
Your age after 5 years will be <%=age%>
</body>
</html>