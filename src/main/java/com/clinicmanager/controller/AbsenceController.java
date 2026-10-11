package com.clinicmanager.controller;

import com.clinicmanager.exception.InvalidAbsenceException;
import com.clinicmanager.model.Absence;
import com.clinicmanager.model.Doctor;
import com.clinicmanager.model.User;
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
import java.util.List;
import java.util.UUID;

@WebServlet("/absences/*")
public class AbsenceController extends HttpServlet {
    private AbsenceService absenceService = new AbsenceService();

    @Override
    public void doGet(HttpServletRequest request , HttpServletResponse response)
                     throws ServletException , IOException
    {
        String path = request.getPathInfo();
        if("/admin".equals(path)){
            List<Absence> absences = absenceService.findAll();
            System.out.println("Absences trouvées : " + absences.size());
            request.setAttribute("absences",absences);
            request.getRequestDispatcher("/WEB-INF/views/admin/absences.jsp").forward(request,response);
            return;
        }

        HttpSession session = request.getSession(false);
        Doctor doctor =(Doctor) session.getAttribute("user");
        if (path == null || path.equals("/")) {
            request.setAttribute("absences", absenceService.findAbsenceByDoctor(doctor.getId()));
            request.getRequestDispatcher("/WEB-INF/views/absences/list.jsp").forward(request, response);
        }else if("/create".equals(path)){
            request.getRequestDispatcher("/WEB-INF/views/absences/create.jsp").forward(request,response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response)
                       throws ServletException , IOException
    {
        String path = request.getPathInfo();

        if("/approve".equals(path)){
            String requestId = request.getParameter("id");
            UUID id = UUID.fromString(requestId);
            Absence absence = absenceService.find(id);
            absence.setStatus(AbsenceStatus.APPROVED);
            absenceService.update(absence);
            response.sendRedirect(request.getContextPath() + "/absences/admin");
            return;
        }

        if("/rejected".equals(path)){
            String requestId = request.getParameter("id");
            UUID id = UUID.fromString(requestId);
            Absence absence = absenceService.find(id);
            absence.setStatus(AbsenceStatus.REJECTED);
            absenceService.update(absence);
            response.sendRedirect(request.getContextPath() + "/absences/admin");
            return;
        }

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
