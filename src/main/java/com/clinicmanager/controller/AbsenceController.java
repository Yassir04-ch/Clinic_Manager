package com.clinicmanager.controller;

import com.clinicmanager.exception.InvalidAbsenceException;
import com.clinicmanager.model.Absence;
import com.clinicmanager.model.Doctor;
import com.clinicmanager.model.enums.AbsenceStatus;
import com.clinicmanager.service.AbsenceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

@WebServlet("/absences/*")
public class AbsenceController extends HttpServlet {
    private AbsenceService absenceService = new AbsenceService();

    @Override
    public void doGet(HttpServletRequest request , HttpServletResponse response)
                     throws ServletException , IOException
    {
        HttpSession session = request.getSession(false);
        Doctor doctor =(Doctor) session.getAttribute("user");
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            request.setAttribute("absences", absenceService.findAbsenceByDoctor(doctor.getId()));
            request.getRequestDispatcher("/WEB-INF/views/absences/list.jsp").forward(request, response);
        }
        if("/create".equals(path)){
            request.getRequestDispatcher("/WEB-INF/views/absences/create.jsp").forward(request,response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response)
                       throws ServletException , IOException
    {
        HttpSession session = request.getSession(false);
        Doctor doctor = (Doctor) session.getAttribute("user");

        try {
            String startDateValue = request.getParameter("startDate");
            String endDateValue = request.getParameter("endDate");
            String reason = request.getParameter("reason");

            if (startDateValue == null || startDateValue.isBlank()
                    || endDateValue == null || endDateValue.isBlank()) {
                throw new InvalidAbsenceException("Les dates de début et de fin sont obligatoires.");
            }

            Absence absence = new Absence();
            absence.setDoctor(doctor);
            absence.setStartDate(LocalDate.parse(startDateValue));
            absence.setEndDate(LocalDate.parse(endDateValue));
            absence.setReason(reason);
            absence.setStatus(AbsenceStatus.PENDING);
            absenceService.createAbsence(absence);
            response.sendRedirect(request.getContextPath() + "/absences");

        } catch (InvalidAbsenceException | DateTimeParseException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/absences/create.jsp"
            ).forward(request, response);
        }
    }
}
