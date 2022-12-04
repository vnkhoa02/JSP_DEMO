package com.vnk.jspdemo;

import com.vnk.jspdemo.Model.Employee;
import com.vnk.jspdemo.StatusCode.StatusCode;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "ServletDemo", value = "/employee")
public class EmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static EmployeeDao employeeDao = new EmployeeDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String key = req.getParameter("key");
        Employee employee = employeeDao.getEmployeeDetails(key);

        req.getSession().setAttribute("employee", employee);
        req.getSession().setAttribute("childs", employee.getChilds());
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_method");
        if (Objects.equals(method, "PUT")) {
            doPut(req, resp);
        } else if (Objects.equals(method, "DELETE")) {
            doDelete(req, resp);
        } else {
            String key = req.getParameter("key");
            String name = req.getParameter("name");
            String age = req.getParameter("age");
            Employee employee = new Employee();
            employee.setName(name);
            employee.setAge(Integer.valueOf(age));

            StatusCode statusCode = employeeDao.insertEmployee(key, employee);
            req.getSession().setAttribute("statusCode", statusCode);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("key");
        String name = req.getParameter("name");
        String age = req.getParameter("age");
        Employee employee = new Employee();

        employee.setKey(key);
        employee.setName(name);
        employee.setAge(Integer.valueOf(age));

        StatusCode statusCode = employeeDao.updateEmployee(employee);
        req.getSession().setAttribute("statusCode", statusCode);

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("key");

        StatusCode statusCode = employeeDao.deleteEmployee(key);
        req.getSession().setAttribute("statusCode", statusCode);

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
