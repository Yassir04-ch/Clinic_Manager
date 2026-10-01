package com.clinicmanager.controller;

import com.clinicmanager.exception.InvalidCredentialsException;
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

@WebServlet("/users/login")
public class LoginController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            User user = this.userService.login(email, password);
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            if (user.getRole() == Role.ADMIN) {
                response.sendRedirect(request.getContextPath() + "/dashboard/admin");
            } else if (user.getRole() == Role.PATIENT) {
                response.sendRedirect(request.getContextPath() + "/dashboard/patient");
            } else if (user.getRole() == Role.DOCTOR) {
                response.sendRedirect(request.getContextPath() + "/dashboard/doctor");
            }  else if (user.getRole() == Role.STAFF) {
                response.sendRedirect(request.getContextPath() + "/dashboard/staff");
            }
        }catch (InvalidCredentialsException e){
            request.setAttribute("erreur",e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        }

    }
}
