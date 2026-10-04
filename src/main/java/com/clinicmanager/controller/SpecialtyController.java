package com.clinicmanager.controller;

import com.clinicmanager.model.Department;
import com.clinicmanager.model.Specialty;
import com.clinicmanager.service.DepartmentService;
import com.clinicmanager.service.SpecialtyService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet("/specialties/*")
public class SpecialtyController extends HttpServlet {

    private final SpecialtyService specialtyService = new SpecialtyService();
    private final DepartmentService departmentService = new DepartmentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getPathInfo();
        if ("/create".equals(path)) {

            List<Department> departments = departmentService.findAll();

            request.setAttribute("departments", departments);
            request.getRequestDispatcher("/WEB-INF/views/specialities/create.jsp").forward(request, response);
        }else if (path != null && path.startsWith("/update/")) {

            String idPath = path.substring("/update/".length());
            UUID id = UUID.fromString(idPath);

            Specialty specialty = specialtyService.findById(id);
            List<Department> departments = departmentService.findAll();

            request.setAttribute("specialty", specialty);
            request.setAttribute("departments", departments);
            request.getRequestDispatcher("/WEB-INF/views/specialities/update.jsp").forward(request, response);
        }
        else if (path == null || "/".equals(path)) {
            List<Specialty> specialties = specialtyService.findAll();
            request.setAttribute("specialties", specialties);
            request.getRequestDispatcher("/WEB-INF/views/specialities/listspeciality.jsp").forward(request, response);
        }
        else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String path = request.getPathInfo();
        if ("/create".equals(path)) {
            String name = request.getParameter("name");
            String departmentId = request.getParameter("departmentId");
            UUID id = UUID.fromString(departmentId);

            Department department = departmentService.findById(id);

            Specialty specialty = new Specialty();
            specialty.setName(name);
            specialty.setDepartment(department);

            specialtyService.createSpeciality(specialty);

            response.sendRedirect(request.getContextPath() + "/specialties");
        }
        else if ("/update".equals(path)) {
            String idParameter = request.getParameter("id");
            String name = request.getParameter("name");
            String departmentId = request.getParameter("departmentId");

            UUID id = UUID.fromString(idParameter);
            UUID departmentUUID = UUID.fromString(departmentId);

            Specialty specialty = specialtyService.findById(id);

            Department department = departmentService.findById(departmentUUID);

            specialty.setName(name);
            specialty.setDepartment(department);

            specialtyService.updateSpecialty(specialty);

            response.sendRedirect(request.getContextPath() + "/specialties");
        }else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
        }
    }
}