package com.clinicmanager.filter;

import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.rowset.serial.SerialException;
import java.io.IOException;

@WebFilter({"/admin/*", "/patient/*"})
public class RoleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request , ServletResponse response , FilterChain chain)
        throws ServletException , IOException
    {

        HttpServletRequest httpRequest =(HttpServletRequest) request;

        HttpServletResponse httpResponse =(HttpServletResponse) response;

        User user =(User) httpRequest.getSession().getAttribute("user");

        String path = httpRequest.getRequestURI();
        if(path.contains("/admin")){
            if(user != null && user.getRole() == Role.ADMIN){
                chain.doFilter(request,response);
                return;
            }
        }else if(path.contains("patient")){
            if(user != null && user.getRole() == Role.PATIENT){
                chain.doFilter(request , response);
                return;
            }
        }
        httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
    }
}
