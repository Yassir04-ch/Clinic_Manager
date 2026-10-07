package com.clinicmanager.controller;

import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;
import com.clinicmanager.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard/*")
public class  DashboardController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                            throws ServletException, IOException
    {
        String path = request.getPathInfo();

        if ("/admin".equals(path)) {
            request.getRequestDispatcher("/admin/dashboard.jsp"
                                        ).forward(request, response);
        } else if ("/patient".equals(path)) {
            List<User> doctors = userService.findByRole(Role.DOCTOR);
            request.setAttribute("doctors",doctors);
            request.getRequestDispatcher("/patient/dashboard.jsp"
                                        ).forward(request, response);
        } else if ("/doctor".equals(path)) {
            request.getRequestDispatcher("/doctor/dashboard.jsp"
                                        ).forward(request, response);
        } else if ("/staff".equals(path)) {
            request.getRequestDispatcher("/staff/dashboard.jsp"
                                        ).forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
