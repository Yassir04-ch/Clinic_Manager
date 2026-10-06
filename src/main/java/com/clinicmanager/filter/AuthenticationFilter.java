package com.clinicmanager.filter;

import com.clinicmanager.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response , FilterChain chain)
            throws IOException , ServletException
    {
        HttpServletRequest httpRequest =(HttpServletRequest) request;
        HttpServletResponse httpResponse =(HttpServletResponse) response;

        User user = (User) httpRequest.getSession().getAttribute("user");

        String path = httpRequest.getRequestURI();
        if(user == null){
            if(path.endsWith("login.jsp")|| path.endsWith("/users/login") || path.endsWith("/users.create"))
            {
                chain.doFilter(request,response);
                return;
            }
            httpResponse.sendRedirect(httpRequest.getContextPath()+"/auth/login.jsp");
            return;
        }
        chain.doFilter(request, response);
    }
}
