package com.clinicmanager.filter;

import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter({"/dashboard/*", "/users/create/*" , "/appointments/*" , "/availabilities/*","/departments/*","/specialties/*"})
public class RoleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request , ServletResponse response , FilterChain chain)
        throws ServletException , IOException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;

        HttpServletResponse httpResponse = (HttpServletResponse) response;

        User user = (User) httpRequest.getSession().getAttribute("user");

        String path = httpRequest.getPathInfo();
        String pathServ = httpRequest.getServletPath();
        if ("/admin".equals(path) || "/users/create".equals(pathServ)) {
            if (user != null && user.getRole() == Role.ADMIN) {
                chain.doFilter(request, response);
                return;
            }
        }
        if ("/patient".equals(path) || "/appointments".equals(pathServ)) {
            if (user != null && user.getRole() == Role.PATIENT) {
                chain.doFilter(request, response);
                return;
            }
        }
        if ("/doctor".equals(path)) {
            if (user != null && user.getRole() == Role.DOCTOR) {
                chain.doFilter(request, response);
                return;
            }
        }
        if ("/availabilities".equals(pathServ)) {
            if ("/create".equals(path) || (path != null && path.startsWith("/update/")) || (path != null && path.startsWith("/delete/"))) {
                System.out.println(user.getRole());
                if (user != null && user.getRole() == Role.DOCTOR) {
                    chain.doFilter(request, response);
                    return;
                }
            }
        }
        if ("/departments".equals(pathServ) || "/specialties".equals(pathServ)) {
            if ("/create".equals(path) || (path != null && path.startsWith("/update/"))) {
                if (user != null && user.getRole() == Role.ADMIN) {
                    chain.doFilter(request, response);
                    return;
                }
            }
        }

        httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
      }
    }
