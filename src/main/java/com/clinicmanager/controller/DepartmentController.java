package com.clinicmanager.controller;

import com.clinicmanager.model.Department;
import com.clinicmanager.service.DepartmentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/departments/*")
public class DepartmentController extends HttpServlet {

    private final DepartmentService departmentService = new DepartmentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException , IOException
    {
        String path = request.getPathInfo();

        System.out.println("================================");
        System.out.println("REQUEST URI  = " + request.getRequestURI());
        System.out.println("CONTEXT PATH = " + request.getContextPath());
        System.out.println("SERVLET PATH = " + request.getServletPath());
        System.out.println("PATH INFO    = " + request.getPathInfo());
        System.out.println("================================");
        if("/create".equals(path)){
            request.getRequestDispatcher("/WEB-INF/views/departments/create.jsp"
                                        ).forward(request, response);
        }else if(path != null && path.startsWith("/update/")){
            String idPath  = path.substring("/update/".length());
            UUID id = UUID.fromString(idPath);
            Department department =this.departmentService.findById(id);
            request.setAttribute("department" , department);
            request.getRequestDispatcher("/WEB-INF/views/departments/update.jsp"
                                        ).forward(request, response);
        }else if (path == null  || "/".equals(path)) {
            request.setAttribute("departments", departmentService.findAll());
            request.getRequestDispatcher("/WEB-INF/views/departments/listdepartment.jsp"
                                        ).forward(request, response);
        }else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String path = request.getPathInfo();

        if ("/create".equals(path)) {

            String name = request.getParameter("name");
            String description = request.getParameter("description");

            Department department = new Department();
            department.setName(name);
            department.setDescription(description);
            departmentService.createDepartment(department);
            response.sendRedirect(request.getContextPath() + "/departments");
        }else if("/update".equals(path)){


            String idinfo = request.getParameter("id");
            UUID id = UUID.fromString(idinfo);
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            Department department = departmentService.findById(id);
            department.setName(name);
            department.setDescription(description);
            departmentService.updateDepartment(department);
            response.sendRedirect(request.getContextPath() + "/departments");
        }else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
        }
    }
}
