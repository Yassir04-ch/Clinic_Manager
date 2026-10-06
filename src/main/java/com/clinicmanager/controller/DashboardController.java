package com.clinicmanager.controller;

import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard/*")
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
                            throws ServletException, IOException
    {
        String path = request.getPathInfo();

        if ("/admin".equals(path)) {
            request.getRequestDispatcher("/admin/dashboard.jsp"
                                        ).forward(request, response);
        } else if ("/patient".equals(path)) {
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
