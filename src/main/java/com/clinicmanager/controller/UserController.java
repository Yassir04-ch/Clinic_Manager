package com.clinicmanager.controller;

import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;
import com.clinicmanager.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet({"/users/create", "/users/logout"})

public class UserController extends HttpServlet {

    private final UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String servletPath = request.getServletPath();
        if("/users/create".equals(servletPath)){
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
        }else if("/users/logout".equals(servletPath)){
            HttpSession session = request.getSession(false);
            if(session != null){
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/users/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPassword(password);
        user.setPhone(phone);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(Role.PATIENT);
        this.userService.createUser(user);
        response.sendRedirect(request.getContextPath() + "/test.jsp");
    }




}
