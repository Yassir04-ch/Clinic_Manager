package com.clinicmanager.controller;

import com.clinicmanager.model.Availability;
import com.clinicmanager.model.Doctor;
import com.clinicmanager.model.enums.AvailabilityStatus;
import com.clinicmanager.service.AvailabilityService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

@WebServlet("/availabilities/*")
public class AvailabilityController extends HttpServlet {

    private AvailabilityService availabilityService;

    @Override
    public void init() {
        availabilityService = new AvailabilityService();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        String path = request.getPathInfo();
        if ("/create".equals(path)) {

            String doctorId = request.getParameter("doctorId");
            request.setAttribute("doctorId", doctorId);
            request.getRequestDispatcher("/WEB-INF/views/availabilities/create.jsp").forward(request, response);
            return;
        }

        UUID doctorId = UUID.fromString(request.getParameter("doctorId"));
        List<Availability> availabilities =   availabilityService.findByDoctor(doctorId);
        request.setAttribute("availabilities", availabilities);
        request.setAttribute("doctorId", doctorId);
        request.getRequestDispatcher("/WEB-INF/views/availabilities/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        try {
            UUID doctorId = UUID.fromString(request.getParameter("doctorId"));
            DayOfWeek dayOfWeek = DayOfWeek.valueOf(request.getParameter("dayOfWeek"));
            LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));
            LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));
            AvailabilityStatus status = AvailabilityStatus.valueOf(request.getParameter("status"));
            LocalDate validFrom = LocalDate.parse(request.getParameter("validFrom"));
            LocalDate validTo = LocalDate.parse(request.getParameter("validTo"));
            Doctor doctor = new Doctor();
            doctor.setId(doctorId);
            Availability availability = new Availability(doctor, dayOfWeek, startTime, endTime, status, validFrom, validTo);
            availabilityService.createAvailability(availability);
            response.sendRedirect(request.getContextPath() + "/availabilities?doctorId=" + doctorId);
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/availabilities/create.jsp").forward(request, response);
        }
    }
}