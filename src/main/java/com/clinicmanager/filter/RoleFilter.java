package com.clinicmanager.filter;

import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter({
        "/dashboard/*",
        "/users/create/*",
        "/appointments/*",
        "/availabilities/*",
        "/departments/*",
        "/specialties/*"
})
public class RoleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain
    ) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);

        User user = null;
        if (session != null) {
            Object userAttribute = session.getAttribute("user");
            if (userAttribute instanceof User) {
                user = (User) userAttribute;
            }
        }

        if (user == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/users/login");
            return;
        }

        String servletPath = httpRequest.getServletPath();
        String path = httpRequest.getPathInfo();

        Role role = user.getRole();
        if (role == Role.ADMIN) {
            if ("/users/create".equals(servletPath)) {
                chain.doFilter(request, response);
                return;
            }
            if ("/appointments".equals(servletPath)) {
                if (path == null || "/".equals(path) || "/status".equals(path)) {
                    chain.doFilter(request, response);
                    return;
                }
            }

            if ("/departments".equals(servletPath)) {
                if (path == null || "/".equals(path) || "/create".equals(path) || (path != null && path.startsWith("/update/"))) {
                    chain.doFilter(request, response);
                    return;
                }
            }

            if ("/specialties".equals(servletPath)) {
                if (path == null || "/".equals(path) || "/create".equals(path) || (path != null && path.startsWith("/update/"))) {
                    chain.doFilter(request, response);
                    return;
                }
            }

            // Dashboard
            if ("/dashboard".equals(servletPath)) {
                if (path == null || "/".equals(path) || "/admin".equals(path)) {
                    chain.doFilter(request, response);
                    return;
                }
            }
        }

        // STAFF
        if (role == Role.STAFF) {

            if ("/dashboard".equals(servletPath)) {
                if ("/staff".equals(path)) {
                    chain.doFilter(request, response);
                    return;
                }
            }

            if("/appointments".equals(servletPath)){
                chain.doFilter(request, response);
                return;
            }
        }

        // PATIENT
        if (role == Role.PATIENT) {

            if ("/dashboard".equals(servletPath)) {
                if (path == null || "/".equals(path) || "/patient".equals(path)) {
                    chain.doFilter(request, response);
                    return;
                }
            }

            if ("/appointments".equals(servletPath)) {
                if ("/create".equals(path) || "/patient".equals(path)) {
                    chain.doFilter(request, response);
                    return;
                }
            }
        }

        if (role == Role.DOCTOR) {
            if ("/availabilities".equals(servletPath)) {
                if (path == null || "/".equals(path) || "/create".equals(path) || (path != null && path.startsWith("/update/")) || (path != null && path.startsWith("/delete/"))) {
                    chain.doFilter(request, response);
                    return;
                }
            }

            if ("/appointments".equals(servletPath)) {
                if ("/doctor".equals(path)) {
                    chain.doFilter(request, response);
                    return;
                }
            }

            if ("/dashboard".equals(servletPath)) {
                if (path == null || "/".equals(path) || "/doctor".equals(path)) {
                    chain.doFilter(request, response);
                    return;
                }
            }
        }
        httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
    }
}
