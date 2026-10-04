package com.clinicmanager.controller;

import com.clinicmanager.model.Doctor;
import com.clinicmanager.model.Patient;
import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Gender;
import com.clinicmanager.model.enums.Role;
import com.clinicmanager.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet({"/users/create/*", "/users/logout"})

public class UserController extends HttpServlet {

    private final UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();
        String servletPath = request.getServletPath();

        if ("/users/create".equals(servletPath)) {

            if (path == null || "/".equals(path)) {
                response.sendRedirect(request.getContextPath() + "/users/create/patient");
                return;
            }

            switch (path) {
                case "/patient":
                    request.getRequestDispatcher("/auth/create_patient.jsp").forward(request, response);
                    break;
                case "/doctor":
                    request.getRequestDispatcher("/auth/create_doctor.jsp").forward(request, response);
                    break;
                case "/user":
                    request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
            }

        }else if ("/users/logout".equals(servletPath)) {

            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/users/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String roleParameter = request.getParameter("role");

        if (roleParameter == null || roleParameter.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Role is required");
            return;
        }

        Role role;

        try {
            role = Role.valueOf(roleParameter.toUpperCase());

        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid role");
            return;
        }

        User user = null;

        if (role == Role.PATIENT) {

            Patient patient = new Patient();
            patient.setFirstName(firstName);
            patient.setLastName(lastName);
            patient.setPhone(phone);
            patient.setEmail(email);
            patient.setPassword(password);
            patient.setRole(Role.PATIENT);
            patient.setActive(true);

            String cin = request.getParameter("cin");
            String address = request.getParameter("address");
            String dateOfBir = request.getParameter("dateOfBirth");
            String genderpar = request.getParameter("gender");
            String bloodGroup = request.getParameter("bloodGroup");

            patient.setCin(cin);
            patient.setAddress(address);
            patient.setBloodGroup(bloodGroup);
            LocalDate dateOfBirth = LocalDate.parse(dateOfBir);
            patient.setDateOfBirth(dateOfBirth);
            Gender gender = Gender.valueOf(genderpar.toUpperCase());
            patient.setGender(gender);

            user = patient;

        } else if (role == Role.DOCTOR) {

            Doctor doctor = new Doctor();
            doctor.setFirstName(firstName);
            doctor.setLastName(lastName);
            doctor.setPhone(phone);
            doctor.setEmail(email);
            doctor.setPassword(password);
            doctor.setRole(Role.DOCTOR);
            doctor.setActive(true);

            String matricule = request.getParameter("matricule");
            String title = request.getParameter("title");

            doctor.setMatricule(matricule);
            doctor.setTitle(title);

            user = doctor;

        }else {
            User staff = new User();
            staff.setFirstName(firstName);
            staff.setLastName(lastName);
            staff.setPhone(phone);
            staff.setEmail(email);
            staff.setPassword(password);
            staff.setRole(Role.DOCTOR);
            staff.setActive(true);
        }
        userService.createUser(user);

        response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
    }



}
