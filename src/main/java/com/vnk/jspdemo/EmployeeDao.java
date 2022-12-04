package com.vnk.jspdemo;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vnk.jspdemo.Constant.Api;
import com.vnk.jspdemo.Model.Employee;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class EmployeeDao {
    ObjectMapper objectMapper = new ObjectMapper();

    public Employee getEmployeeDetails(String key) {
        OkHttpClient client = new OkHttpClient().newBuilder().build();

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
}
