package com.vnk.jspdemo;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.vnk.jspdemo.Constant.Api;
import com.vnk.jspdemo.Model.Employee;
import com.vnk.jspdemo.StatusCode.StatusCode;
import okhttp3.*;
import org.json.JSONObject;

public class EmployeeDao {
    ObjectMapper objectMapper = new ObjectMapper();

    OkHttpClient client = new OkHttpClient().newBuilder().build();

    public Employee getEmployeeDetails(String key) {

        HttpUrl.Builder urlBuilder = HttpUrl.parse(Api.BASE_URL + Api.GET_EMPLOYEE_DETAILS).newBuilder();
        urlBuilder.addQueryParameter("key", key);

        String url = urlBuilder.build().toString();

        Request request = new Request.Builder().url(url).build();

        Employee employee = new Employee();
        try {
            Response response = client.newCall(request).execute();
            String jsonString = response.body().string();
            employee = objectMapper.readValue(jsonString, Employee.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employee;
    }

    public StatusCode insertEmployee(String key, Employee employee) {
        HttpUrl.Builder urlBuilder = HttpUrl.parse(Api.BASE_URL + Api.INSERT_EMPLOYEE).newBuilder();

        urlBuilder.addQueryParameter("key", key);

        String url = urlBuilder.build().toString();

        MediaType mediaType = MediaType.parse("application/json;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("name", employee.getName());
        jsonObject.put("age", employee.getAge());

        RequestBody formBody = RequestBody.create(mediaType, jsonObject.toString());

        Request request = new Request.Builder().
                url(url).
                post(formBody).
                build();

        StatusCode statusCode = new StatusCode();
        try {
            Response response = client.newCall(request).execute();
            String jsonString = response.body().string();
            statusCode = objectMapper.readValue(jsonString, StatusCode.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return statusCode;
    }

    public StatusCode updateEmployee(Employee employee) {
        HttpUrl.Builder urlBuilder = HttpUrl.parse(Api.BASE_URL + Api.UPDATE_EMPLOYEE_DETAILS).newBuilder();

        String url = urlBuilder.build().toString();
        MediaType mediaType = MediaType.parse("application/json;charset=utf-8");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("key", employee.getKey());
        jsonObject.put("name", employee.getName());
        jsonObject.put("age", employee.getAge());
        RequestBody formBody = RequestBody.create(mediaType, jsonObject.toString());

        Request request = new Request.Builder().
                url(url).
                put(formBody).
                build();

        StatusCode statusCode = new StatusCode();
        String jsonString = "";
        try {
            Response response = client.newCall(request).execute();
            jsonString = response.body().string();
            statusCode = objectMapper.readValue(jsonString, StatusCode.class);
        } catch (Exception e) {
            statusCode.setResultMessage(jsonString);
        }
        return statusCode;
    }

    public StatusCode deleteEmployee(String key) {
        HttpUrl.Builder urlBuilder = HttpUrl.parse(Api.BASE_URL + Api.DELETE_EMPLOYEE_DETAILS).newBuilder();

        urlBuilder.addQueryParameter("key", key);

        String url = urlBuilder.build().toString();

        Request request = new Request.Builder().url(url).delete().build();

        StatusCode statusCode = new StatusCode();
        try {
            Response response = client.newCall(request).execute();
            String jsonString = response.body().string();
            System.out.println(jsonString);
            statusCode = objectMapper.readValue(jsonString, StatusCode.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return statusCode;
    }
}
